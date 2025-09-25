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
    call .venv/scripts/activate
    REM install rivt from GitHub
    uv pip install git+https://github.com/rivtlib-dev/rivtlib
    REM download example project into new folder
    mkdir example1
    cd example1
    curl https://raw.githubusercontent.com/rivt-info/rivt-simple-single-doc/refs/heads/main/rv0000-simple-single-doc.py -O
    curl https://github.com/rivt-info/rivt-simple-single-doc/blob/main/beam.png?raw=true -O -L
    REM run example with (no quotes )"python rv0000-simple-single-doc.py"
    cmd /k
