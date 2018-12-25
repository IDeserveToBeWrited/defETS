@ECHO OFF

:: Location for extraction
SET LOCATION=X:\defETS
MKDIR %LOCATION%
:: Location to SCS Extractor
SET EXTRACTOR="C:\Program Files (x86)\Steam\steamapps\common\Euro Truck Simulator 2\scs_extractor.exe"
:: Get the SCS Game Archive Extractor here: http://download.eurotrucksimulator2.com/scs_extractor.zip

:: Set 7z.exe location for archiving
SET ZIP="C:\Program Files\7-Zip\7z.exe"

:: Extract archives
ECHO Extracting def archive
%EXTRACTOR% def.scs %LOCATION%\def >NUL



:: dlc_balt
ECHO Extracting dlc_balt archive
%EXTRACTOR% dlc_balt.scs %LOCATION%\dlc_balt >NUL

RMDIR "%LOCATION%\dlc_balt\automat" /s /q
RMDIR "%LOCATION%\dlc_balt\map" /s /q
RMDIR "%LOCATION%\dlc_balt\material" /s /q
RMDIR "%LOCATION%\dlc_balt\model2" /s /q
RMDIR "%LOCATION%\dlc_balt\prefab2" /s /q
RMDIR "%LOCATION%\dlc_balt\road_template" /s /q
RMDIR "%LOCATION%\dlc_balt\unit" /s /q
RMDIR "%LOCATION%\dlc_balt\vehicle" /s /q
DEL %LOCATION%\dlc_balt\dlc_balt.manifest.sii



:: dlc_christmas
ECHO Extracting dlc_christmas archive
%EXTRACTOR% dlc_christmas.scs %LOCATION%\dlc_christmas >NUL

RMDIR "%LOCATION%\dlc_christmas\automat" /s /q
RMDIR "%LOCATION%\dlc_christmas\material" /s /q
RMDIR "%LOCATION%\dlc_christmas\vehicle" /s /q
DEL %LOCATION%\dlc_christmas\dlc_christmas.manifest.sii



:: dlc_daf_tuning_pack
ECHO Extracting dlc_daf_tuning_pack archive
%EXTRACTOR% dlc_daf_tuning_pack.scs %LOCATION%\dlc_daf_tuning_pack	 >NUL

RMDIR "%LOCATION%\dlc_daf_tuning_pack\automat" /s /q
RMDIR "%LOCATION%\dlc_daf_tuning_pack\material" /s /q
RMDIR "%LOCATION%\dlc_daf_tuning_pack\vehicle" /s /q
DEL %LOCATION%\dlc_daf_tuning_pack\dlc_daf_tuning_pack.manifest.sii



:: dlc_dragon
ECHO Extracting dlc_dragon archive
%EXTRACTOR% dlc_dragon.scs %LOCATION%\dlc_dragon >NUL

RMDIR "%LOCATION%\dlc_dragon\automat" /s /q
RMDIR "%LOCATION%\dlc_dragon\material" /s /q
RMDIR "%LOCATION%\dlc_dragon\vehicle" /s /q
DEL %LOCATION%\dlc_dragon\dlc_dragon.manifest.sii



:: dlc_east
ECHO Extracting dlc_east archive
%EXTRACTOR% dlc_east.scs %LOCATION%\dlc_east >NUL

RMDIR "%LOCATION%\dlc_east\automat" /s /q
RMDIR "%LOCATION%\dlc_east\map" /s /q
RMDIR "%LOCATION%\dlc_east\model" /s /q
RMDIR "%LOCATION%\dlc_east\material" /s /q
DEL %LOCATION%\dlc_east\dlc_east.manifest.sii



:: dlc_fantasy
ECHO Extracting dlc_fantasy archive
%EXTRACTOR% dlc_fantasy.scs %LOCATION%\dlc_fantasy >NUL

RMDIR "%LOCATION%\dlc_fantasy\material" /s /q
RMDIR "%LOCATION%\dlc_fantasy\vehicle" /s /q
DEL %LOCATION%\dlc_fantasy\dlc_fantasy.manifest.sii



