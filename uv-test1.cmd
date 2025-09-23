@echo on
REM go to home directory
cd %HOMEPATH%
REM double check deactivation for dev purposes
uv deactivate
REM double check that old project is deleted
rmdir /s /q rivt-doc1 
REM clean cache for dev purposes
uv cache clean
REM set up venv
mkdir rivt-doc1
REM change directory
cd rivt-doc1
REM make venv
uv venv
REM activate venv
.venv/scripts/activate
