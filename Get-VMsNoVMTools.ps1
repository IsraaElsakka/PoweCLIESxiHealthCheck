<#
.SYNOPSIS
    Checks and lists VMs and list VMs with VMware tools Not installed or not running. 
.DESCRIPTION
 VMware Tools is a suite of utilities that enhances the performance of the virtual machines guest operating system and improves management of the virtual machine. Without VMware Tools installed in your guest operating system, guest performance lacks important functionality. 
 Check KB:  https://kb.vmware.com/s/article/340   
.INPUTS
 User will need to specify the cluster and the output in CSV. 
.OUTPUTS
 CSV file with list of VMs, VMware tool installed status, VMware running status, IP Addresses and cluster. 
.PARAMETER Cluster
    Specify the cluster the script will run.
.PARAMETER CSVPath
    Specify the path of the CSV file of the output of the script. 
    
.NOTES
    Author: Israa Salah
#>   

$VC = xxxx
Connect-VIServer $VC 
function Get-VMsNoVMTools {
    param (
        # User will need to specify the Cluster:
        [Parameter(Position=0,Mandatory=$true)]
        [string]
        $Cluster,
        # Parameter help description
        [Parameter(Position=1,Mandatory=$true)]
        [string]
        $CSVPath
        
    )
   
Get-Cluster $Cluster | Get-VM  | Where-Object { $_.powerstate -eq "poweredon" -and ($_.ExtensionData.Guest.ToolsStatus -eq "toolsNotInstalled" -or $_.ExtensionData.Guest.ToolsStatus -eq "toolsNotRunning")} | Select-Object Name,@{N="Cluster";E={$Cluster}},@{N="Tools Installed";E={$_.Guest.ToolsVersion -ne ""}},@{N="VMTools Status";E={$_.ExtensionData.Guest.ToolsStatus}},@{N="VMTools version";E={if($_.Guest.ToolsVersion -ne ""){$_.Guest.ToolsVersion}}},@{N="IPv4Address";E={$_.guest.IPAddress[0]}},@{N="IPv6Address1";E={$_.guest.IPAddress[1]}},@{N="IPv6Address2";E={$_.guest.IPAddress[2]}},@{N="IPv6Address3";E={$_.guest.IPAddress[3]}},@{N="IPv6Address4";E={$_.guest.IPAddress[4]}},@{N="IPv6Address5";E={$_.guest.IPAddress[5]}},PowerState |  Export-Csv -Path $CSVPath

}

