Function ExcelToCsv ($File) {
    $myDir = $env:encryption_dir
    $excelFile = "$myDir\" + $File + ".xlsx"
    $Excel = New-Object -ComObject Excel.Application
    $wb = $Excel.Workbooks.Open($excelFile)

    foreach ($ws in $wb.Worksheets) {
        $ws.SaveAs("$myDir\" + $File + ".csv", 6)
    }
    $Excel.Quit()
}

$FileName=$args[0]
# $DateString = $(get-date -f yyyyMMdd)
# $FileName=$FileName + $DateString
Write-Host $FileName
ExcelToCsv -File $FileName	