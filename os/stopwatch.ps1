# ===============================================================================================================
# Function: Call stopwatch object via pwsh CLI - CB 2021-06-09
# Sources: https://mcpmag.com/articles/2017/10/19/using-a-stopwatch-in-powershell.aspx
# .\call_stopwatch_functions.ps1 (25 * 60) (5 * 60) 12
# ===============================================================================================================

Write-Output "Welcome to Stopwatch!"

$ParamArray = @($args[0], $args[1], $args[2])
$StopwatchTypeArray = @("A", "B")
$LoopArray = @(0, $ParamArray[2], 1)
$PluralityTextArray = @("", "has", "s", "have")
$StopwatchNumber = 1
Function CallStopwatch ($Seconds, $Type, $Number) {   
    $Stopwatch = [system.diagnostics.stopwatch]::StartNew()
    WHILE ($Stopwatch.Elapsed.TotalSeconds -lt $Seconds) {
        Start-Sleep -Seconds 1
        $TotalSecs = [math]::Round($Stopwatch.Elapsed.TotalSeconds, 0)
        $PluralIndexOffset = 0
        IF ($TotalSecs -gt 1) { $PluralIndexOffset = 2 }
        $PluralString = $PluralityTextArray[$PluralIndexOffset]
        $PluralStringHas = $PluralityTextArray[$PluralIndexOffset + 1] 
        $OutputString = "Stopwatch - Type: [" + $Type + "] Number: [" + $Number + "] --> [" + $TotalSecs + "] second" + $PluralString + " out of [" + $Seconds + "] " + $PluralStringHas + " elapsed..."
        Write-Output $OutputString 
    }      
}
WHILE ($LoopArray[0] -lt $LoopArray[1]) {
    CallStopwatch -Seconds $ParamArray[0] -Type $StopwatchTypeArray[0] -Number $StopwatchNumber
    $StopwatchNumber++
    CallStopwatch -Seconds $ParamArray[1] -Type $StopwatchTypeArray[1] -Number $StopwatchNumber
    $LoopArray[0]++
    $OutputString = "This process has completed " + $LoopArray[2] + " of " + $LoopArray[1] + " loops."        
    Write-Output $OutputString 
    $LoopArray[2]++
}