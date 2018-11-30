#Title: System Info
#Purpose: Give you the details of System Info
#Function: Write To Host System Information

$ScriptDir = Split-Path $script:MyInvocation.MyCommand.Path

$computerSystem = Get-CimInstance CIM_ComputerSystem
$computerBIOS = Get-CimInstance CIM_BIOSElement
$computerOS = Get-CimInstance CIM_OperatingSystem
$computerCPU = Get-CimInstance CIM_Processor
$computerHDD = Get-CimInstance Win32_LogicalDisk -Filter "DeviceID = 'C:'"
Clear-Host

Write-Host "System Information for: " $computerSystem.Name -BackgroundColor DarkCyan
"Manufacturer: " + $computerSystem.Manufacturer
"Model: " + $computerSystem.Model
"Serial Number: " + $computerBIOS.SerialNumber
"CPU: " + $computerCPU.Name
"HDD Capacity: "  + "{0:N2}" -f ($computerHDD.Size/1GB) + "GB"
"HDD Space: " + "{0:P2}" -f ($computerHDD.FreeSpace/$computerHDD.Size) + " Free (" + "{0:N2}" -f ($computerHDD.FreeSpace/1GB) + "GB)"
"RAM: " + "{0:N2}" -f ($computerSystem.TotalPhysicalMemory/1GB) + "GB"
"Operating System: " + $computerOS.caption + ", Service Pack: " + $computerOS.ServicePackMajorVersion
"User logged In: " + $computerSystem.UserName
"Last Reboot: " + $computerOS.LastBootUpTime

$answer=read-host "`n1 = Back to MainMenu `n`n2 = Quit`n"

if($answer -eq "1")
{
    "Going Back"
    "Please Wait...."
    Start-sleep 1
    Clear-Host
    Set-Location $ScriptDir
    .\MainMenu.ps1
}
elseif ($answer -eq "Quit" -or "Q" -or "3")
{"Quitting Program"; Start-Sleep 2; exit}