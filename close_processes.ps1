$ProcessArray = @('chrome', 'firefox', 'Teams', 'Pulse', 'KeePass', 'OUTLOOK', 'Ssms', 'ONENOTE')

foreach($i in $ProcessArray)
{
Stop-Process -Name $i
}