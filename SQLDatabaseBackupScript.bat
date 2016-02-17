@echo off
SET backupDir=C:\Game Servers\Backup\dbdump\
SET backupTime=%date:~0,2%-%date:~4,2%-%date:~7,2%_%time:~0,2%-%time:~3,2%

REM "Dump the database to the file."
echo %backupDir%\%backupTime%.sql
"C:\Program Files\MySQL\MySQL Server 5.6\bin\mysqldump" --user=usernamehere --password=passwordhere exile > "%backupDir%%backupTime%.sql