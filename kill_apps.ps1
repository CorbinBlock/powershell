$appArray = "firefox", "lync", "notepad++", "OUTLOOK", "chrome", "filezilla", "SQLA", "Code"

foreach ($app in $appArray)
{
    Stop-Process -processname $app
    
}