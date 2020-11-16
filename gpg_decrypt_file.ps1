param([String]$email='*', [String]$file_path='*')

gpg -d $email $file_path