:: dlc_fr
ECHO Extracting dlc_fr archive
%EXTRACTOR% dlc_fr.scs %LOCATION%\dlc_fr >NUL

RMDIR "%LOCATION%\dlc_fr\automat" /s /q
RMDIR "%LOCATION%\dlc_fr\map" /s /q
RMDIR "%LOCATION%\dlc_fr\material" /s /q
RMDIR "%LOCATION%\dlc_fr\model2" /s /q
RMDIR "%LOCATION%\dlc_fr\prefab2" /s /q
RMDIR "%LOCATION%\dlc_fr\road_template" /s /q
RMDIR "%LOCATION%\dlc_fr\vehicle" /s /q
DEL %LOCATION%\dlc_fr\dlc_fr.manifest.sii



:: dlc_halloween
ECHO Extracting dlc_halloween archive
%EXTRACTOR% dlc_halloween.scs %LOCATION%\dlc_halloween >NUL

RMDIR "%LOCATION%\dlc_halloween\automat" /s /q
RMDIR "%LOCATION%\dlc_halloween\material" /s /q
RMDIR "%LOCATION%\dlc_halloween\vehicle" /s /q
DEL %LOCATION%\dlc_halloween\dlc_halloween.manifest.sii



:: dlc_heavy_cargo
ECHO Extracting dlc_heavy_cargo archive
%EXTRACTOR% dlc_heavy_cargo.scs %LOCATION%\dlc_heavy_cargo >NUL

RMDIR "%LOCATION%\dlc_heavy_cargo\automat" /s /q
RMDIR "%LOCATION%\dlc_heavy_cargo\material" /s /q
RMDIR "%LOCATION%\dlc_heavy_cargo\vehicle" /s /q
DEL %LOCATION%\dlc_heavy_cargo\dlc_heavy_cargo.manifest.sii



:: dlc_it
ECHO Extracting dlc_it archive
%EXTRACTOR% dlc_it.scs %LOCATION%\dlc_it >NUL

RMDIR "%LOCATION%\dlc_it\automat" /s /q
RMDIR "%LOCATION%\dlc_it\map" /s /q
RMDIR "%LOCATION%\dlc_it\material" /s /q
RMDIR "%LOCATION%\dlc_it\model2" /s /q
RMDIR "%LOCATION%\dlc_it\prefab2" /s /q
RMDIR "%LOCATION%\dlc_it\unit" /s /q
RMDIR "%LOCATION%\dlc_it\vehicle" /s /q
DEL %LOCATION%\dlc_it\dlc_it.manifest.sii


:: dlc_krone
ECHO Extracting dlc_krone archive
%EXTRACTOR% dlc_krone.scs %LOCATION%\dlc_krone >NUL

RMDIR "%LOCATION%\dlc_krone\automat" /s /q
RMDIR "%LOCATION%\dlc_krone\material" /s /q
RMDIR "%LOCATION%\dlc_krone\vehicle" /s /q
DEL %LOCATION%\dlc_krone\dlc_krone.manifest.sii



:: dlc_metallics
ECHO Extracting dlc_metallics archive
%EXTRACTOR% dlc_metallics.scs %LOCATION%\dlc_metallics >NUL

RMDIR "%LOCATION%\dlc_metallics\material" /s /q
RMDIR "%LOCATION%\dlc_metallics\vehicle" /s /q
DEL %LOCATION%\dlc_metallics\dlc_metallics.manifest.sii



:: dlc_metallics2
ECHO Extracting dlc_metallics2 archive
%EXTRACTOR% dlc_metallics2.scs %LOCATION%\dlc_metallics2 >NUL

RMDIR "%LOCATION%\dlc_metallics2\material" /s /q
RMDIR "%LOCATION%\dlc_metallics2\vehicle" /s /q
DEL %LOCATION%\dlc_metallics2\dlc_metallics2.manifest.sii



:: dlc_michelin
ECHO Extracting dlc_michelin archive
%EXTRACTOR% dlc_michelin.scs %LOCATION%\dlc_michelin >NUL

