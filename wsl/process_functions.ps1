function Restart-Local {
Get-Process chrome, Teams, OUTLOOK, ONENOTE, dbeaver | Stop-Process -ErrorAction SilentlyContinue
Restart-Computer
}
function Start-Processes {
    Start-Process chrome
    Start-Process -File $env:LOCALAPPDATA\Microsoft\Teams\Update.exe -ArgumentList '--processStart "Teams.exe"'
    Start-Process OUTLOOK
    Start-Process ONENOTE
    Start-Process -File "C:\Program Files (x86)\Common Files\Pulse Secure\JamUI\Pulse.exe" -ArgumentList '-show'
    Start-Process -File "C:\Program Files\DBeaver\dbeaver.exe" -ArgumentList '-nl en'
    Start-Process -File "C:\Program Files (x86)\Microsoft SQL Server Management Studio 18\Common7\IDE\Ssms.exe"
}
function Stop-Pulse {
Get-Process -ErrorAction SilentlyContinue Pulse | Stop-Process -ErrorAction SilentlyContinue
}

# Restart-Local
# Start-Processes
# Stop-Pulse
