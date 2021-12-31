Set-Location C:\git\music
aws s3 cp wav s3://music-bucket-reaper --recursive
aws s3 ls s3://music-bucket-reaper