RMDIR "%LOCATION%\dlc_michelin\automat" /s /q
RMDIR "%LOCATION%\dlc_michelin\material" /s /q
RMDIR "%LOCATION%\dlc_michelin\vehicle" /s /q
DEL %LOCATION%\dlc_michelin\dlc_michelin.manifest.sii



:: dlc_mighty_griffin
ECHO Extracting dlc_mighty_griffin archive
%EXTRACTOR% dlc_mighty_griffin.scs %LOCATION%\dlc_mighty_griffin >NUL

RMDIR "%LOCATION%\dlc_mighty_griffin\automat" /s /q
RMDIR "%LOCATION%\dlc_mighty_griffin\material" /s /q
RMDIR "%LOCATION%\dlc_mighty_griffin\vehicle" /s /q
DEL %LOCATION%\dlc_mighty_griffin\dlc_mighty_griffin.manifest.sii



:: dlc_north
ECHO Extracting dlc_north archive
%EXTRACTOR% dlc_north.scs %LOCATION%\dlc_north >NUL

RMDIR "%LOCATION%\dlc_north\automat" /s /q
RMDIR "%LOCATION%\dlc_north\map" /s /q
RMDIR "%LOCATION%\dlc_north\material" /s /q
RMDIR "%LOCATION%\dlc_north\model2" /s /q
RMDIR "%LOCATION%\dlc_north\prefab2" /s /q
RMDIR "%LOCATION%\dlc_north\vehicle" /s /q
DEL %LOCATION%\dlc_north\dlc_north.manifest.sii



:: dlc_oversize
ECHO Extracting dlc_oversize archive
%EXTRACTOR% dlc_oversize.scs %LOCATION%\dlc_oversize >NUL

RMDIR "%LOCATION%\dlc_oversize\automat" /s /q
RMDIR "%LOCATION%\dlc_oversize\map" /s /q
RMDIR "%LOCATION%\dlc_oversize\material" /s /q
RMDIR "%LOCATION%\dlc_oversize\unit" /s /q
RMDIR "%LOCATION%\dlc_oversize\vehicle" /s /q
DEL %LOCATION%\dlc_oversize\dlc_oversize.manifest.sii



:: dlc_phys_flags
ECHO Extracting dlc_phys_flags archive
%EXTRACTOR% dlc_phys_flags.scs %LOCATION%\dlc_phys_flags >NUL

RMDIR "%LOCATION%\dlc_phys_flags\material" /s /q
RMDIR "%LOCATION%\dlc_phys_flags\vehicle" /s /q
DEL %LOCATION%\dlc_phys_flags\dlc_phys_flags.manifest.sii



:: dlc_pirates
ECHO Extracting dlc_pirates archive
%EXTRACTOR% dlc_pirates.scs %LOCATION%\dlc_pirates >NUL

RMDIR "%LOCATION%\dlc_pirates\automat" /s /q
RMDIR "%LOCATION%\dlc_pirates\material" /s /q
RMDIR "%LOCATION%\dlc_pirates\vehicle" /s /q
DEL %LOCATION%\dlc_pirates\dlc_pirates.manifest.sii



:: dlc_prehistoric
ECHO Extracting dlc_prehistoric archive
%EXTRACTOR% dlc_prehistoric.scs %LOCATION%\dlc_prehistoric >NUL

RMDIR "%LOCATION%\dlc_prehistoric\material" /s /q
RMDIR "%LOCATION%\dlc_prehistoric\vehicle" /s /q
DEL %LOCATION%\dlc_prehistoric\dlc_prehistoric.manifest.sii



:: dlc_raven
ECHO Extracting dlc_raven archive
%EXTRACTOR% dlc_raven.scs %LOCATION%\dlc_raven >NUL

RMDIR "%LOCATION%\dlc_raven\automat" /s /q
RMDIR "%LOCATION%\dlc_raven\material" /s /q
RMDIR "%LOCATION%\dlc_raven\vehicle" /s /q
DEL %LOCATION%\dlc_raven\dlc_raven.manifest.sii



