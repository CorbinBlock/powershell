param([String]$file_mask='')
#Set-Location 'C:\Users\cblock'
#.\attMoveToLandingFunction.ps1
#/*******************************************************************************
# SCRIPT: 
# PURPOSE: Functions for operations
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

#Send  to landing
function moveToLanding()
{
    If ($file_mask -eq '') {
        $file_mask = '*.txt'
        Write-Host $file_mask
        }  Else {
        Write-Host $file_mask
      } 

    $localLanding = 'C:\Users\cblock\'    
    
    $landing = '\\'
    $inputfolder = 'INPUT'
    $inputToFolder = [IO.Path]::Combine($landing, $inputfolder)
    $inputToFullPath = [IO.Path]::Combine($landing, $inputfolder, $file_mask)
    $landingFullPath = [IO.Path]::Combine($landing, $landing, $file_mask)
    $landingFullPath
    $fullLocalPath = [IO.Path]::Combine($localLanding, $file_mask)
    $fullLocalPath
    Move-Item -Path $fullLocalPath -Destination $inputToFolder
    Get-ChildItem $landingFullPath
    Get-ChildItem $inputToFullPath
}
moveToLanding