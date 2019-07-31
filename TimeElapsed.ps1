
<#
.SYNOPSIS
Functions to check time elapsed between current date and created date. 

.DESCRIPTION
 Functions to check time-elapsed since VM / snapshot created in Days, Round Days, Hours, Round Hours, Minutes, Round Minutes, ...etc.

.PARAMETER startDate
$startDate takes Start Date in DateTime format e.g 17/07/2019 8:00 AM.  

.EXAMPLE
Get-Days -startDate "07/20/2019 10:46 AM"
11.0019560185185
Get-DaysRound -startDate "07/20/2019 10:46 AM"
11


.NOTES
For suggestions email israa.salah2017@gmail.com
#>
# 
function Get-Days {
Param([Parameter(Mandatory=$True)][DateTime] $startDate)
$printDays = ((New-TimeSpan -Start $startDate -End ((Get-Date).DateTime)).TotalDays)
Write-Output "$printDays"
}




function Get-DaysRound {
Param([Parameter(Mandatory=$True)][DateTime] $startDate)
$printDaysR = ((New-TimeSpan -Start $startDate -End ((Get-Date).DateTime)).TotalDays)
[math]::Round($printDaysR)
}






function Get-Hours {
Param([Parameter(Mandatory=$True)][DateTime] $startDate)
$printHours = (((New-TimeSpan -Start $startDate -End ((Get-Date).DateTime)).TotalDays)*24)
Write-Output "$printHours"
}







function Get-HoursRound {
Param([Parameter(Mandatory=$True)][DateTime] $startDate)
$printHoursR = (((New-TimeSpan -Start $startDate -End ((Get-Date).DateTime)).TotalDays)*24)
[math]::Round($printHoursR)
}





function Get-Minutes {
Param([Parameter(Mandatory=$True)][DateTime] $startDate)
$printMinutes = (((New-TimeSpan -Start $startDate -End ((Get-Date).DateTime)).TotalDays)*1440)
[math]::Round($printMinutes)
}



function Get-MinutesRound {
Param([Parameter(Mandatory=$True)][DateTime] $startDate)
$printMinutesR = (((New-TimeSpan -Start $startDate -End ((Get-Date).DateTime)).TotalDays)*1440)
[math]::Round($printMinutesR)
}