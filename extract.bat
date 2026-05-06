@echo off

:: Location for extraction
SET LOCATION=%userprofile%\Documents\defETS

:: Create location
if not exist %LOCATION% MKDIR %LOCATION%

:: Clean any remaining files
echo Cleaning the directory
del /f/s/q %LOCATION% > nul
rmdir /s/q %LOCATION%

:: Location to sk-zk extractor
SET EXTRACTOR="extractor.exe"
:: Get the sk-zk extractor here: https://github.com/sk-zk/Extractor/releases

:: Set 7z.exe location for archiving
SET ZIP="C:\Program Files\7-Zip\7z.exe"

:: Extract archives
%EXTRACTOR% -p=/def -S -a -q "C:\Program Files (x86)\Steam\steamapps\common\Euro Truck Simulator 2" -d %LOCATION%
%EXTRACTOR% -S -q "C:\Program Files (x86)\Steam\steamapps\common\Euro Truck Simulator 2\version.scs" -d %LOCATION% 
:: Extract locales
%EXTRACTOR% --deep -S -q "C:\Program Files (x86)\Steam\steamapps\common\Euro Truck Simulator 2\locale.scs" -d %LOCATION%

ECHO Zipping archive
%ZIP% a -mx=9 %LOCATION%\def %LOCATION%\*
ECHO Zipped

ECHO DONE
pause