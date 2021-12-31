# ===============================================================================================================
# Function: Call powershell script to convert xlsx to csv and load workout or stretch log csv to postgres table - CB 2021-05-22
# Sources: 
# TODO: 
# ===============================================================================================================

$FileName = $args[0]
$DateString = $(get-date -f yyyyMMdd)
$ParamTwo = $args[1]
IF($ParamTwo) {$DateString = $ParamTwo} # Changes datestamp in filename to load historical data
$ExtensionSource = '.xlsx'
$FileNameSource = $FileName + $DateString + $ExtensionSource
$ExtensionTarget = '.csv'
$FileNameTarget = $FileName + $DateString + $ExtensionTarget
$Database = 'sandbox_db'
$Query1 = "\c $Database"
$Query4 = "SELECT transaction_date, 'stretch_log' as table_name, COUNT(1) as record_count FROM stretch_log GROUP BY transaction_date UNION ALL SELECT transaction_date,'workout_log' as table_name, COUNT(1) as record_count FROM workout_log GROUP BY transaction_date ORDER BY transaction_date DESC;"

Write-Output $FileNameSource
Set-Location $env:onedrive_dir

# We only needed today's date in file name - last modified date in folder is not relevant.
# $LatestFile = $(Get-ChildItem $FileNameSource | Sort-Object LastWriteTime | Select-Object -last 1)

$LatestFile = $(Get-ChildItem $FileNameSource)

IF( $FileNameSource = $LatestFile ) 
{
Set-Location $env:scripts_dir
.\XLSXToCSVFunction.ps1 $FileName
Set-Location $env:onedrive_dir
Copy-Item $FileNameTarget $env:downloads_dir
Copy-Item $FileNameTarget $env:archive_dir
Copy-Item $FileNameSource $env:archive_dir
# This caused error due to file being locked by other process
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
	$Query3 = "SELECT transaction_date, workout_description, set_number, weight, is_complete, day_type FROM workout_log WHERE transaction_date = CURRENT_DATE;"
	}
    $flows[1]
	{
	$Query2 = "SELECT load_stretch_log('C:\Users\cbloc\Downloads\$FileNameTarget')"
	$Query3 = "SELECT transaction_date, workout_description, set_number, duration, is_complete FROM stretch_log WHERE transaction_date = CURRENT_DATE ORDER BY transaction_date DESC,order_number;"
	}
}

psql -U postgres -c "$Query1" -c "$Query2" -c "$Query3" -c "$Query4"