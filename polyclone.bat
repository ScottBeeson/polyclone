
@echo off &setlocal
set seed=seed-element
set target=%1
@echo Creating new element named "%target%"
echo Creating Folder...
md %target%

call:WriteFile %seed%\%seed%.html %target%\%target%.html
call:WriteFile %seed%\%seed%.less %target%\%target%.less
call:WriteFile %seed%\demo.html %target%\demo.html
call:WriteFile %seed%\index.html %target%\index.html
call:WriteFile %seed%\readme.md %target%\readme.md
call:WriteFile %seed%\bower.json %target%\bower.json


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

