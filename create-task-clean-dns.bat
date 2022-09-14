@echo off

REM https://msdn.microsoft.com/zh-cn/library/windows/desktop/bb736357(v=vs.85).aspx

SET RUNCMD="cmd /c 'ipconfig/flushdns >> '%~dp0cleandns.log''"

SET RUN_USER=%USERNAME%
WHOAMI /GROUPS | FIND "12288" > NUL && SET RUN_USER="SYSTEM"

ECHO Create task run as %RUN_USER%
schtasks /Create /SC HOURLY /MO 3 /TR %RUNCMD% /TN "clean-DNS" /F /RU "%RUN_USER%"

PAUSE
