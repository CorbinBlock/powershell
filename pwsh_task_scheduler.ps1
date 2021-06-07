# ===============================================================================================================
# Function: Research interacting with Windows Task Scheduler via pwsh CLI - CB 2021-06-04
# Sources: https://docs.microsoft.com/en-us/powershell/module/scheduledtasks/get-scheduledtask?view=windowsserver2019-ps
# ===============================================================================================================

# Get-ScheduledTask -TaskName update_windows
# Start-ScheduledTask -TaskName update_windows

$Server = "DESKTOP-GG16TKF\cbloc"
$Task = "call_systeminfo_exe"
$Arg = "-NoExit -File ""./call_systeminfo_exe.ps1"""
# $Arg = "-NoExit -Command ""Get-ChildItem"""

$Dir = "C:\Users\cbloc\OneDrive - Block Consulting\scripts"
$Exec = """C:\Users\cbloc\AppData\Local\Microsoft\powershell-daily\pwsh.exe"""
$Act = New-ScheduledTaskAction -Execute $Exec -Argument $Arg -WorkingDirectory $Dir 
# $TaskTrigger = New-ScheduledTaskTrigger

$PrincipalName = New-ScheduledTaskPrincipal $Server
$TaskSettings = New-ScheduledTaskSettingsSet
$TaskObject = New-ScheduledTask -Action $Act -Principal $PrincipalName -Settings $TaskSettings 
Register-ScheduledTask $Task -InputObject $TaskObject
# Unregister-ScheduledTask update_windows