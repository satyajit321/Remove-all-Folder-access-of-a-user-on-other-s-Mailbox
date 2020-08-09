<#
.SYNOPSIS
Sample Script - use at your own risk, no warranties or guarantees.
Checks Exchange mailbox permissions and removes all access for the specified mailbox user
or distribution group. Evaluates each folder, including user created folders. If 
the permissions for any level of access are not set on a folder, no changes are made. Actions
are recorded to a log file in the same folder as the script. The log file is named using the
current date/time and the alias of the mailbox: ReadOnlyPermissionsRemoval_<mailbox>_<datetime>.log

.DESCRIPTION
Removes mailbox access permissions on the specified mailbox for the specified user or group.
Total folders evaluated, might vary based on RBAC permissions on the administrator (Recovery,Purges etc.)
But only standard and user folders actioned upon. 

.PARAMETER Mailbox
Specify the mailbox from which permissions will be removed.
This required parameter can be in the form of email address or mailbox alias.

.PARAMETER User
Specify the user of group for which access rights will be removed on the mailbox.

.EXAMPLE\USAGE
Remove-ReadOnlyMailboxPermissionsRemoval -Mailbox user1@contoso.com -User user2@contoso.com
This will remove permissions for all access on user1@contoso.com mailbox for user user2@contoso.com

Updated\Modified by Satyajit321
#>


[CmdletBinding()]

Param
	([Parameter(Mandatory=$True,Position=0)]
	[string]$Mailbox,
        [Parameter(Mandatory=$True,Position=1)]
	[string]$User)

# Variables to count number of folders processed

# Confirm mailbox is valid
$mailboxchecked = Get-Mailbox $mailbox -ErrorAction SilentlyContinue
if (!$mailboxchecked) {
	Write-Host "$mailbox is not a valid mailbox. Please check that you have entered the correct identity for the mailbox"
	exit}

# Confirm the user or group is valid

if ($userchecked = Get-Mailbox $user -ErrorAction SilentlyContinue) {}
elseif ($userchecked = Get-DistributionGroup $user -ErrorAction SilentlyContinue) {}
else {
	Write-Host "$user is not a valid user or group. Please check that you have entered the correct identity for the user or group"
	exit}

$foldercount = 0
$folderset = 0
$folderskip = 0

# Create Log File for Write-Log Function
Function Create-Log()
{
	$date = (Get-Date).ToString('yyyyMMdd-HHmmss')
	$global:LogFile = New-Item -Itemtype file "$PWD\ReadOnlyPermissionsRemoval-$mailbox-$date.log" -Force
}

# Call Function to create logfile
Create-Log

# Output to the screen and to the logfile

Function Write-Log($txt)
{
 	Add-Content $global:LogFile $txt
 	Write-Host $txt -ForegroundColor Green
}

# Test the permissions set on each folder so that we do not take any action if no permissions are set for the user

Function Validate-RootPermissions ($rootcheck) {

Write-Verbose "Validating permissions on root $rootcheck"

$script:foldercount++
$rootcheckset = Get-MailboxFolderPermission $rootcheck | where {$_.User -like $userchecked.DisplayName}

if (!$rootcheckset) {
	Write-Log "Root folder $rootcheck has no permissions set for user $($userchecked.DisplayName)"
	Write-Log "Skipping permissions change for the root"
	$script:folderskip++
	Return}
else {
	Write-Log "Removing $($rootcheckset.AccessRights) AccessRights on folder $rootcheck"
	try
	{
		$continue = $true
		Remove-MailboxFolderPermission $rootcheck -User $userchecked -ErrorAction Stop -Confirm:$false | Out-Null
	}
	catch
	{
		Write-Log "Failed to remove AccessRights on folder $rootcheck. Error $_.Exception.Message"
		$continue = $false
	}
	if ($continue)
	{
		Write-Log "Successfully removed AccessRights on folder $rootcheck"
		$script:folderset++
	}
	Return}
}

Function Validate-Permissions ($foldercheck) {
	
Write-Verbose "Validating permissions on folder $foldercheck"

$script:foldercount++
$checkset = Get-MailboxFolderPermission $foldercheck | where {$_.User -like $userchecked.DisplayName}

if (!$checkset) {
	Write-Log "Folder $foldercheck has no permissions set for user $($userchecked.DisplayName)"
	Write-Log "Skipping permissions change for this folder"
	$script:folderskip++
	Return}
else {
	Write-Log "Removing $($checkset.AccessRights) and all other AccessRights on folder $foldercheck"
	try
	{
		$continue = $true
		Remove-MailboxFolderPermission $foldercheck -User $userchecked -ErrorAction Stop -Confirm:$false | Out-Null
	}
	catch
	{
		Write-Log "Failed to remove AccessRights on folder $foldercheck. Error $_.Exception.Message"
		$continue = $false
	}
	if ($continue)
	{
		Write-Log "Successfully removed AccessRights on folder $foldercheck"
		$script:folderset++
	}		
	Return}
}

# create an array of mailbox statistic information

$folders = Get-MailboxFolderStatistics $mailbox

# process the mailbox folders to add the required permissions to each if not already set

Write-log "Processing actions to remove access rights for user $($userchecked.DisplayName) from mailbox $($mailboxchecked.DisplayName)"

foreach($folder in $folders){

$rootid = ($mailboxchecked.alias + ":\")

$foldername = $folder.identity.tostring()

$folderid = $foldername.Insert($foldername.IndexOf("\"), ':')

Write-Verbose "Checking folder $folderid against known folder types"

switch ($folder.FolderType) {
	"Root"		{Validate-RootPermissions $rootid}
	"Calendar"	{Validate-Permissions $folderid}
	"Contacts"	{Validate-Permissions $folderid}
	"DeletedItems"	{Validate-Permissions $folderid}
	"Drafts"	{Validate-Permissions $folderid}
	"Inbox"		{Validate-Permissions $folderid}
	"Journal"	{Validate-Permissions $folderid}
	"JunkEmail"	{Validate-Permissions $folderid}
	"Notes"		{Validate-Permissions $folderid}
	"Outbox"	{Validate-Permissions $folderid}
	"SentItems"	{Validate-Permissions $folderid}
	"Tasks"		{Validate-Permissions $folderid}
	"User Created"	{Validate-Permissions $folderid}
	}
}

Write-Log "Processing complete. $foldercount total folders evaluated, $folderset folders permission removed, $folderskip folders skipped because no permissions present."