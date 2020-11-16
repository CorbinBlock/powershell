param([String]$file_mask='')
#.\FileSearchFunction.ps1
function fileSearch()
{
    $landing = '\\'
    $inputfolder = ''
    $inputPath = [IO.Path]::Combine($landing, $inputfolder, $file_mask)
    $archivePath = '\\'
    $path_array = $archivePath, $landing, $inputPath

    #search 
    $todayDate = Get-Date -Format 'yyyyMMdd'

    $FileName = '**'
    $FileName = $FileName + $todayDate + '*'
    

    $file_array = '**', $FileName
    
    If ($file_mask -eq '') {
        Write-Host $file_array
        }  Else {
        $file_array = '*',  $file_mask
        
      } 

    foreach ($file in $file_array)
    {
    foreach ($path in $path_array)
    {
    Get-ChildItem -Path $path $file -File | Sort-Object LastWriteTime -Descending
    }
    }
}

fileSearch