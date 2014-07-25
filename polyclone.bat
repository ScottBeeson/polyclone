
@echo off &setlocal
set seed=%1
set target=%2
@echo Creating new element named "%target%"
echo Creating Folder...
md %target%

for %%i in (%seed%\*.*) do (
	set "filename=%%~ni"
	set ex=%%~xi
	echo %%~ni
	echo %seed%

    if %seed%==%%~ni (
        call:WriteFile %seed%\%%~ni%%~xi %target%\%target%%%~xi
    ) else (
        call:WriteFile %seed%\%%~ni%%~xi %target%\%%~ni%%~xi
    )
)


GOTO:EOF

:WriteFile
echo Writing %~1 to %~2
set "search=${NAME}"
set "replace=%target%"
set "textfile=%~1"
set "newfile=%~2"


(for /f "delims=" %%i in ('findstr /n "^" "%textfile%"') do (
    set "line=%%i"
    setlocal enabledelayedexpansion
    set "line=!line:%search%=%replace%!"
    echo(!line!
    endlocal
))>"%newfile%"

GOTO:EOF

:EOF
echo Done!

