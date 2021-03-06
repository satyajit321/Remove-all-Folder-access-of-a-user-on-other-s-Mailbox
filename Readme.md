<div><strong>SYNOPSIS</strong><br /> Sample Script - use at your own risk, no warranties or guarantees.<br /> Checks Exchange mailbox permissions and removes all access for the specified mailbox user<br /> or distribution group. Evaluates each folder, including user created folders. If <br /> the permissions for any level of access are not set on a folder, no changes are made. Actions<br /> are recorded to a log file in the same folder as the script. The log file is named using the<br /> current date/time and the alias of the mailbox: ReadOnlyPermissionsRemoval_&lt;mailbox&gt;_&lt;datetime&gt;.log</div>
<div><strong>DESCRIPTION</strong><br /> Removes mailbox access permissions on the specified mailbox for the specified user or group.<br /> Total folders evaluated, might vary based on RBAC permissions on the administrator (Recovery,Purges etc.)<br /> But only standard and user folders actioned upon.</div>
<div><strong>PARAMETER Mailbox</strong><br /> Specify the mailbox from which permissions will be removed.<br /> This required parameter can be in the form of email address or mailbox alias.</div>
<div><strong>PARAMETER User</strong><br /> Specify the user of group for which access rights will be removed on the mailbox.</div>
<div><strong>EXAMPLE\USAGE</strong><br /> Remove-ReadOnlyMailboxPermissionsRemoval -Mailbox <a href="mailto:user1@contoso.com"> user1@contoso.com</a> -User <a href="mailto:user2@contoso.com">user2@contoso.com</a><br /> This will remove permissions for all access on <a href="mailto:user1@contoso.com"> user1@contoso.com</a> mailbox for user <a href="mailto:user2@contoso.com">user2@contoso.com</a></div>
<div>Even though&nbsp;this is&nbsp;testing&nbsp;against Exchange 2013, cmdlets havn't changed much since Exchange 2010. Hence should work there as well.</div>
<div>
<p>Updated\Modified by Satyajit321</p>
</div>
<div>NOTE:- This script has been derived from Add-ReadOnlyMailboxPermissions.ps1 as mentioned in the references section. (After correcting Syntax errors and parameter mismatch and new logic.)</div>
<div></div>
<div>&nbsp;</div>
<div>You can access the other half of the script that does exactly the opposite of what this does.<br /> <br /> Add all Folder access of a user on other's Mailbox.<br /> <br /> <a href=" https://gallery.technet.microsoft.com/exchange/Add-all-Folder-access-of-a-61248720">https://gallery.technet.microsoft.com/exchange/Add-all-Folder-access-of-a-61248720</a><br /> <br /> <br /></div>
<div></div>
<div>&nbsp;</div>
<div><strong>Sample Script Run: </strong></div>
<div>Remove-ReadOnlyMailboxPermissionsRemoval.ps1 -Mailbox User1 -User User2</div>
<div>
<div class="scriptcode">
<div class="pluginEditHolder" pluginCommand="mceScriptCode">
<div class="title"><span>PowerShell</span></div>
<div class="pluginLinkHolder"><span class="pluginEditHolderLink">Edit</span>|<span class="pluginRemoveHolderLink">Remove</span></div>
<span class="hidden">powershell</span>
<pre class="hidden">[PS] C:\Scripts&gt;.\Remove-ReadOnlyMailboxPermissions.ps1 -Mailbox User1 -User User2
Processing actions to remove access rights for user User2 from mailbox User1
Removing FolderVisible AccessRights on folder User1:\
Successfully removed AccessRights on folder User1:\
Folder User1:\Calendar has no permissions set for user User2
Skipping permissions change for this folder
Folder User1:\Contacts has no permissions set for user User2
Skipping permissions change for this folder
Folder User1:\Deleted Items has no permissions set for user User2
Skipping permissions change for this folder
Folder User1:\Drafts has no permissions set for user User2
Skipping permissions change for this folder
Folder User1:\Inbox has no permissions set for user User2
Skipping permissions change for this folder
Folder User1:\Journal has no permissions set for user User2
Skipping permissions change for this folder
Folder User1:\Junk Email has no permissions set for user User2
Skipping permissions change for this folder
Folder User1:\Notes has no permissions set for user User2
Skipping permissions change for this folder
Folder User1:\Outbox has no permissions set for user User2
Skipping permissions change for this folder
Folder User1:\Sent Items has no permissions set for user User2
Skipping permissions change for this folder
Folder User1:\Tasks has no permissions set for user User2
Skipping permissions change for this folder
Processing complete. 12 total folders evaluated, 1 folders permission removed, 11 folders skipped because no permissions
 present.</pre>
