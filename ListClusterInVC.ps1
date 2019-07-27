Connect-VIServer -Server vCenterServer -User UserName -Password Password
$vc = $Global:DefaultServer
$Clusters = Get-Cluster
$hosts = Get-VMHost
function ListClusterInVC{
Write-Output "Clusters under vCenter $vc"
foreach ($cls in $Clusters){
Write-Output "$cls"
}
}
