@echo off

:: Location for extraction
SET LOCATION=C:\Users\doode\Documents\defETS
if not exist %LOCATION% MKDIR %LOCATION%
:: Location to SCS Extractor
SET EXTRACTOR="C:\Program Files (x86)\Steam\steamapps\common\Euro Truck Simulator 2\scs_extractor.exe"
:: Get the SCS Game Archive Extractor here: http://download.eurotrucksimulator2.com/scs_extractor.zip

:: Set 7z.exe location for archiving
SET ZIP="C:\Program Files\7-Zip\7z.exe"

:: Extract archives
REM                                                 (               (                          (                      (                        (                        )))))                                          
for %%a in (*.scs) DO (IF NOT %%a == base.scs IF NOT %%a == base_cfg.scs IF NOT %%a == core.scs IF NOT %%a == effect.scs IF NOT %%a == locale.scs echo Unpacking %%~na & %EXTRACTOR% %%a %LOCATION%\%%~na >NUL )

:: Delete all non-def directories
for /D %%b in (%LOCATION%\*) do (echo Clean-up %%~nb & (for /D %%c in (%%b\*) do (IF NOT %%~nc == def RMDIR "%%c" /s /q)) & DEL %%b\%%~nb.manifest.sii)

ECHO Zipping archive
%ZIP% a -mx=9 %LOCATION%\def %LOCATION%\*
ECHO Zipped