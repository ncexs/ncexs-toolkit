@echo off
setlocal

:: --- Part 1: Find the toolkit file ---
set "target_pattern=ncexs-toolkit*.ps1"
set count=0
set "found_file="

:: 1. Count how many toolkit files are in this folder
for %%f in (%target_pattern%) do (
    set /a count+=1
    set "found_file=%%f"
)

:: 2. Check the results
if %count% == 0 (
    echo [ERROR] No script file matching (%target_pattern%) was found.
    echo Please make sure the .ps1 file is in this folder.
    goto :end
)
if %count% GTR 1 (
    echo [ERROR] Found MORE THAN ONE toolkit file in this folder.
    echo Please delete the old versions, leaving only ONE .ps1 file.
    echo.
    dir %target_pattern% /b
    goto :end
)

:: --- Part 2: Automatic Unblock ---
echo.
echo Attempting to register %found_file% with the system...
:: This command attempts to remove the "Mark of the Web" (internet seal).
:: If the file isn't blocked, this command does nothing (silently).
powershell.exe -noprofile -executionpolicy bypass -command "Unblock-File -Path '.\%found_file%'" > nul 2>&1

:: --- Part 3: Run the Main Script ---
echo Running %found_file%...
powershell.exe -ExecutionPolicy Bypass -NoProfile -File ".\%found_file%"

:end
echo.
echo Press any key to exit...
pause > nul