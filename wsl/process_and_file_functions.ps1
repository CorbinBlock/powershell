function Connect-PSQL {
    psql -U postgres
}
function Compress-Folder ($Path, $Source, $Target) { 
    Set-Location $Path
    $Compress = @{
        Path             = $Source
        CompressionLevel = "Fastest"
        DestinationPath  = $Target
    }
    Compress-Archive @Compress
}

function Copy-DailyFlatFiles ($File, $Type) {
    $FlatFileFullNameArray = ('stretch_log_20210101_template.xlsx', 'workout_log_20210101_template_1.xlsx', 'workout_log_20210101_template_2.xlsx')
    $FlatFileNamePrefixArray = ('stretch_log_', 'workout_log_')
    $FlatFileExtensionArray = ('.xlsx', '.csv')
    $SourceDir = $env:templates_dir
    $TargetDir = $env:onedrive_dir
    $DateString = $(get-date -f yyyyMMdd)
    # $FlatFileFullNameArray = "0" index for stretch_log, "1" for workout_log day one, "2" for workout_log day two
    $FullNameIndex = $File
    $PrefixIndex = $Type
    $FileNameSource = $FlatFileFullNameArray[$FullNameIndex]
    # $FlatFileNamePrefixArray = "0" index for stretch_log, "1" for workout_log
    $FileNameTarget = $FlatFileNamePrefixArray[$PrefixIndex] + $DateString + $FlatFileExtensionArray[0]
    Write-Output $FileNameSource
    Set-Location $SourceDir
    Copy-Item $FileNameSource $FileNameTarget
    Move-Item $FileNameTarget $TargetDir
    Set-Location -
}
function Copy-StretchLog { 
    Set-Location $env:scripts_dir
    .\PhysicalActivityLogsETL.ps1 stretch_log_
}

function Copy-WorkoutLog { 
    Set-Location $env:scripts_dir
    .\PhysicalActivityLogsETL.ps1 workout_log_
}
function Get-CPUProcs {
    Get-Process |
    Sort-Object CPU -Descending |
    Select-Object -First 20 -Property ProcessName,
    @{ n = "CPUUsage"; e = { [math]::round($_.CPU, 1) } }
}
function Get-LatestPwsh {
    Invoke-Expression "& { $(Invoke-RestMethod 'https://aka.ms/install-pscore' ) } -Daily"
}
function Get-LatestWindows {
    Import-Module PSWindowsUpdate
    Get-WindowsUpdate
    Install-WindowsUpdate -MicrosoftUpdate -AcceptAll -AutoReboot
}

function Get-PwshVersion {
    $PSVersionTable
}

function Get-WorkingSetMemoryProcs {
    Get-Process |
    Group-Object -Property Name | 
    Select-Object Name,
    @{Name = 'WorkingSet64'; Expression = { (($_.Group | Measure-Object WorkingSet64 -Sum ).Sum / 1MB) } } |
    Sort-Object -Property WorkingSet64 -Descending 
    | Select-Object -First 20 -Property Name,
    @{ n = "WorkingSet64MemUsageMB"; e = { [math]::round($_.WorkingSet64, 1) } }
}
function Measure-Distinct($Path, $File) {
    Set-Location $Path
    (Import-CSV $File | # | Select -ExpandProperty Domain |
        ForEach-Object { $_.psobject.properties.value -ne '' } |
        Sort-Object -Unique).Count
}

function Measure-Rows($Path, $File) {
    Set-Location $Path
    Get-ChildItem -Path $Path -File $File | Foreach-Object { Get-content $_.FullName | Measure-Object -Line } 
}
function Open-ScriptsDir {
    Set-Location $env:scripts_dir
    explorer.exe .
}
function Register-NewTask {
    # Get-ScheduledTask -TaskName update_windows
    # Start-ScheduledTask -TaskName update_windows
    $Server = whoami.exe
    $Task = "update_windows"
    $Arg = "-NoExit -File ""./update_windows.ps1"""
    $Dir = $env:scripts_dir
    $Exec = """C:\Users\cbloc\AppData\Local\Microsoft\powershell-daily\pwsh.exe"""
    $Act = New-ScheduledTaskAction -Execute $Exec -Argument $Arg -WorkingDirectory $Dir
    # $TaskTrigger = New-ScheduledTaskTrigger
    $PrincipalName = New-ScheduledTaskPrincipal $Server
    $TaskSettings = New-ScheduledTaskSettingsSet
    $TaskObject = New-ScheduledTask -Action $Act -Principal $PrincipalName -Settings $TaskSettings
    Register-ScheduledTask $Task -InputObject $TaskObject
    # Unregister-ScheduledTask update_windows
}

function Save-History {
    $FileNamePrefix = "powershell_notes_"
    $DateString = $(get-date -f yyyyMMddhhmmss)
    $ExtensionSource = '.txt'
    $FileNameTarget = $FileNamePrefix + $DateString + $ExtensionSource
    Set-Location $env:logs_dir
    Get-History > $FileNameTarget
    Get-ChildItem $FileNameTarget
    Get-Content $FileNameTarget
    Set-Location $env:scripts_dir
}

function Set-EnvionmentVariable ($Name, $Value) {
    $EnvVariableName = @($Name)
    $EnvVariableValue = @($Value)
    $Index = 0
    foreach ($i in $EnvVariableName) {
        Write-Output $i
        [System.Environment]::SetEnvironmentVariable($i, $EnvVariableValue[$Index], [System.EnvironmentVariableTarget]::Machine)
        $Index++
        Write-Output $Index
    }
}

function Search-Files ($Path, $File) {
Get-ChildItem -Path $Path -Filter $File -Recurse -ErrorAction SilentlyContinue | ForEach-Object{$_.FullName}
}

# Connect-PSQL
# Compress-Folder -Path $env:OneDrive -Source "logs" -Target "logs_archive_20210730.zip"
# Copy-DailyFlatFiles -File 0 -Type 0
# Copy-StretchLog
# Copy-WorkoutLog
# Get-CPUProcs
# Get-LatestPwsh
# Get-LatestWindows
# Get-PwshVersion
# Get-WorkingSetMemoryProcs
# Measure-Distinct -Path "C:\Users\cbloc\OneDrive - Block Consulting\archive\" -File "workout_log_20210728.csv"
# Measure-Rows -Path "C:\Users\cbloc\OneDrive - Block Consulting\archive\zips" -File "tax_20210614.zip"
# Open-ScriptsDir
# Register-NewTask
# Save-History
# Set-EnvionmentVariable -Name '<name>' -Value '<value>'
# Search-Files -Path "C:\Users\cblock\" -File "*.zip"