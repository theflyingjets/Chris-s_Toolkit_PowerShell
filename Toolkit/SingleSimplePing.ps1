#Title: IP/Domain Simple Ping
#Purpose: Ping IP/Domain with the Test-Connection instead of the ping command
#Function: Ping IP/Domain with Test-Connection

$ScriptDir = Split-Path $script:MyInvocation.MyCommand.Path

$IP = Read-Host "What is the IP/Domain Tool"
Clear-Host
write-host "Simple Pinging" $IP
"Please Wait...."
Test-Connection $IP

$answer=read-host "`n1 = Back to NmapClone`n2 = Back to MainMenu `n`n3 = Quit`n"
if ($answer -eq "1")
    {
        "Going Back"
        "Please Wait...."
        Start-sleep 1
        Clear-Host
        Set-Location $ScriptDir
        .\NmapClone.ps1
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
            {
                "Quitting Program"; Start-Sleep 2; exit
            }