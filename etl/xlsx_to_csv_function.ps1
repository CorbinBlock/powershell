# ===============================================================================================================
# Function: Call powershell script to convert xlsx to csv - CB 2021-05-22
# Sources: 
# TODO: Fix task scheduler job - cmd window closes too quickly before psql is called and csv is loaded
# ===============================================================================================================

Function ExcelToCsv ($File) {
	$myDir = $env:onedrive_dir
    $excelFile = "$myDir\" + $File + ".xlsx"
    $Excel = New-Object -ComObject Excel.Application
    $wb = $Excel.Workbooks.Open($excelFile)
	
    foreach ($ws in $wb.Worksheets) {
        $ws.SaveAs("$myDir\" + $File + ".csv", 6)
    }
    $Excel.Quit()
}

$FileName=$args[0]
$DateString = $(get-date -f yyyyMMdd)
# $DateString = '20210720'
$FileName=$FileName + $DateString
Write-Host $FileName
ExcelToCsv -File $FileName