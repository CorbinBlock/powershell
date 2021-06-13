$PathArray = @('C:\Program Files (x86)\Google\Chrome\Application\chrome.exe','C:\Program Files (x86)\Microsoft Office\root\Office16\ONENOTE.EXE', 'C:\Program Files (x86)\Microsoft Office\root\Office16\OUTLOOK.EXE', 'C:\Program Files (x86)\VMware\VMware Horizon View Client\vmware-view.exe', 'C:\Program Files (x86)\Common Files\Pulse Secure\JamUI\Pulse.exe', 'C:\Users\cblock\AppData\Local\Mozilla Firefox\firefox.exe')


# 'C:\Program Files (x86)\Microsoft SQL Server Management Studio 18\Common7\IDE\Ssms.exe',
# 'C:\Program Files (x86)\KeePass Password Safe 2\KeePass.exe',
# , 'C:\Windows\system32\taskschd.msc'
# 'C:\Users\cblock\AppData\Local\Programs\Microsoft VS Code\Code.exe' # Covered by .bat script

foreach($i in $PathArray)
{
Invoke-Item $i
}
.\open_vs_code.bat