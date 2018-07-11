Add-Type -AssemblyName "Microsoft.Office.Interop.Outlook" | out-null
$olFolders = "Microsoft.Office.Interop.Outlook.olDefaultFolders" -as [type]
$Outlook = New-Object -ComObject Outlook.Application
$Namespace = $Outlook.GetNameSpace("MAPI")
$Folder = $Namespace.GetDefaultFolder($olFolders::olFolderInBox)
$Folder.Items.Restrict("[Unread]=true").Count