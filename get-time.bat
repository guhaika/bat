@echo off&setlocal enabledelayedexpansion
for /f "tokens=1-3 delims=-:/ " %%a in ("%date%") do (set Y=%%a&set M=%%b&set D=%%c&if "!M:~0,1!"=="0" set M=!M:~1!
if "!D:~0,1!"=="0" set D=!D:~1!)
set/a D-=1&if !D! leq 0 (set/a M-=1&if !M!==0 set/a Y-=1,M=12
set/a "T=^!(M-2)","R=(^!(Y%%4)&^!^!(Y%%100))|^!(Y%%400)","C=^!(M-4)|^!(M-6)|^!(M-9)|^!(M-11)","D=T*(28+R)+C*30+(^!T&^!C)*31"+D)
set M=0%M%&set D=0%D%
set mydate=%Y%%M:~-2%%D:~-2%
@echo %mydate%
pause