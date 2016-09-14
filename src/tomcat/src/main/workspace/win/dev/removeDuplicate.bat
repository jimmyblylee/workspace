@echo off
set str=a;%~1%;
if "%str%" == "a;;" goto :return
if "%str%" == "a;%%%2%%;" goto :return

set result=
set str=%str:;;=;%

:start  
set v=%str:*;=%
::echo %v%
set v=%v:;=&rem.%
::echo %v%
set v=%v%
if "%v%x" == "x" goto end
call set str=%%str:%v%;=%%
::echo %str%

set result=%result%%v%;
if not "%str%" == "a;" if not "%str%" == "a" goto :start

:end

set result==%result%
set "%2%=%%result%%"
:return