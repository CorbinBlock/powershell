function Restart-Local {
Get-Process chrome, Teams, OUTLOOK, ONENOTE | Stop-Process
Restart-Computer
}
function Start-Processes {
    Start-Process chrome
    Start-Process -File $env:LOCALAPPDATA\Microsoft\Teams\Update.exe -ArgumentList '--processStart "Teams.exe"'
    Start-Process OUTLOOK
    Start-Process ONENOTE
    Start-Process -File "C:\Program Files (x86)\Common Files\Pulse Secure\JamUI\Pulse.exe" -ArgumentList '-show'
}
function Stop-Pulse {
Get-Process Pulse | Stop-Process
}

# Restart-Local
# Start-Processes
# Stop-Pulse