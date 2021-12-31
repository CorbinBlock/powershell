function Read-S3Bucket {
    $SourcePath = $env:s3_bucket_name
    aws s3 ls $SourcePath
}

function Copy-S3ObjectEC2 ($Object) {
    $SourceFile = $Object
    $S3BucketName = $env:s3_bucket_name
    $SourcePath = $S3BucketName + $SourceFile
    $TargetPath = "C:\Users\Administrator\data_files"
    aws s3 cp $SourcePath $TargetPath
}
Read-S3Bucket
Copy-S3ObjectEC2 -Object "PowerShell-7.1.3-win-x64.msi"