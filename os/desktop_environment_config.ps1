Set-Location C:\Users\Corbin\Downloads

Invoke-WebRequest -Uri https://cdn.akamai.steamstatic.com/client/installer/SteamSetup.exe  -OutFile SteamSetup.exe

Invoke-WebRequest -Uri https://awscli.amazonaws.com/AWSCLIV2.msi -OutFile AWSCLIV2.msi

Invoke-WebRequest -Uri https://download.jetbrains.com/toolbox/jetbrains-toolbox-1.21.9712.exe -OutFile jetbrains-toolbox-1.21.9712.exe

Invoke-WebRequest -Uri https://github.com/PowerShell/PowerShell/releases/download/v7.2.0/PowerShell-7.2.0-win-x64.msi -OutFile PowerShell-7.2.0-win-x64.msi
