::@ECHO OFF
:: Create backup of OBS Settings
SET "BACKUP_DIR_PATH=C:\obs_backup"
:: To delete old backups
SET "DELETE_BACKUP_AFTER_DAYS=14"

:: Getting ods path
SET "OBS_SETTINGS_PATH=%AppData%\obs-studio"

SET DATE_TIME_STRING=%date:~-4%_%date:~3,2%_%date:~0,2%-%time:~0,2%_%time:~3,2%_%time:~6,2%
SET "BACKUP_DIR_PATH_DATE=%BACKUP_DIR_PATH%\%DATE_TIME_STRING%_obs_backup"
MD "%BACKUP_DIR_PATH_DATE%"
ECHO %BACKUP_DIR_PATH_DATE%
xcopy "%OBS_SETTINGS_PATH%" "%BACKUP_DIR_PATH_DATE%" /E/H/I
forfiles -p "%BACKUP_DIR_PATH%" -d -%DELETE_BACKUP_AFTER_DAYS% -c "cmd /c IF @isdir == TRUE rd /S /Q @path"
