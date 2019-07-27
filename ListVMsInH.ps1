Connect-VIServer -Server vCenterServer -User UserName -Password Password
$vc = $Global:DefaultServer
$Clusters = Get-Cluster
$hosts = Get-VMHost
function ListVMsInH{
Get-VM | Select @{Name="VMName";Expression={$_.Name}},PowerState, @{Name="ESXiHost";Expression={$_.VMHost}},@{Name="IPAddress";Expression={$_.Guest.IPAddress}} | Sort-Object ESXiHost | ft
}