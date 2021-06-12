# ===============================================================================================================
# Function: Create .txt notes file from current powershell command usage history via pwsh CLI - CB 2021-06-12
# Sources: https://mcpmag.com/articles/2017/10/19/using-a-stopwatch-in-powershell.aspx
# Example: .\save_history_as_notes.ps1
# ===============================================================================================================

$FileNamePrefix = "powershell_notes_"
$DateString = $(get-date -f yyyyMMddhhmmss)
$ExtensionSource = '.txt'
$FileNameTarget = $FileNamePrefix + $DateString + $ExtensionSource

Get-History > $FileNameTarget
Get-ChildItem $FileNameTarget
Get-Content $FileNameTarget