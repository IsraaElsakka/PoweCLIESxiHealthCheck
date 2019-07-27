function GetVCVersion {

    $vc = $Global:DefaultServers
    $vc | Select @{Name="vCenter";expression{Name}},Version,Build,@{Name="vCenterOS";expression={$Server.ExtenstionData.Content.About.OsType}} | ft
    

}
