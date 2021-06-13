# ===============================================================================================================
# Function: Save new ps1 file with header for notes via pwsh CLI - CB 2021-06-13
# Sources: 
# ===============================================================================================================

$ParamOne = $args[0]
$TargetFileName = $ParamOne + ".ps1"
$NewFileHeader = Get-ChildItem *ps1* | Sort-Object -Property LastWriteTime | Select-Object -Last 1 | Get-Content  -First 6 
$NewFileHeader > $TargetFileName
Get-Content $TargetFileName