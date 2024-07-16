@echo off

cls

echo Welcome to Arthur's File Management Utility

:menu
echo.
echo Select an action:
echo 1. Sort files by date and archive older files
echo 2. Sort archived files by size
echo 3. Display archived files
echo 4. Delete archived files
echo 5. Exit

set /p choice=Enter your choice (1-5):

if "%choice%"=="1" goto sort_and_archive
if "%choice%"=="2" goto sort_archived_by_size
if "%choice%"=="3" goto display_archived
if "%choice%"=="4" goto delete_archived
if "%choice%"=="5" goto exit

echo Invalid choice. Please enter a number between 1 and 5.
pause
goto menu

:sort_and_archive
echo Sorting files in "%sourcedrive%" by date...

rem Sort files and archive older ones (modify date range as needed)
for /f "tokens=*" %%a in ('dir /b /s /a-d /od "%sourcedrive%\*"') do (
  for %%b in ("%%a") do (
    if %%~ta LSS 2024-05-01 (
      move "%%a" "%archivedrive%" >nul 2>&1
    )
  )
)
echo Files sorted and older files archived.
pause
goto menu

:sort_archived_by_size
echo Sorting archived files in "%archivedrive%" by size...

rem Sort archived files by size (large to small)
for /f "tokens=*" %%a in ('dir /b /s /o-s /a-d "%archivedrive%\*"') do (
  echo %%a
)
pause
goto menu

:display_archived
echo The following large files were archived:

rem Display list of archived files
dir /b "%archivedrive%\*.*"
pause
goto menu

:delete_archived
echo Do you want to delete these archived files? (Y/N)
set /p confirmation=

if /i "%confirmation%"=="Y" (
  echo Deleting archived files...
  del /q "%archivedrive%\*.*" >nul 2>&1
  if errorlevel 1 (
    echo Deletion failed! Check file permissions or accessibility.
  ) else (
    echo Archived files deleted successfully.
  )
) else (
  echo Archived files kept.
)
pause
goto menu

:exit
echo Exiting Arthur's File Management Utility...
pause
exit /b 0
