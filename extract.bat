@echo off
SETLOCAL ENABLEDELAYEDEXPANSION

:: Location for extraction
SET LOCATION=%HOME%\Documents\defETS

:: Counters
SET /A COUNT=0
SET /A CURRENT=1

:: Clean any remaining files
echo Cleaning the directory
del /f/s/q %LOCATION% > nul
rmdir /s/q %LOCATION%

:: Create location
if not exist %LOCATION% MKDIR %LOCATION%

:: Location to SCS Extractor
SET EXTRACTOR="C:\Program Files (x86)\Steam\steamapps\common\Euro Truck Simulator 2\scs_extractor.exe"
:: Get the SCS Game Archive Extractor here: http://download.eurotrucksimulator2.com/scs_extractor.zip

:: Set 7z.exe location for archiving
SET ZIP="C:\Program Files\7-Zip\7z.exe"

:: Count Archives
for %%l in (*.scs) DO (IF NOT %%l == base.scs IF NOT %%l == base_cfg.scs IF NOT %%l == core.scs IF NOT %%l == effect.scs IF NOT %%l == locale.scs SET /A COUNT=COUNT+1 )

:: Extract and clean archives
for %%a in (*.scs) DO (IF NOT %%a == base.scs IF NOT %%a == base_cfg.scs IF NOT %%a == core.scs IF NOT %%a == effect.scs IF NOT %%a == locale.scs echo|set /p="^(!CURRENT!\%COUNT%^) Unpacking %%~na" & %EXTRACTOR% %%a %LOCATION%\%%~na >NUL & echo|set /p=", Clean-up" & (for /D %%c in (%LOCATION%\%%~na\*) do ((IF NOT %%~nc == def RMDIR "%%c" /s /q >nul))) & DEL %LOCATION%\%%~na\%%~na.manifest.sii >nul & echo . Done. & SET /A CURRENT+=1 )

ECHO Zipping archive
%ZIP% a -mx=9 %LOCATION%\def %LOCATION%\*
ECHO Zipped