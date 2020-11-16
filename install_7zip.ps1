# Unattended Install of 7-Zip 64-bit v19

$Installer7Zip = $env:TEMP + "\7z1900-x64.msi"; 
Invoke-WebRequest "https://www.7-zip.org/a/7z1900-x64.msi" -OutFile 
$Installer7Zip; 
msiexec /i $Installer7Zip /qb; 
Remove-Item $Installer7Zip;

#Install 7zip powershell module
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12;
Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force;
Set-PSRepository -Name 'PSGallery' -SourceLocation "https://www.powershellgallery.com/api/v2" -InstallationPolicy Trusted;
Install-Module -Name 7Zip4PowerShell -Force;