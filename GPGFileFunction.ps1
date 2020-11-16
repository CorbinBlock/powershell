param([String]$file_mask='')
#Set-Location 'C:\Users\cblock\'
#.\GPGFileFunction.ps1
#/*******************************************************************************
# SCRIPT: 
# PURPOSE: Functions for  operations
#
# NOTES:  
# 
# CREATED:    2020-08-18 Corbin Block
# MODIFIED: 
# DATE        AUTHOR              DESCRIPTION    
# REFERENCE: 
# ------------------------------------------------------------------------------
#  
#*******************************************************************************

function gpgFile()
{
$inputfolder = '\\'
$archivePath = '\\'
$todayDate = Get-Date -Format 'yyyyMMdd'
$todayDate = '20201015' #ADHOC
$filenameStart = ''
$filenameNonStart = ''
$fileNameEnd = '.txt'
$gpgExt = '.gpg'

$nonWirelessFileNameGPG = $filenameNonStart + $todayDate + $fileNameEnd + $gpgExt
$WirelessFileNameGPG = $filenameStart + $todayDate + $fileNameEnd + $gpgExt

$nonWirelessFileName = $filenameNonStart + $todayDate + $fileNameEnd
$WirelessFileName = $filenameStart + $todayDate + $fileNameEnd

$nonPathGPG = [IO.Path]::Combine($inputfolder, $nonWirelessFileNameGPG)
$nonPath = [IO.Path]::Combine($inputfolder, $nonWirelessFileName)

$PathGPG = [IO.Path]::Combine($inputfolder, $WirelessFileNameGPG)
$fullPath = [IO.Path]::Combine($inputfolder, $WirelessFileName)

Set-Location $inputfolder
gpg --pinentry-mode=loopback --passphrase "654" -d -o  $nonPath $nonPathGPG
#gpg -d -o  $nonPath $nonPathGPG

gpg --pinentry-mode=loopback --passphrase "654" -d -o  $fullPath $PathGPG
#gpg -d -o  $fullPath $PathGPG

Move-Item $PathGPG $archivePath
Move-Item $nonPathGPG $archivePath
}
gpgFile