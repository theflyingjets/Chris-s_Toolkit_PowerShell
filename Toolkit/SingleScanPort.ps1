#Title: Single IP/Domain Port Scaner
#Purpose: To scan ports for the IP/Domain you enter
#Function: Scans ports

$ScriptDir = Split-Path $script:MyInvocation.MyCommand.Path

$IP = Read-Host "What is the IP/Domain Tool?"
Clear-Host
write-host "What you want to scan" $IP

$portrange = 1..65535

$answer=read-host "`n1 = One Port`n2 = pick your ports`n3 = all ports`n4 = Back to MainMenu `n`n5 = Quit`n"

if ($answer -eq "1") {
    write-host "One Port Mode"
    $port=Read-Host "Port Number?"
    "Please Wait...."
    $port.split(',') | Foreach-Object -Process {If (($a=Test-NetConnection $IP -Port $_ -WarningAction SilentlyContinue).tcpTestSucceeded -eq $true) {Write-Host $a.Computername $a.RemotePort -ForegroundColor Green -Separator " ==> "} else {Write-Host $a.Computername $a.RemotePort -Separator " ==> " -ForegroundColor Red}}
}
if ($answer -eq "2") {
    write-host "Pick Your Ports Mode"
    $port=Read-Host "Port Numbers? Separate them by comma"
    "Please Wait...."
    $port.split(',') | Foreach-Object -Process {If (($a=Test-NetConnection $IP -Port $_ -WarningAction SilentlyContinue).tcpTestSucceeded -eq $true) {Write-Host $a.Computername $a.RemotePort -ForegroundColor Green -Separator " ==> "} else {Write-Host $a.Computername $a.RemotePort -Separator " ==> " -ForegroundColor Red}}
}
if ($answer -eq "3") {
    write-host "All Ports Mode"
    write-host "Scaning All in 1 - 65535"
    Write-Host "Are you sure as this will take awhile as it's scarn form 1 to 65535!" -ForegroundColor Yellow
    $answer=read-host "`n1 = Yes`n2 = No`n3 = Back to MainMenu `n`n4 = Quit`n"
    if ($answer -eq "1")
    {
        Write-Host "Ok please Wait This will take awhile!"
        Foreach ($p in $portrange)
        {
            $Socket = New-Object Net.Sockets.TcpClient      
            $ErrorActionPreference = 'SilentlyContinue'
            #Connect on the given port
            $Socket.Connect($IP, $p)
            #Determine if the connection is established
            if ($Socket.Connected) 
            {
                Write-Host "Outbound port $p is open on $IP." -ForegroundColor Green
                $Socket.Close()
            }
            else 
            {
                Write-Host "Outbound port $p is closed or filtered on $IP." -ForegroundColor Red
            }
        } #end foreach  
        if ($answer -eq "2") {
            "Ok please Wait"
            Clear-Host
            Set-Location $ScriptDir
            .\SingleScanPort.ps1
        }
        if ($answer -eq "3") {
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
 }
