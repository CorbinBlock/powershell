# ===============================================================================================================
# Function: Compress files/folders via pwsh CLI - CB 2021-06-04
# Sources: https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.archive/compress-archive?view=powershell-7.1
# ===============================================================================================================
Set-Location "C:\Users\cblock"
$Compress = @{
    Path = ".\archive\"
    CompressionLevel = "Fastest"
    DestinationPath = ".\archive_2_20210614.zip"
  }
  Compress-Archive @Compress