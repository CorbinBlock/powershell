@echo off & setlocal enabledelayedexpansion
cd "path"
for /f %%i in (.\*filemask*)do set "_line=%%i"&& (
     for %%p in ("!_line:|=" "!")do set /a "_cnt+=1")&& set/a "_cnt-=1"& echo/!_cnt! & goto:nxt
    )
:nxt