# ===============================================================================================================
# Function: Create Windows environment variables via pwsh CLI - CB 2021-06-04
# Sources: https://docs.microsoft.com/en-us/powershell/module/scheduledtasks/get-scheduledtask?view=windowsserver2019-ps
# ===============================================================================================================

 $EnvVariableName = @('hvd' , 'ad'  )
 $EnvVariableValue = @('', '')

$Index = 0


foreach($i in $EnvVariableName){
Write-Output $i
[System.Environment]::SetEnvironmentVariable($i, $EnvVariableValue[$Index], [System.EnvironmentVariableTarget]::Machine)
$Index++
Write-Output $Index
}