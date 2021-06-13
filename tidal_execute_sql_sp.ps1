$ServerParam=$args[0]
$DatabaseParam=$args[1]
$QueryParam=$args[2]
sqlcmd -S $ServerParam -d $DatabaseParam -Q $QueryParam
pause