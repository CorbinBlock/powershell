# ===============================================================================================================
# Function: Check file record count via pwsh CLI - CB 2021-06-09
# Sources: 
# ===============================================================================================================

# $Dir = $env:lls_ppu # Prod
$Dir = $env:onedrive_dir # Test
Set-Location $Dir
$LatestFile = Get-ChildItem  | Sort-Object LastWriteTime | Select-Object -last 1
Write-Output $LatestFile
find /v /c "" $LatestFile
Set-Location $env:scripts_dir