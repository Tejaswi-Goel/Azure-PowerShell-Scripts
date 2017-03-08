# Azure-PowerShell-Scripts


1. Script to clean the cloud services, not in use. (cloud_service_clean.ps1)
2. The script displays the deployed cloud services and removes all the cloud services, not in use.
3. Script to clean the disks with no VMs attached. (disk_clean.ps1  ). 
4. Script to search the empty resource groups and delete them (resource-grp-tg.ps1)
5. Script to launch a VM from the latest ScaleArc VHD (VHD-TO-VM-tg.ps1).
6. Note: Same script can be run for creating for multiple VMs, just change the public IP name and NIC name, other resources will be overwritten without effecting the previously created VMs.
7. Script to delete the VM and all resources associated with it only. (cleanup-RM.ps1).





References:

1. Get started with Azure PowerShell cmdlets: https://docs.microsoft.com/en-us/powershell/azureps-cmdlets-docs/
