@echo on
REM install rivt from GitHub
uv pip install git+https://github.com/rivtlib-dev/rivtlib#subdirectory=src
REM copy test file to base directory
copy.venv\Lib\site-packages\rivtlib\scripts\rv0000-simple-doc.py
REM run test case
python rv0000-simple-doc.py
