Connect-VIServer -Server vCenterServer -User UserName -Password Password
$vc = $Global:DefaultServer
$Clusters = Get-Cluster
$hosts = Get-VMHost

## To List Hosts in Cluster ##

function ListHostsInCluster {
foreach ($cls in $Clusters){
      Write-Output "Hosts under Cluster $cls"
       $cls  | Get-VMHost | ft
}
}

## To List Hosts outside Cluster ##
function listHostOutCluster{
#Get-VMHost | Select Name,Parent | Sort-Object Parent | ft
Write-Output "Hosts Outside Cluster:"
foreach ($h in $hosts){
If (Get-VMHost | ?{ $_.Parent.Name -eq "host" }){
Write-Output "$h"
}
else {
Write-Output "All Hosts are in Cluster"}
}
}


