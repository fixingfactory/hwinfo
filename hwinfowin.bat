@echo off
cls
echo +--------------+
echo ^| Laptop Model ^|
echo +--------------+
wmic csproduct get name
echo +---------------+
echo ^| Laptop Serial ^|
echo +---------------+
setlocal enabledelayedexpansion

set "serialNumber=undefined"
for /f "skip=1" %%a in ('wmic bios get serialnumber') do (
    set "line=%%a"
    if defined line (
        set "serialNumber=!line!"
        goto :found
    )
)

:found
set "serialNumber=!serialNumber: =!"

if "%serialNumber%" == "undefined" (
    echo No serial number was found.
) else (
    echo Serial number: %serialNumber%
)
echo.
echo +-------------+
echo ^| Laptop BIOS ^|
echo +-------------+
wmic bios get smbiosbiosversion
echo +------------------+
echo ^| Laptop Approx Age^|
echo +------------------+
echo.
@echo off
setlocal enabledelayedexpansion

for /f "skip=1 tokens=2 delims==" %%G in ('wmic bios get releasedate /format:list') do (
    set "releasedate=%%G"
    goto :next
)

:next
echo BIOS Release Date: %releasedate%

REM Extract year, month, and day from the release date
set "year=%releasedate:~0,4%"
set "month=%releasedate:~4,2%"
set "day=%releasedate:~6,2%"

REM Get the current date
for /f "tokens=1-3 delims=/." %%A in ("%date%") do (
    set "currentyear=%%C"
    set "currentmonth=%%A"
    set "currentday=%%B"
)

REM Calculate the approximate age
set /a "age=currentyear-year"
if %currentmonth% lss %month% set /a "age-=1"
if %currentmonth% equ %month% (
    if %currentday% lss %day% set /a "age-=1"
)

echo Approximate Laptop Age: %age% years

endlocal
echo.
echo +------------+
echo ^| Laptop RAM ^|
echo +------------+
for /f "usebackq" %%i in (`powershell -c "(Get-WmiObject Win32_OperatingSystem).TotalVisibleMemorySize"`) do set TotalVisibleMemorySize=%%i
echo The total visible memory size is: %TotalVisibleMemorySize% MB
for /f "usebackq" %%i in (`powershell -c "[math]::Round((Get-WmiObject Win32_OperatingSystem).TotalVisibleMemorySize / 1MB, 2)"`) do set TotalVisibleMemorySize=%%i
echo The total visible memory size is: %TotalVisibleMemorySize% GB
echo. 
echo Memory SIMMs/DIMMs details:
wmic MemoryChip get BankLabel, Capacity, MemoryType, TypeDetail, Speed
echo +------------+
echo ^| Laptop HDD ^|
echo +------------+
setlocal enabledelayedexpansion

rem Run PowerShell command and store the output in a temporary file
powershell -Command "$disks = Get-CimInstance -Class CIM_LogicalDisk | Where-Object DriveType -EQ '3'; foreach ($disk in $disks) { $sizeGB = $disk.size / 1gb; $freeSpaceGB = $disk.freespace / 1gb; $freePercentage = $disk.freespace / $disk.size * 100; Write-Output ('Size (GB): {0}, Free Space (GB): {1}, Free (%%): {2}, DeviceID: {3}, DriveType: {4}' -f $sizeGB, $freeSpaceGB, $freePercentage, $disk.DeviceID, $disk.DriveType) }" > temp.txt

rem Read the temporary file and display the HDD information
for /f "usebackq tokens=*" %%i in ("temp.txt") do (
    echo %%i
)

del temp.txt
endlocal

rem powershell -c "Get-CimInstance -Class CIM_LogicalDisk | Select-Object @{Name='Size (GB)';Expression={$_.size/1gb}}, @{Name='Free Space (GB)';Expression={$_.freespace/1gb}}, @{Name='Free (%%)';Expression={' {0,6:P0}' -f(($_.freespace/1gb) / ($_.size/1gb))}}, DeviceID, DriveType | Where-Object DriveType -EQ '3'"
echo.
echo +------------+
echo ^| Laptop CPU ^|
echo +------------+

for /f "skip=1 delims=" %%G in ('wmic cpu get name') do (
    set "cpu=%%G"
    goto :next
)

:next
echo CPU: %cpu%
