$appArray = "Code","firefox", "lync", "notepad++", "OUTLOOK", "chrome", "filezilla", "SQLA"

foreach ($app in $appArray)
{
    Start-Process $app
}

