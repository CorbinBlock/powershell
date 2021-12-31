$share="\\"
$nwobj=new-object -comobject WScript.Network
$status=$nwobj.mapnetworkdrive("D:",$share)
$drive=get-psdrive D
$free=($drive.free)
$used=($drive.used)
$total=($free+$used)
$freeinPercentage=($free/$total*100)
$freepercentagewithoutdecimal=([math]::Round($freeinPercentage))

$gbConversion=(1024*1024*1024)

$totalGbFree=($free/$gbConversion) 
$totalGbFreeWithoutDecimal=([math]::Round($totalGbFree))

$totalGbMax=($total/$gbConversion) 
$totalGbMaxWithoutDecimal=([math]::Round($totalGbMax))


Write-Output "Share $share has free space (in GB) of $totalGbFreeWithoutDecimal"
Write-Output "Share $share's max capacity (in GB) is $totalGbMaxWithoutDecimal"
Write-Output "Share $share has free space of $freepercentagewithoutdecimal %"

$emailString = @"
Share $share has free space (in GB) of $totalGbFreeWithoutDecimal
Share $share's max capacity (in GB) is $totalGbMaxWithoutDecimal
Share $share has free space of $freepercentagewithoutdecimal %
"@

$emailString | Out-File -FilePath \\nas_space.txt

$status=$nwobj.removenetworkdrive("D:")

$Warning = "20"
$Critical = "10"

If ($freepercentagewithoutdecimal -le "$Critical") 
{
Write-EventLog -LogName Application -Source "Network Share Monitoring" -EntryType Error -EventID 210 -Message "The Share $Share has disk space below 10 % and Current value is $freepercentagewithoutdecimal %"
}
If ($freepercentagewithoutdecimal -le "$Warning") 
{
Write-EventLog -LogName Application -Source "Network Share Monitoring" -EntryType warning -EventID 210 -Message "The Share $Share has disk space below 20 % and Current value is $freepercentagewithoutdecimal %"
} 