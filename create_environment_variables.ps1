# ===============================================================================================================
# Function: Create Windows environment variables via pwsh CLI - CB 2021-06-04
# Sources: https://docs.microsoft.com/en-us/powershell/module/scheduledtasks/get-scheduledtask?view=windowsserver2019-ps
# ===============================================================================================================

 $EnvVariableName = @('ozk')
 $EnvVariableValue = @('K#36Cza!98ueCEKP')

$Index = 0

foreach($i in $EnvVariableName){
$EnvValueName = $EnvVariableValue[$Index]
[System.Environment]::SetEnvironmentVariable($i, $EnvValueName, [System.EnvironmentVariableTarget]::Machine)
$Index++
Write-Output $Index
Write-Output $i
Write-Output $EnvValueName
}