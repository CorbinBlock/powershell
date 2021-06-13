# ===============================================================================================================
# Function: Research interacting with Windows Task Scheduler via pwsh CLI - CB 2021-06-04
# Sources: https://docs.microsoft.com/en-us/powershell/module/scheduledtasks/get-scheduledtask?view=windowsserver2019-ps
# ===============================================================================================================

# Get-ScheduledTask -TaskName update_windows
# Start-ScheduledTask -TaskName update_windows

$Dir = $env:scripts_dir
$Arg = "-NoExit -File ./call_stopwatch_pwsh.ps1"
$Exec = """C:\Users\cblock\AppData\Local\Microsoft\powershell-daily\pwsh.exe"""
$ServerName = $env:UserDomain + "\" + $env:UserName # this were system-generated environment variables
$Server = $ServerName

$A = New-ScheduledTaskAction -Execute $Exec -Argument $Arg -WorkingDirectory $Dir
# $T = New-ScheduledTaskTrigger
$P = New-ScheduledTaskPrincipal $Server
$S = New-ScheduledTaskSettingsSet
$D = New-ScheduledTask -Action $A -Principal $P -Settings $S
$TaskName = "call_stopwatch_pwsh"
 Register-ScheduledTask $TaskName -InputObject $D
# Unregister-ScheduledTask $TaskName