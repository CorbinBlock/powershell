x`import-csv C:\Users\Corbin\scratchpad\amex\amex_activity_2019.csv | 
Select-Object *,@{Name='file_year';Expression={'2019'}} | 
Select-Object *,@{Name='YTD_flag';Expression={'N'}} | 
Export-Csv C:\Users\Corbin\scratchpad\amex\amex_activity_flagged_2019.csv -NoTypeInformation

Remove-Item C:\Users\Corbin\scratchpad\amex\amex_activity_flagged_2019.csv

Get-Content C:\Users\Corbin\scratchpad\amex\amex_activity_flagged_2019.csv
import-csv C:\Users\Corbin\scratchpad\amex\amex_activity_flagged_2019.csv

cd C:\Users\Corbin\scratchpad\amex 

#broken, continues to append dupe files
Get-ChildItem -Filter *.csv | Select-Object -ExpandProperty FullName | Import-Csv | Export-Csv .\combined_amex.csv -NoTypeInformation -Append

#combined csv but kept dupe headers
Get-Content *.csv| Add-Content combined_amex.csv


Get-Content C:\Users\Corbin\scratchpad\amex\*.csv | Select-Object -Unique | Set-Content -Encoding ASCII amex_combined.csv

$csv1 = Import-Csv -Path C:\Users\Corbin\OneDrive' - Block 'Consulting\notes\powershell\scratchpad\amex\amex_activity_flagged_2018.csv
$csv2 = Import-Csv -Path C:\Users\Corbin\OneDrive' - Block 'Consulting\notes\powershell\scratchpad\amex\amex_activity_flagged_2019.csv
#$csv3 = Import-Csv -Path "C:\Users\Corbin\scratchpad\amex\amex_activity_flagged_2020*.csv"

$merged = $csv1 + $csv2 
#+ $csv3

$merged | Select-Object -Property * -Unique | Export-Csv C:\Users\Corbin\OneDrive' - Block 'Consulting\notes\powershell\scratchpad\amex\amex_combined_01192020.csv -NoTypeInformation



