@echo on
REM clear existing project, download rivt-install, create new venv
REM set rivt folder
SET rvfolder=rivt-doc1
REM go to home directory
cd %HOMEPATH%
REM double check deactivation for dev purposes
uv deactivate
REM double check that old project is deleted
rmdir /s /q %rvfolder%
REM clean cache for dev purposes
uv cache clean
REM set up venv
mkdir %rvfolder%
REM change directory
cd %rvfolder%
REM download rivt install file
curl  https://raw.githubusercontent.com/rivt-info/rivt-win-install/refs/heads/main/rivt-install.cmd -O  
REM make venv
uv venv
REM activate venv
.venv/scripts/activate
