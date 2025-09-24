@echo on
REM install rivt from GitHub
uv pip install git+https://github.com/rivtlib-dev/rivtlib#subdirectory=src
REM download example project
mkdir example1
cd example1
curl https://github.com/rivt-info/rivt-simple-single-doc/archive/main.zip -O -L
  REM run test case
python rv0000-simple-doc.py
