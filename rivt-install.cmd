@echo on
REM run rivt-install, download example1
REM install rivt from GitHub
uv pip install git+https://github.com/rivtlib-dev/rivtlib#subdirectory=src
REM download example project
mkdir example1
cd example1
curl https://raw.githubusercontent.com/rivt-info/rivt-simple-single-doc/refs/heads/main/rv0000-simple-single-doc.py -O
curl https://github.com/rivt-info/rivt-simple-single-doc/blob/main/beam.png?raw=true -O -L

