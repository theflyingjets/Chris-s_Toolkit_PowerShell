#Title: Nmap-Clone
#Purpose: To have all the network scripts run from here
#Function: Menu

$ScriptDir = Split-Path $script:MyInvocation.MyCommand.Path

write-host "
||||||||||||||||||||||||||||||||`n
|| Welcome to Chris's Toolkit ||`n
||       NMap Clone Tool      ||`n
||||||||||||||||||||||||||||||||"

$answer=read-host "`n1 = Single IP/Domain Tool `n2 = Back to MainMenu `n`n3 = Quit`n"

if ($answer -eq "1")
	{
        "Single IP/Domain Tool"
        "Please Wait...."
        Start-sleep 1
        Clear-Host
        
        $answer=read-host "`n1 = Normal Ping `n2 = Simple Ping `n3 = Scan Ports Tool for Single IP/Domain Tool `n4 = Back to MainMenu `n`n5 = Quit`n"
        if ($answer -eq "1")
        {
            "Normal Ping"
            "Please Wait...."
            Start-sleep 1
            Clear-Host
            Set-Location $ScriptDir
            .\SingleNormalPing.ps1
        }
        if ($answer -eq "2")
        {
            "Simple Ping"
            "Please Wait...."
            Start-sleep 1
            Clear-Host
            Set-Location $ScriptDir
            .\SingleSimplePing.ps1
        }
        if ($answer -eq "3")
        {
            "Scan Ports Tool for Single IP/Domain Tool"
            "Please Wait...."
            Start-sleep 1
            Clear-Host
            Set-Location $ScriptDir
            .\SingleScanPort.ps1
        }
        if ($answer -eq "4")
        {
            "Going Back"
            "Please Wait...."
            Start-sleep 1
            Clear-Host
            Set-Location $ScriptDir
            .\MainMenu.ps1
        }
        elseif ($answer -eq "Quit" -or "Q" -or "5")
        {
            "Quitting Program"; Start-Sleep 2; exit
        }
    }
if ($answer -eq "2")
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
