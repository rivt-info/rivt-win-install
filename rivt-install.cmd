@echo on
REM run this file - rivt-install
REM activates venv, installs rivt, downloads example
REM activate venv
.venv/scripts/activate
REM install rivt from GitHub
uv pip install git+https://github.com/rivtlib-dev/rivtlib
REM download example project into new folder
mkdir example1
cd example1
curl https://raw.githubusercontent.com/rivt-info/rivt-simple-single-doc/refs/heads/main/rv0000-simple-single-doc.py -O
curl https://github.com/rivt-info/rivt-simple-single-doc/blob/main/beam.png?raw=true -O -L
REM run example with (no quotes )"python rv0000-simple-single-doc.py"

