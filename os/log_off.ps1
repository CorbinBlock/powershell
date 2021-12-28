function Exit-Session {
    Get-Process Ssms | Stop-Process -ErrorAction SilentlyContinue
    logoff.exe
 }

function Restart-LocalMachine {
Get-Process Ssms | Stop-Process -ErrorAction SilentlyContinue
Restart-Computer
}

# Exit-Session
# Restart-LocalMachine