<div class="preview">
<pre class="powershellworkflow">[<span class="powerShellWorkflow__alias">PS</span>]&nbsp;C:\Scripts&gt;.\Remove<span class="powerShellWorkflow__operator">-</span>ReadOnlyMailboxPermissions.ps1&nbsp;<span class="powerShellWorkflow__operator">-</span>Mailbox&nbsp;User1&nbsp;<span class="powerShellWorkflow__operator">-</span>User&nbsp;User2&nbsp;
Processing&nbsp;actions&nbsp;to&nbsp;remove&nbsp;access&nbsp;rights&nbsp;<span class="powerShellWorkflow__keyword">for</span>&nbsp;user&nbsp;User2&nbsp;<span class="powerShellWorkflow__keyword">from</span>&nbsp;mailbox&nbsp;User1&nbsp;
Removing&nbsp;FolderVisible&nbsp;AccessRights&nbsp;on&nbsp;folder&nbsp;User1:\&nbsp;
Successfully&nbsp;removed&nbsp;AccessRights&nbsp;on&nbsp;folder&nbsp;User1:\&nbsp;
Folder&nbsp;User1:\Calendar&nbsp;has&nbsp;no&nbsp;permissions&nbsp;set&nbsp;<span class="powerShellWorkflow__keyword">for</span>&nbsp;user&nbsp;User2&nbsp;
Skipping&nbsp;permissions&nbsp;change&nbsp;<span class="powerShellWorkflow__keyword">for</span>&nbsp;this&nbsp;folder&nbsp;
Folder&nbsp;User1:\Contacts&nbsp;has&nbsp;no&nbsp;permissions&nbsp;set&nbsp;<span class="powerShellWorkflow__keyword">for</span>&nbsp;user&nbsp;User2&nbsp;
Skipping&nbsp;permissions&nbsp;change&nbsp;<span class="powerShellWorkflow__keyword">for</span>&nbsp;this&nbsp;folder&nbsp;
Folder&nbsp;User1:\Deleted&nbsp;Items&nbsp;has&nbsp;no&nbsp;permissions&nbsp;set&nbsp;<span class="powerShellWorkflow__keyword">for</span>&nbsp;user&nbsp;User2&nbsp;
Skipping&nbsp;permissions&nbsp;change&nbsp;<span class="powerShellWorkflow__keyword">for</span>&nbsp;this&nbsp;folder&nbsp;
Folder&nbsp;User1:\Drafts&nbsp;has&nbsp;no&nbsp;permissions&nbsp;set&nbsp;<span class="powerShellWorkflow__keyword">for</span>&nbsp;user&nbsp;User2&nbsp;
Skipping&nbsp;permissions&nbsp;change&nbsp;<span class="powerShellWorkflow__keyword">for</span>&nbsp;this&nbsp;folder&nbsp;
Folder&nbsp;User1:\Inbox&nbsp;has&nbsp;no&nbsp;permissions&nbsp;set&nbsp;<span class="powerShellWorkflow__keyword">for</span>&nbsp;user&nbsp;User2&nbsp;
Skipping&nbsp;permissions&nbsp;change&nbsp;<span class="powerShellWorkflow__keyword">for</span>&nbsp;this&nbsp;folder&nbsp;
Folder&nbsp;User1:\Journal&nbsp;has&nbsp;no&nbsp;permissions&nbsp;set&nbsp;<span class="powerShellWorkflow__keyword">for</span>&nbsp;user&nbsp;User2&nbsp;
Skipping&nbsp;permissions&nbsp;change&nbsp;<span class="powerShellWorkflow__keyword">for</span>&nbsp;this&nbsp;folder&nbsp;
Folder&nbsp;User1:\Junk&nbsp;Email&nbsp;has&nbsp;no&nbsp;permissions&nbsp;set&nbsp;<span class="powerShellWorkflow__keyword">for</span>&nbsp;user&nbsp;User2&nbsp;
Skipping&nbsp;permissions&nbsp;change&nbsp;<span class="powerShellWorkflow__keyword">for</span>&nbsp;this&nbsp;folder&nbsp;
Folder&nbsp;User1:\Notes&nbsp;has&nbsp;no&nbsp;permissions&nbsp;set&nbsp;<span class="powerShellWorkflow__keyword">for</span>&nbsp;user&nbsp;User2&nbsp;
Skipping&nbsp;permissions&nbsp;change&nbsp;<span class="powerShellWorkflow__keyword">for</span>&nbsp;this&nbsp;folder&nbsp;
Folder&nbsp;User1:\Outbox&nbsp;has&nbsp;no&nbsp;permissions&nbsp;set&nbsp;<span class="powerShellWorkflow__keyword">for</span>&nbsp;user&nbsp;User2&nbsp;
Skipping&nbsp;permissions&nbsp;change&nbsp;<span class="powerShellWorkflow__keyword">for</span>&nbsp;this&nbsp;folder&nbsp;
Folder&nbsp;User1:\Sent&nbsp;Items&nbsp;has&nbsp;no&nbsp;permissions&nbsp;set&nbsp;<span class="powerShellWorkflow__keyword">for</span>&nbsp;user&nbsp;User2&nbsp;
Skipping&nbsp;permissions&nbsp;change&nbsp;<span class="powerShellWorkflow__keyword">for</span>&nbsp;this&nbsp;folder&nbsp;
Folder&nbsp;User1:\Tasks&nbsp;has&nbsp;no&nbsp;permissions&nbsp;set&nbsp;<span class="powerShellWorkflow__keyword">for</span>&nbsp;user&nbsp;User2&nbsp;
Skipping&nbsp;permissions&nbsp;change&nbsp;<span class="powerShellWorkflow__keyword">for</span>&nbsp;this&nbsp;folder&nbsp;
Processing&nbsp;complete.&nbsp;12&nbsp;total&nbsp;folders&nbsp;evaluated,&nbsp;1&nbsp;folders&nbsp;permission&nbsp;removed,&nbsp;11&nbsp;folders&nbsp;skipped&nbsp;because&nbsp;no&nbsp;permissions&nbsp;
&nbsp;present.<strong><br /></strong></pre>
<strong>&nbsp;</strong></div>
<strong>&nbsp;</strong></div>
<strong>&nbsp;</strong></div>
<div class="endscriptcode">
<div><strong>Sample Output Log:</strong></div>
<div>ReadOnlyPermissionsRemoval-User1-20150519-213701.log</div>
<div><strong>
<div class="scriptcode">
<div class="pluginEditHolder" pluginCommand="mceScriptCode">
<div class="title"><span>PowerShell</span></div>
<div class="pluginLinkHolder"><span class="pluginEditHolderLink">Edit</span>|<span class="pluginRemoveHolderLink">Remove</span></div>
<span class="hidden">powershell</span>
<pre class="hidden">Processing actions to remove access rights for user User2 from mailbox User1
Removing FolderVisible AccessRights on folder User1:\
Successfully removed AccessRights on folder User1:\
Removing Reviewer and all other AccessRights on folder User1:\Calendar
Successfully removed AccessRights on folder User1:\Calendar
Removing Reviewer and all other AccessRights on folder User1:\Contacts
Successfully removed AccessRights on folder User1:\Contacts
Removing Reviewer and all other AccessRights on folder User1:\Deleted Items
Successfully removed AccessRights on folder User1:\Deleted Items
Removing Reviewer and all other AccessRights on folder User1:\Drafts
Successfully removed AccessRights on folder User1:\Drafts
Removing Reviewer and all other AccessRights on folder User1:\Inbox
Successfully removed AccessRights on folder User1:\Inbox
Removing Reviewer and all other AccessRights on folder User1:\Journal
Successfully removed AccessRights on folder User1:\Journal
Removing Reviewer and all other AccessRights on folder User1:\Junk Email
Successfully removed AccessRights on folder User1:\Junk Email
Removing Reviewer and all other AccessRights on folder User1:\Notes
Successfully removed AccessRights on folder User1:\Notes
Removing Reviewer and all other AccessRights on folder User1:\Outbox
Successfully removed AccessRights on folder User1:\Outbox
Removing Reviewer and all other AccessRights on folder User1:\Sent Items
Successfully removed AccessRights on folder User1:\Sent Items
Removing Reviewer and all other AccessRights on folder User1:\Tasks
Successfully removed AccessRights on folder User1:\Tasks
Processing complete. 12 total folders evaluated, 12 folders permission removed, 0 folders skipped because no permissions present.
</pre>
<div class="preview">
<pre class="powershell">Processing&nbsp;actions&nbsp;to&nbsp;remove&nbsp;access&nbsp;rights&nbsp;<span class="powerShell__keyword">for</span>&nbsp;user&nbsp;User2&nbsp;<span class="powerShell__keyword">from</span>&nbsp;mailbox&nbsp;User1&nbsp;
Removing&nbsp;FolderVisible&nbsp;AccessRights&nbsp;on&nbsp;folder&nbsp;User1:\&nbsp;
Successfully&nbsp;removed&nbsp;AccessRights&nbsp;on&nbsp;folder&nbsp;User1:\&nbsp;
Removing&nbsp;Reviewer&nbsp;and&nbsp;all&nbsp;other&nbsp;AccessRights&nbsp;on&nbsp;folder&nbsp;User1:\Calendar&nbsp;
Successfully&nbsp;removed&nbsp;AccessRights&nbsp;on&nbsp;folder&nbsp;User1:\Calendar&nbsp;
Removing&nbsp;Reviewer&nbsp;and&nbsp;all&nbsp;other&nbsp;AccessRights&nbsp;on&nbsp;folder&nbsp;User1:\Contacts&nbsp;
Successfully&nbsp;removed&nbsp;AccessRights&nbsp;on&nbsp;folder&nbsp;User1:\Contacts&nbsp;
Removing&nbsp;Reviewer&nbsp;and&nbsp;all&nbsp;other&nbsp;AccessRights&nbsp;on&nbsp;folder&nbsp;User1:\Deleted&nbsp;Items&nbsp;
Successfully&nbsp;removed&nbsp;AccessRights&nbsp;on&nbsp;folder&nbsp;User1:\Deleted&nbsp;Items&nbsp;
Removing&nbsp;Reviewer&nbsp;and&nbsp;all&nbsp;other&nbsp;AccessRights&nbsp;on&nbsp;folder&nbsp;User1:\Drafts&nbsp;
Successfully&nbsp;removed&nbsp;AccessRights&nbsp;on&nbsp;folder&nbsp;User1:\Drafts&nbsp;
Removing&nbsp;Reviewer&nbsp;and&nbsp;all&nbsp;other&nbsp;AccessRights&nbsp;on&nbsp;folder&nbsp;User1:\Inbox&nbsp;
Successfully&nbsp;removed&nbsp;AccessRights&nbsp;on&nbsp;folder&nbsp;User1:\Inbox&nbsp;
Removing&nbsp;Reviewer&nbsp;and&nbsp;all&nbsp;other&nbsp;AccessRights&nbsp;on&nbsp;folder&nbsp;User1:\Journal&nbsp;
Successfully&nbsp;removed&nbsp;AccessRights&nbsp;on&nbsp;folder&nbsp;User1:\Journal&nbsp;
Removing&nbsp;Reviewer&nbsp;and&nbsp;all&nbsp;other&nbsp;AccessRights&nbsp;on&nbsp;folder&nbsp;User1:\Junk&nbsp;Email&nbsp;
Successfully&nbsp;removed&nbsp;AccessRights&nbsp;on&nbsp;folder&nbsp;User1:\Junk&nbsp;Email&nbsp;
Removing&nbsp;Reviewer&nbsp;and&nbsp;all&nbsp;other&nbsp;AccessRights&nbsp;on&nbsp;folder&nbsp;User1:\Notes&nbsp;
Successfully&nbsp;removed&nbsp;AccessRights&nbsp;on&nbsp;folder&nbsp;User1:\Notes&nbsp;
Removing&nbsp;Reviewer&nbsp;and&nbsp;all&nbsp;other&nbsp;AccessRights&nbsp;on&nbsp;folder&nbsp;User1:\Outbox&nbsp;
Successfully&nbsp;removed&nbsp;AccessRights&nbsp;on&nbsp;folder&nbsp;User1:\Outbox&nbsp;
Removing&nbsp;Reviewer&nbsp;and&nbsp;all&nbsp;other&nbsp;AccessRights&nbsp;on&nbsp;folder&nbsp;User1:\Sent&nbsp;Items&nbsp;
Successfully&nbsp;removed&nbsp;AccessRights&nbsp;on&nbsp;folder&nbsp;User1:\Sent&nbsp;Items&nbsp;
Removing&nbsp;Reviewer&nbsp;and&nbsp;all&nbsp;other&nbsp;AccessRights&nbsp;on&nbsp;folder&nbsp;User1:\Tasks&nbsp;
Successfully&nbsp;removed&nbsp;AccessRights&nbsp;on&nbsp;folder&nbsp;User1:\Tasks&nbsp;
Processing&nbsp;complete.&nbsp;12&nbsp;total&nbsp;folders&nbsp;evaluated,&nbsp;12&nbsp;folders&nbsp;permission&nbsp;removed,&nbsp;0&nbsp;folders&nbsp;skipped&nbsp;because&nbsp;no&nbsp;permissions&nbsp;present.&nbsp;
</pre>
</div>
</div>
</div>
<div class="endscriptcode">&nbsp;</div>
</strong></div>
<div><strong>&nbsp;</strong></div>
<div><strong>Referenes:</strong></div>
<div>
<div>&nbsp;</div>
<div>Add-ReadOnlyMailboxPermissions.ps1:<br /> <a href="http://gallery.technet.microsoft.com/exchange/Add-Read-Only-Access-to-6e080379">http://gallery.technet.microsoft.com/exchange/Add-Read-Only-Access-to-6e080379</a></div>
<div>&nbsp;</div>
<div>Remove-MailboxFolderPermission:</div>
<div><a href="https://technet.microsoft.com/en-us/library/dd351181(v=exchg.150).aspx">https://technet.microsoft.com/en-us/library/dd351181(v=exchg.150).aspx</a></div>
<div></div>
</div>
<div>Exchange 2010: And then there is the long awaited cmdlet Add-MailboxFolderPermission</div>
<div><a href="http://blogs.technet.com/b/ilvancri/archive/2009/11/24/exchange-2010-and-then-there-is-the-long-awaited-cmdlet-add-mailboxfolderpermission.aspx">http://blogs.technet.com/b/ilvancri/archive/2009/11/24/exchange-2010-and-then-there-is-the-long-awaited-cmdlet-add-mailboxfolderpermission.aspx</a></div>
<div></div>
<div>Exchange 2007/2010/2013 &ndash; Using Get-MailboxFolderPermissions to export MAPI permissions of folders for a given mailbox</div>
<div><a href="blogs.technet.com/b/samdrey/archive/2014/03/06/exchange-2007-2010-2013-using-get-mailboxfolderpermissions-to-export-mapi-permissions-of-folders.aspx">blogs.technet.com/b/samdrey/archive/2014/03/06/exchange-2007-2010-2013-using-get-mailboxfolderpermissions-to-export-mapi-permissions-of-folders.aspx</a></div>
<div></div>
<div></div>
</div>
</div>
