#/*******************************************************************************
# SCRIPT: archive.ps1
# PURPOSE: Archive Daily Files
#
# 
# CREATED:    2020-08-19 Corbin Block
# MODIFIED: 
# DATE        AUTHOR              DESCRIPTION    
# REFERENCE: https://stackoverflow.com/questions/1153126/how-to-create-a-zip-archive-with-powershell
# ------------------------------------------------------------------------------
#  
#*******************************************************************************
$archiveSourceFolder = '\\'

#zip historical files in the outbound processed directory
#exclusion to not attempt to zip .zip and .tar.gz files 
function zipFiles()
{
$7zip = 'C:\Program Files\7-Zip\7z.exe'
$exclusions = '.zip', '.gz'
Set-Location $archiveSourceFolder
Get-ChildItem $archiveSourceFolder -Filter "*hist*" | Where-Object {
    $_.Extension -notin $exclusions }  |
Foreach-Object {
    
   & $7zip a -tzip ($_.Name+".zip") $_.Name 
}
}

zipFiles

#delete files in current directory without .zip extension
#exclusion to not delete .zip and .tar.gz files 
function deleteOriginalFiles()
{
$exclusions = '.zip', '.gz'
Get-ChildItem $archiveSourceFolder -Filter "*hist*" | Where-Object {
   $_.Extension -notin $exclusions } | `
   Remove-Item
}

deleteOriginalFiles

