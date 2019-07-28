
Connect-VIServer -Server vcsa-01a.corp.local -User administrator@corp.local -Password VMware1!
$vc = vcsa-01a.corp.local
$Clusters = Get-Cluster
$hosts = Get-VMHost


foreach $h in $hosts {
$ImageConfig = Get-View ($h.ExtensionData.ConfigManager.ImageConfigManager)
$InstallDate = $ImageConfig.InstallDate()
Write-Output "ESXi Host: $h  ->  Install Date: $InstallDate"
}
