# ===============================================================================================================
# Function: Open outlook templates for IDC status emails via pwsh CLI - CB 2021-06-09
# Sources: 
# ===============================================================================================================

Set-Location $env:local_desktop_dir
$FileMask = "*.msg*"
Get-ChildItem $FileMask | Invoke-Item