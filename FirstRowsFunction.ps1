param([String]$file_mask='')
#Set-Location 'C:\Users\cblock\'
#.\FirstRowsFunction.ps1 *
#view first rows TODO can also use -Tail option 
function viewFirstRows()
{
    $landing = '\\\landing\'
    $inputfolder = 'INPUT'
    $inputPath = [IO.Path]::Combine($landing, $inputfolder, $fileMask)
    $archivePath = '\\hqklsan01\ifs\data\dtvof\prod\infa_shared\archive\'
    $path_array = $landingATT, $inputPath, $archivePath

    foreach ($path in $path_array)
    {
    Set-Location $path
    Get-Content $file_Mask | Select -first 10
    }
}
viewFirstRows