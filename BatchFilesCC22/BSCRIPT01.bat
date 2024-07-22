@echo off

echo Welcome to Arthur's Terminal
echo BSCRIPT01

:menu
cls  
rem Clear screen before displaying menu again

echo.
echo 1. Launch Personal Websites
echo 2. Launch Calculator
echo 3. Launch Notepad
echo 4. Shutdown Pc

set /p choice=Enter your choice (1-5): 

if %choice%==1 (
  echo Launching Personal Websites...
  Start https://www.facebook.com/
  Start https://www.youtube.com/
  Start https://9gag.com/
  Start https://www.reddit.com/
  Start https://github.com/
  goto menu  
  rem Return to the menu after launching websites
)

if %choice%==2 (
  echo Launching Calculator...
  start calc
  goto menu  
  rem Return to the menu after launching calculator
)

if %choice%==3 (
  echo Launching Notepad...
  start notepad
  goto menu  
  rem Return to the menu after launching notepad
)

if %choice%==4 (
  echo Shutdown PC
  set /p confirm=Are you sure you want to shutdown (Y/N) 
  if /i "%confirm%"=="Y" (
    echo Shutting down PC in 45 seconds...
    shutdown /s /t 45  
    rem Shutdown after 45 seconds
  ) else (
    echo Shutdown cancelled.
    goto menu  
    rem Return to the menu if user cancels shutdown
  )
)
  echo Invalid choice. Please enter a number between 1 and 5.


