# ===============================================================================================================
# Function: Monitor Resource usage via pwsh CLI - CB 2021-06-05
# Sources: https://www.reddit.com/r/PowerShell/comments/ayo3yo/looking_for_a_simple_script_to_get_cpu_usage_top/
# ===============================================================================================================

Set-Location $env:logs_dir
$DateString = $(Get-Date -f yyyyMMddhhmmss)
$ExtensionName = '.txt'
$SwitchParam = $args[0]
$FileNameTarget = $SwitchParam + $DateString + $ExtensionName
$ExtensionNameCsv = '.csv'
$FileNameTargetCsv = '.\' + $SwitchParam + $DateString + $ExtensionNameCsv


$flows = @('cpu_usage_log_','mem_usage_log_', 'update_pwsh_', 'update_windows_', 'pwsh_version_table_', 'close_processes', 'open_psql', 'open_processes', 'system_info_')

switch ( $SwitchParam ) {
    $flows[0]
	{ 
        Get-Process |
        Sort-Object CPU -Descending |
        Select-Object -First 20 -Property ProcessName,
        # @{ n="CPUUsage"; e={[math]::round($_.CPU,1)}} > $FileNameTarget
        @{ n="CPUUsage"; e={[math]::round($_.CPU,1)}} | Export-Csv -Path $FileNameTargetCsv -UseCulture -NoTypeInformation
        Write-Output $FileNameTargetCsv
        Get-Content $FileNameTargetCsv
	}
    $flows[1]
	{
        Get-Process |
        Group-Object -Property Name | 
        Select-Object Name,
        @{Name='WorkingSet64';Expression={(($_.Group|Measure-Object WorkingSet64 -Sum ).Sum / 1MB) }} |
        Sort-Object -Property WorkingSet64 -Descending 
        | Select-Object -First 20 -Property Name,
        @{ n="WorkingSet64MemUsageMB"; e={[math]::round($_.WorkingSet64,1)}} | Export-Csv -Path $FileNameTargetCsv -UseCulture -NoTypeInformation
        Write-Output $FileNameTargetCsv
        Get-Content $FileNameTargetCsv
	}
    $flows[2]
	{
        Invoke-Expression "& { $(Invoke-RestMethod 'https://aka.ms/install-pscore' ) } -Daily" > $FileNameTarget
        Write-Output $FileNameTarget
        Get-Content $FileNameTarget
	}
    $flows[3]
	{
       # Import-Module PSWindowsUpdate
       # Get-WindowsUpdate
       # Install-WindowsUpdate -MicrosoftUpdate -AcceptAll -AutoReboot > $FileNameTarget
       # Write-Output $FileNameTarget
       # Get-Content $FileNameTarget
	}
    $flows[4]
	{
        $DateString = $(Get-Date -f yyyyMMdd)
        $FileNameTargetCsv = '.\' + $SwitchParam + $DateString + $ExtensionNameCsv
        $PSVersionTable | Select-Object -Property Name, Value | Export-Csv -Path $FileNameTargetCsv -UseCulture -NoTypeInformation
        Write-Output $FileNameTargetCsv
        Get-Content $FileNameTargetCsv
	}
    $flows[5]
	{
        $ProcessArray = @('chrome', 'KeePass', 'ONENOTE', 'OUTLOOK') 
        foreach($i in $ProcessArray) { Stop-Process -Name $i }
	}
    $flows[6]
	{
     #   psql -U postgres
	}
    $flows[7]
	{
        $ProcessArray = @('chrome', 'C:\Program Files\KeePass Password Safe 2\KeePass.exe', 'ONENOTE', 'OUTLOOK', 'code', 'ms-settings:') 
        foreach($i in $ProcessArray) { Start-Process -FilePath $i }
	}
    $flows[8]
	{
        $DateString = $(Get-Date -f yyyyMMdd)
        $FileNameTargetCsv = '.\' + $SwitchParam + $DateString + $ExtensionNameCsv
        systeminfo.exe | Export-Csv -Path $FileNameTargetCsv -UseCulture -NoTypeInformation
        Write-Output $FileNameTargetCsv
        Get-Content $FileNameTargetCsv
	}    
}

Set-Location $env:scripts_dir