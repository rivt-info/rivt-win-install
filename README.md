# rivt-win-install

The Window 10 installation command file rivtuv.cmd, presumes that uv is already installed. If not it can be installed with

```
winget install --id=astral-sh.uv  -e
```
Further information can be found here.

https://docs.astral.sh/uv/getting-started/installation/#pypi


In this preliminary form the file deletes any existing uv installs,  installs or reinstalls 

Python
rivt package
example rivt file: rivt-rv000-single-doc.py

When the script exits, the command window is left open.  The rivt file
can be run with the command line

```
python rv000-single-doc

```
@echo on
REM Windows 10 and above - cmd file
REM (1) clear any existing project
REM (2) create new venv
REM (3) install rivt
REM (4) download example
REM set rivt folder
REM - Step 1 : change to the user home directory
REM - Step 1 : change to the user home directory

SET rvfolder=rivt-doc2
REM go to home directory
cd %HOMEPATH%
REM double check deactivation
uv deactivate
REM double check that old project is deleted
rmdir /s /q %rvfolder%
REM (1) clean cache 
uv cache clean
REM set up venv
mkdir %rvfolder%
REM change directory
cd %rvfolder%
REM (2) make venv
uv venv
REM activate venv
call .venv/scripts/activate
REM (3) install rivt from GitHub
uv pip install git+https://github.com/rivtlib-dev/rivtlib.git@main
REM (4) download example project into new folder
mkdir example2
cd example2
curl https://raw.githubusercontent.com/rivt-info/rivt-single-doc/refs/heads/main/rv0000-single-doc.py -O
curl https://raw.githubusercontent.com/rivt-info/rivt-single-doc/refs/heads/main/s-beam1-v.csv -O
curl https://raw.githubusercontent.com/rivt-info/rivt-single-doc/refs/heads/main/s-sectprop.py -O
curl https://github.com/rivt-info/rivt-single-doc/blob/main/s-beam.png?raw=true -O -L
REM run example (no quotes) "python rv000-single-doc.py"
cmd /k
```
