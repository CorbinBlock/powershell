function Read-S3Bucket {
    $SourcePath = $args[0]
    aws s3 ls $SourcePath
}

function Copy-S3ObjectEC2 ($Object) {
    $SourceFile = $Object
    $S3BucketName = $args[0]
    $SourcePath = $S3BucketName + $SourceFile
    $TargetPath = "C:\tmp"
    aws s3 cp $SourcePath $TargetPath
}
Read-S3Bucket
Copy-S3ObjectEC2 -Object $args[1]