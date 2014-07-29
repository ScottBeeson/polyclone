
@echo off &setlocal
set /p template= Enter Template Folder:
set /p newname= Enter New Name:
set /p description= Enter Description:
echo Creating new element named "%newname%"
md %newname%

for %%i in (%template%\*.*) do (
	set "filename=%%~ni"
	set ex=%%~xi

    if %template%==%%~ni (
        call:WriteFile %template%\%%~ni%%~xi %newname%\%newname%%%~xi
    ) else (
        call:WriteFile %template%\%%~ni%%~xi %newname%\%%~ni%%~xi
    )
)


GOTO:EOF

:WriteFile
echo Writing %~1 to %~2
set "search=${NAME}"
set "search2=${DESCRIPTION}"
set "replace=%newname%"
set "replace2=%description%"
set "textfile=%~1"
set "newfile=%~2"


(for /f "delims=" %%i in ('findstr "." "%textfile%"') do (
    set "line=%%i"
    setlocal enabledelayedexpansion
    set "line=!line:%search%=%replace%!"
    set "line=!line:%search2%=%replace2%!"
    echo(!line!
    endlocal
))>"%newfile%"

GOTO:EOF

:EOF
echo Done!

