@echo off
setlocal enabledelayedexpansion
set USERNAME=%1
set PAGE=1

:loop
for /f "delims=" %%i in ('curl -s "https://api.github.com/users/%USERNAME%/repos?page=%PAGE%&per_page=100" ^| jq -r ".[].clone_url"') do (
    set REPO_NAME=%%~ni
    if exist !REPO_NAME! (
        echo Updating existing repository: !REPO_NAME!
        cd !REPO_NAME!
        git fetch origin
        git diff --exit-code || echo Warning: Local changes detected in !REPO_NAME! - skipping pull
        git diff --quiet && git pull origin master
        cd ..
    ) else (
        echo Cloning new repository: !REPO_NAME!
        git clone %%i
    )
)

set /a PAGE=%PAGE%+1
curl -I -s "https://api.github.com/users/%USERNAME%/repos?page=%PAGE%&per_page=100" | find "HTTP/1.1 200" > nul
if %errorlevel%==0 goto loop

endlocal
