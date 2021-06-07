$FileName = $args[0]
$DateString = $(get-date -f yyyyMMdd)
$ExtensionSource = '.csv'
$FileNameSource = $FileName + $DateString + $ExtensionSource
$ExtensionTarget = '.csv'
$FileNameTarget = $FileName + $DateString + $ExtensionTarget
$Database = 'sandbox_db'
$Query1 = "\c $Database"

Write-Output $FileNameSource
Set-Location $env:downloads_dir
$LatestFile = $(Get-ChildItem $FileNameSource | Sort-Object LastWriteTime | Select-Object -last 1)

IF( $FileNameSource = $LatestFile ) 
{
# Set-Location $env:scripts_dir
# .\xlsx_to_csv_function.ps1 $FileName
# Set-Location $env:onedrive_dir
Copy-Item $FileNameTarget $env:downloads_dir
Copy-Item $FileNameTarget $env:archive_dir
Copy-Item $FileNameSource $env:archive_dir
# Remove-Item $FileNameTarget
Remove-Item $FileNameSource
Set-Location $env:scripts_dir
}
ELSE
{
Write-Output '$FileNameSource not found. Please check $env:downloads_dir'
}

$flows = @('workout_log_','stretch_log_')

switch ( $FileName ) {
    $flows[0]
	{ 
	$Query2 = "SELECT load_workout_log('C:\Users\cbloc\Downloads\$FileNameTarget')"
	$Query3 = 'SELECT transaction_date, workout_description, set_number, weight, is_complete, day_type FROM workout_log WHERE transaction_date = CURRENT_DATE'
	}
    $flows[1]
	{
	$Query2 = "SELECT load_stretch_log('C:\Users\cbloc\Downloads\$FileNameTarget')"
	$Query3 = 'SELECT transaction_date, workout_description, set_number, duration, is_complete FROM stretch_log WHERE transaction_date = CURRENT_DATE ORDER BY transaction_date DESC,order_number;'	
	}
}

psql -U postgres -c "$Query1" -c "$Query2" -c "$Query3"