:: dlc_rims
ECHO Extracting dlc_rims archive
%EXTRACTOR% dlc_rims.scs %LOCATION%\dlc_rims >NUL

RMDIR "%LOCATION%\dlc_rims\automat" /s /q
RMDIR "%LOCATION%\dlc_rims\material" /s /q
RMDIR "%LOCATION%\dlc_rims\vehicle" /s /q
DEL %LOCATION%\dlc_rims\dlc_rims.manifest.sii



:: dlc_rocket_league
ECHO Extracting dlc_rocket_league archive
%EXTRACTOR% dlc_rocket_league.scs %LOCATION%\dlc_rocket_league >NUL

RMDIR "%LOCATION%\dlc_rocket_league\automat" /s /q
RMDIR "%LOCATION%\dlc_rocket_league\material" /s /q
RMDIR "%LOCATION%\dlc_rocket_league\vehicle" /s /q
DEL %LOCATION%\dlc_rocket_league\dlc_rocket_league.manifest.sii



:: dlc_schwarzmuller
ECHO Extracting dlc_schwarzmuller archive
%EXTRACTOR% dlc_schwarzmuller.scs %LOCATION%\dlc_schwarzmuller >NUL

RMDIR "%LOCATION%\dlc_schwarzmuller\automat" /s /q
RMDIR "%LOCATION%\dlc_schwarzmuller\material" /s /q
RMDIR "%LOCATION%\dlc_schwarzmuller\vehicle" /s /q
DEL %LOCATION%\dlc_schwarzmuller\dlc_schwarzmuller.manifest.sii



:: dlc_space
ECHO Extracting dlc_space archive
%EXTRACTOR% dlc_space.scs %LOCATION%\dlc_space >NUL

RMDIR "%LOCATION%\dlc_space\automat" /s /q
RMDIR "%LOCATION%\dlc_space\material" /s /q
RMDIR "%LOCATION%\dlc_space\vehicle" /s /q
DEL %LOCATION%\dlc_space\dlc_space.manifest.sii



:: dlc_toys
ECHO Extracting dlc_toys archive
%EXTRACTOR% dlc_toys.scs %LOCATION%\dlc_toys >NUL

RMDIR "%LOCATION%\dlc_toys\automat" /s /q
RMDIR "%LOCATION%\dlc_toys\material" /s /q
RMDIR "%LOCATION%\dlc_toys\unit" /s /q
RMDIR "%LOCATION%\dlc_toys\vehicle" /s /q
DEL %LOCATION%\dlc_toys\dlc_toys.manifest.sii



:: dlc_trailers
ECHO Extracting dlc_trailers archive
%EXTRACTOR% dlc_trailers.scs %LOCATION%\dlc_trailers >NUL

RMDIR "%LOCATION%\dlc_trailers\automat" /s /q
RMDIR "%LOCATION%\dlc_trailers\material" /s /q
RMDIR "%LOCATION%\dlc_trailers\vehicle" /s /q
DEL %LOCATION%\dlc_trailers\dlc_trailers.manifest.sii



:: dlc_vikings
ECHO Extracting dlc_vikings archive
%EXTRACTOR% dlc_vikings.scs %LOCATION%\dlc_vikings >NUL
RMDIR "%LOCATION%\dlc_vikings\material" /s /q
RMDIR "%LOCATION%\dlc_vikings\vehicle" /s /q
DEL %LOCATION%\dlc_vikings\dlc_vikings.manifest.sii



:: dlc_winter
ECHO Extracting dlc_winter archive
%EXTRACTOR% dlc_winter.scs %LOCATION%\dlc_winter >NUL
RMDIR "%LOCATION%\dlc_winter\automat" /s /q
RMDIR "%LOCATION%\dlc_winter\material" /s /q
RMDIR "%LOCATION%\dlc_winter\vehicle" /s /q
DEL %LOCATION%\dlc_winter\dlc_winter.manifest.sii

ECHO.
ECHO.

ECHO Zipping archive
%ZIP% a -mx=9 %LOCATION%\def %LOCATION%\*
ECHO Zipped