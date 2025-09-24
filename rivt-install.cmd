@echo on
REM run rivt-install, download example1
REM install rivt from GitHub
uv pip install git+https://github.com/rivtlib-dev/rivtlib#subdirectory=src
REM download example project
mkdir example1
cd example1
curl https://github.com/rivt-info/rivt-simple-single-doc -O -L
