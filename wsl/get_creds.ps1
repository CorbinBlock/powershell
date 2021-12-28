function Get-ADCreds{
    $env:ad | clip.exe
}
function Get-AWSCreds{
    $env:aws | clip.exe
}
function Get-AWSRootCreds{
    $env:aws_root | clip.exe
}
function Get-OZKCreds{
    $env:ozk | clip.exe
}
function Get-KeepassCreds{
    $env:keepass | clip.exe
}
function Get-RedshiftCreds{
    Set-Location $env:marlette_dir
    ./Update_dBeaver_Config.bat
}
function Get-WindowsEC2Creds{
    $env:ec2_windows | clip.exe
}
function Get-Username{
    $env:USERNAME | clip.exe
}

# Get-ADCreds
# Get-AWSCreds
# Get-AWSRootCreds 
# Get-OZKCreds
# Get-KeepassCreds
# Get-RedshiftCreds
# Get-WindowsEC2Creds
# Get-Username