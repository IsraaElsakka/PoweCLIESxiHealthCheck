function ListClusterInVC{
Write-Output "Clusters under vCenter $vc"
foreach ($cls in $Clusters){
Write-Output "$cls"
}
}