# ===============================================================================================================
# Function: Process Mint financial transactions csv via pwsh CLI - CB 2021-06-04
# Sources: https://docs.microsoft.com/en-us/powershell/module/scheduledtasks/get-scheduledtask?view=windowsserver2019-ps
# ===============================================================================================================

$FileName = 'transactions.csv'

Set-Location $env:onedrive_dir

Get-ChildItem $FileName | Select-Object -exp Name

Copy-Item $FileName $env:archive_dir

