@echo off

cls

echo Welcome to Arthur's Shape Calculator

:menu
echo.
echo Select a shape:
echo 1. Circle
echo 2. Triangle
echo 3. Quadrilateral
echo 4. Exit

set /p choice=Enter your choice (1-4):

if "%choice%"=="1" (
  echo Enter the radius of the circle:
  set /p radius=
  if "%radius%"=="" (
    echo You haven't entered a radius. Please enter a number.
    goto menu
  )

  rem Calculate area of circle (pi * radius^2) using integer approximation for pi as 3
  else set /a area=3.14 * (%radius% * %radius%)

  echo Area of the circle: %area% square units
  goto menu
)

if "%choice%"=="2" (
  echo Enter the lengths of the three sides of the triangle:
  set /p side1=""
  set /p side2=""
  set /p side3=""

  if "%side1%"=="" or "%side2%"=="" or "%side3%"=="" (
    echo You haven't entered side lengths. Please enter three numbers.
    goto menu
  )

  rem Calculate semi-perimeter (s)
  set /a s=(%side1% + %side2% + %side3%) / 2

  rem Calculate area of triangle using Heron's formula
  set /a part1=!s! * (!s! - %side1%)
  set /a part2=part1 * (!s! - %side2%)
  set /a part3=part2 * (!s! - %side3%)
  set /a area=sqrt(part3)

  echo Area of the triangle: !area! square units

  rem Check triangle type (compare side lengths)
  if "%side1%"=="%side2%" (
    if "%side2%"=="%side3%" (
      echo Triangle type: Equilateral
    ) else (
      echo Triangle type: Isosceles
    )
  ) else (
    echo Triangle type: Scalene
  )

  goto menu
)

if "%choice%"=="3" (
  echo Enter the length and width of the quadrilateral:
  set /p length=""
  set /p width=""

  if "%length%"=="" or "%width%"=="" (
    echo You haven't entered dimensions. Please enter two numbers.
    goto menu
  )

  rem Calculate area of quadrilateral (length * width)
  set /a area=%length% * %width%

  echo Area of the quadrilateral: %area% square units

  rem Check quadrilateral type (compare length and width)
  if "%length%"=="%width%" (
    echo Quadrilateral type: Square
  ) else (
    echo Quadrilateral type: Rectangle
  )

  goto menu
)

if "%choice%"=="4" (
  echo Exiting Shape Calculator...
  exit /b 0
)

echo Invalid choice. Please enter a number between 1 and 4.
goto menu
