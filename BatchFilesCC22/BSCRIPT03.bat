@echo off

cls

echo Welcome to Arthur's Utility Launcher

:menu
echo.
echo Select a utility to run:
echo 1. ipconfig (Display network configuration)
echo 2. tasklist / taskkill (Manage processes)
echo 3. chkdsk (Check disk)
echo 4. format (Format a drive) - **WARNING! This erases data**
echo 5. defrag (Defragment a drive)
echo 6. find (Search for files)
echo 7. attrib (Change file attributes)
echo 8. Clear Screen
echo 9. Exit

set /p choice=Enter your choice (1-9):

rem Check user choice and execute corresponding utility
if "%choice%"=="1" (
  ipconfig
  pause
  goto menu
)

if "%choice%"=="2" (
  echo Enter a process name:
  set /p process=
  if "%process%"=="" (
    echo You haven't entered a process name.
    pause
    goto menu
  )
  if "%process%"=="tasklist" (
    tasklist
  ) else (
    echo Are you sure you want to terminate process "%process%"? (Y/N)
    set /p confirmation=
    if /i "%confirmation%"=="Y" (
      taskkill /F /IM "%process%"
      if errorlevel 1 (
        echo Process termination failed. Check the name or access rights.
      )
    ) else (
      echo Process termination cancelled.
    )
  )
  pause
  goto menu
)

if "%choice%"=="3" (
  echo Enter the drive letter to check:
  set /p drive=
  if "%drive%"=="" (
    echo You haven't entered a drive letter.
    pause
    goto menu
  )
  echo Are you sure you want to check disk %drive%? This might take a while. (Y/N)
  set /p confirmation=
  if /i "%confirmation%"=="Y" (
    chkdsk %drive% /f
    if errorlevel 1 (
      echo Disk check failed. Consider running a chkdsk with additional options.
    ) else (
      echo Disk check completed.
    )
  ) else (
    echo Disk check cancelled.
  )
  pause
  goto menu
)

if "%choice%"=="4" (
  echo **WARNING! Formatting erases all data on the drive!**
  echo Enter the drive letter to format,put colon after letter:
  set /p drive=
  if "%drive%"=="" (
    echo You haven't entered a drive letter.
    pause
    goto menu
  )
  echo Are you sure you want to format drive %drive%? (Y/N)
  set /p confirmation=
  if /i "%confirmation%"=="Y" (
    format %drive% /FS:NTFS /Q /Y
    if errorlevel 1 (
      echo Formatting failed. Check drive accessibility.
    ) else (
      echo Drive %drive% formatted successfully.
    )
  ) else (
    echo Formatting cancelled.
  )
  pause
  goto menu
)

if "%choice%"=="5" (
  echo Enter the drive letter to defragment,put colon after letter:
  set /p drive=
  if "%drive%"=="" (
    echo You haven't entered a drive letter.
    pause
    goto menu
  )
  echo Are you sure you want to defragment drive %drive%? (Y/N)
  set /p confirmation=
  if /i "%confirmation%"=="Y" (
    defrag %drive%
    if errorlevel 1 (
      echo Defragmentation failed. Check drive accessibility.
    ) else (
      echo Drive %drive% defragmented.
    )
  ) else (
    echo Defragmentation cancelled.
  )
  pause
  goto menu
)

if "%choice%"=="6" (
  echo Enter the search term,use *:
  set /p searchterm=
  if "%searchterm%"=="" (
    echo You haven't entered a search term.
    pause
    goto menu
  )
  echo Searching for files matching "%searchterm%"...
  dir /b /s %searchterm%
  pause
  goto menu
)

if "%choice%"=="7" (
  echo Enter the file path and new attributes,example, C:\file.txt +r -h:
  set /p fileattrib=
  if "%fileattrib%"=="" (
    echo You haven't entered file path and attributes.
    pause
    goto menu
  )
  echo Are you sure you want to change attributes for "%fileattrib%"? (Y/N)
  set /p confirmation=
  if /i "%confirmation%"=="Y" (
    attrib %fileattrib%
    if errorlevel 1 (
      echo Attribute change failed. Check file path or access rights.
    ) else (
      echo Attributes for "%fileattrib%" changed successfully.
    )
  ) else (
    echo Attribute change cancelled.
  )
  pause
  goto menu
)

if "%choice%"=="8" (
  cls
  echo Screen cleared.
  pause
  goto menu
)

if "%choice%"=="9" (
  echo Exiting Utility Launcher...
  exit /b 0
)

echo Invalid choice. Please enter a number between 1 and 9.
pause
goto menu
