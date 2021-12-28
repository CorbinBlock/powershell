function Get-FileSize ($Path) {
Set-Location $Path
Get-ChildItem
(Get-ChildItem | Sort-Object LastWriteTime | Select-Object -last 1 |  Measure-Object Length -sum).Sum /1MB
}
function Read-Header ($File) {
    $Path = "C:\Users\Administrator\data_files\"
    $SourcePath = $Path + $File
    Get-Content $SourcePath | Select-Object -First 10
    Get-Content $SourcePath | Select-Object -First 1 | clip.exe
}
Read-Header -File "bank.csv"
Get-FileSize -Path "c:\Users\Administrator\data_files"