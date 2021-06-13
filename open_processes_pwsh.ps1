# ===============================================================================================================
# Function: Provide list of processes to open via pwsh CLI - CB 2021-06-04
# Sources: https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.management/stop-process?view=powershell-7.1
# ===============================================================================================================

$ProcessArray = @('chrome', 'C:\Program Files\KeePass Password Safe 2\KeePass.exe', 'ONENOTE', 'OUTLOOK', 'code', 'ms-settings:')
foreach($i in $ProcessArray) { Start-Process -FilePath $i }