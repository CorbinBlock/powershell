param([String]$file_mask='')
#Set-Location 'C:\Users\cblock\'
#.\CountRowsFunction.ps1 **.csv*
#/*******************************************************************************
# SCRIPT: 
# PURPOSE: Functions for  operations
#
# NOTES:  
# 
# CREATED:    2020-08-18 Corbin Block
# MODIFIED: 
# DATE        AUTHOR              DESCRIPTION    
# REFERENCE: Previous error solved: https://github.com/PowerShell/vscode-powershell/issues/1308
# ------------------------------------------------------------------------------
#  
#*******************************************************************************

#Count rows in file
function countRows()
{
    $path_array = '\\processed', '\landing\'

    foreach ($path in $path_array)
    { 
        Set-Location $path
        Get-ChildItem -Path $path $file_mask -File | Foreach-Object { Get-content $_.FullName | Measure-Object -Line } 
    }
}

countRows