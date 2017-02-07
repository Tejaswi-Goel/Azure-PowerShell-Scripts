Get-Date
" `n "
Get-AzurePublishSettingsFile 
start-sleep -s 5 
$dir = "C:\Users\admin\Downloads" 

$filter="*.publishsettings"
$latest = Get-ChildItem -Path $dir -Filter $filter | Sort-Object LastAccessTime -Descending | Select-Object -First 1
$latest.name 
" `n " 

Import-AzurePublishSettingsFile  $latest

Get-AzureDisk | Where-Object {$_.AttachedTo –eq $null } | Format-Table –auto "DiskName","DiskSizeInGB","MediaLink" 
#Get-AzureDisk | where { $_.AttachedTo -eq $null } | select diskname, medialink | Remove-AzureDisk  "disk name" -DeleteVHD
$a = Get-AzureDisk | Where-Object {$_.AttachedTo –eq $null } | select diskname, medialink
$x= $a.diskname
#$x 
$i=1
$j=0

#If there is no VM listed on the Attached To field of the disk, you can delete the disk directly.
Write-Host "`n Deleting the not deployed Disks `n" -ForegroundColor DarkRed 

$PerformRemove= $true #edit this variable to TRue to perform deletion of cloud services
if($PerformRemove)
{
foreach ($S in $x)
{ Write-Host "Deleting the Disk number:" $i :  ($S)
  $i +=1 
  $j +=1
  Remove-AzureDisk  -DiskName $S  -DeleteVHD #also removes the VHD file from Azure storage.
   if ($j -eq 1) {break}
}}


