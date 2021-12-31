$ServerName = hostname
$DiskUsageByDrive = Get-PSDrive -PSProvider FileSystem | Where-Object Used -lt 100TB | Select-Object provider, root, used, free  

$DiskFreeByServer = $DiskUsageByDrive | Group-Object provider | ForEach-Object {
    New-Object psobject -Property @{
        server_name   = $ServerName
        free_space_gb = [math]::Round(($_.Group | Measure-Object free -Sum).Sum / 1GB)
        used_space_gb = [math]::Round(($_.Group | Measure-Object used -Sum).Sum / 1GB)
    }
}
$DiskFreeByServer