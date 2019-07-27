function GetVCVersion {

    $Server = $Global:DefaultServers
    $Server | Select @{Name="vCenter";expression{Name}},Version,Build,@{Name="vCenterOS";expression={$Server.ExtenstionData.Content.About.OsType}} | ft
    

}