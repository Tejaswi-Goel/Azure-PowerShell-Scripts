﻿<#Get-Date
Get-AzurePublishSettingsFile 
start-sleep -s 5 
$dir = "C:\Users\admin\Downloads"

<#Import-AzurePublishSettingsFile "C:\Users\admin\Downloads\Pay-As-You-Go-Converted to a Pay-As-You-Go Subscription-10-10-2016-credentials (1).publishsettings" #>
<#Add-AzureAccount#>

#$filter="*.publishsettings"
<#$latest = Get-ChildItem -Path $dir -Filter $filter | Sort-Object LastAccessTime -Descending | Select-Object -First 1
$latest.name#> 
#-------------DISPLAYING ALL THE CLOUD SERVICES IN AZURE-----------------

Write-Output "`n All services are in variable x `n"
 $a = Get-AzureService 
  $x= $a.ServiceName
   Write-Output $x
#-------------DISPLAYING ALL THE DEPLOYED CLOUD SERVICES-----------------

Write-Host "`nThe deployed services are in variable p `n"
$groups=Get-AzureVM | Group-Object -Property ServiceName #this has all the cloudservices having deployment
$p= $groups.Name
Write-Output $p
<#Write-Output "`nThe VMs and their Status are`n"
foreach ($vm in Get-AzureVM)
{
    Write-Host $vm.Name : $vm.Status
 }#>

#If the Cloud Service is empty, you don't really have a virtual machine running in it, so you can delete it.
Write-Output "`n All not deployed services are in variable C- they have no instances deployed `n"

$c = Compare-Object -ReferenceObject ($x| Sort-Object) -DifferenceObject  ($p| Sort-Object) -PassThru

Write-Output $c


$i=0;

#-------------DELETING UNUSED CLOUD SERVICES AT A TIME-----------------

$PerformRemove= $true #edit this variable to TRue to perform deletion of cloud services
Write-Output "`n Deleting the not deployed cloud services `n" 
if($PerformRemove)
{
foreach ($ServiceName in $c)
{ Write-Host "Deleting the service:" ($ServiceName)
  $i +=1 
  Remove-AzureService -ServiceName $ServiceName -Force
   if ($i -eq 10) {break}
}}



 
    
   
    
     

