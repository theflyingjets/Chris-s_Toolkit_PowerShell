#Title: MainMenu Chris's Toolkit
#Purpose: To make it easier to run scripts
#Function: MainMenu for all scripts

write-host "
||||||||||||||||||||||||||||||||`n
|| Welcome to Chris's Toolkit ||`n
||||||||||||||||||||||||||||||||"

#This finds the path where this script is.
$ScriptDir = Split-Path $script:MyInvocation.MyCommand.Path
#MainMenu options
$answer=read-host "`n1 = Nmap Clone `n2 = See Your System's Info `n3 = something `n`n4 or Q and or Quit = Quit`n"

#Nmap-Clone 
if ($answer -eq "1")
	{
        #This will tell the player the option they have picked and then sleeps for 1 sec then clear the console and set the dir to $ScriptDir and run the script.
        "You have picked ping"
        "Please Wait...."
        Start-sleep 1
        Clear-Host
        Set-Location $ScriptDir
        .\NmapClone.ps1
        }

#Something
if ($answer -eq "2")
	{
        #This will tell the player the option they have picked and then sleeps for 1 sec then clear the console and set the dir to $ScriptDir and run the script.
        "System Info"
        Start-sleep 1
        Clear-Host
        Set-Location $ScriptDir
        .\whoAmI.ps1
        }
#This option would quit the toolkit
if ($answer -eq "Quit" -or "Q" -or "4")
{"Quitting Program"; Start-Sleep 2; exit}