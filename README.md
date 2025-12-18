# rivt-win-install

The Window 10 installation command file *rivtuv.cmd*, presumes that *uv* is already installed. If not it can be 
installed with the command:

```
winget install --id=astral-sh.uv  -e
```
Further uv information can be found here.

https://docs.astral.sh/uv/getting-started/installation/#pypi

The command file is in preliminary form and executes the following steps:

1. deletes any prexisting uv installs
1. installs or reinstalls Python
1. installs or reinstalls the rivt package
1. installs or reinstalls example rivt file: rivt-rv000-single-doc.py

When the script exits, the command window is left open.  The rivt file
can then be run with the command line

```
python rv000-single-doc
```

The current PUBLISH command writes a TXT doc. The file can be edited to publish a PDF or HTML file.

```
@echo on
REM Windows 10 and above - cmd file
REM Step 1 - clear any existing project
REM Step 2 - create new venv
REM Step 3 - install rivt from GitHub
REM Step 4 - download example from GitHUb into "example 2" folder
REM set rivt folder
REM - Step 1 : change to the user home directory and delete existing installs
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
REM - Step 2 : create virtual environment
uv venv
REM activate venv
call .venv/scripts/activate
REM - Step 3 :  install rivt from GitHub
uv pip install git+https://github.com/rivtlib-dev/rivtlib.git@main
REM Step 4 - download example from GitHUb
mkdir example2
cd example2
curl https://raw.githubusercontent.com/rivt-info/rivt-single-doc/refs/heads/main/rv000-single-doc.py -O
curl https://raw.githubusercontent.com/rivt-info/rivt-single-doc/refs/heads/main/s-beam1-v.csv -O
curl https://raw.githubusercontent.com/rivt-info/rivt-single-doc/refs/heads/main/s-sectprop.py -O
curl https://github.com/rivt-info/rivt-single-doc/blob/main/s-beam.png?raw=true -O -L
REM run example (no quotes) "python rv000-single-doc.py"
cmd /k
```

Additional information can be found here:

https://rivt.info/rvB01-install.html
