# rivtuv-install

The following installation scripts presume that *uv* is already installed. 
See https://docs.astral.sh/uv/getting-started/installation/#pypi . If not, it can be 
installed with the commands:

**Windows**:
```
winget install --id=astral-sh.uv  -e
```

**macOS**
```
curl -LsSf https://astral.sh/uv/install.sh | sh
```

The following rivt install files are preliminary and executes the following steps: (later versions will not reinstall everything)

1. deletes any prexisting uv installs
1. installs or reinstalls Python
1. installs or reinstalls the rivt package
1. installs or reinstalls an example rivt file: rivt-rv000-single-doc.py

When the script exits, the command window is left open.  The rivt file
can then be run with the command line

```
python rv000-single-doc
```

The current PUBLISH command in the example file writes a TXT doc. The file can be edited to publish a PDF or HTML file.
Additional information can be found at https://rivt.info/rvB01-install.html

**rivtuv.cmd**
---------------

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


**rivtuv.sh**
-----------------

```
#!/usr/bin/env bash
set -euo pipefail
# Echo commands for visibility
set -x

# macOS / POSIX translation of rivtuv.cmd
# 1) clear any existing project and venv
# 2) create new venv
# 3) install rivt from GitHub
# 4) download example files from GitHub

rvfolder="rivt-doc2"

# go to home directory
cd "$HOME"

# try to deactivate any existing uv venv (if uv is installed)
if command -v uv >/dev/null 2>&1; then
  uv deactivate || true
fi

# remove old project folder
rm -rf "$rvfolder"

# clean uv cache if available
if command -v uv >/dev/null 2>&1; then
  uv cache clean || true
fi

# set up project folder
mkdir -p "$rvfolder"
cd "$rvfolder"

# create venv (prefer uv helper if present)
if command -v uv >/dev/null 2>&1; then
  uv venv
else
  python3 -m venv .venv
fi

# activate venv
if [ -f ".venv/bin/activate" ]; then
  # shellcheck disable=SC1090
  source .venv/bin/activate
fi

# install rivt from GitHub (use uv pip if available)
if command -v uv >/dev/null 2>&1; then
  uv pip install --upgrade git+https://github.com/rivtlib-dev/rivtlib.git@main
else
  pip install --upgrade git+https://github.com/rivtlib-dev/rivtlib.git@main
fi

# download example project into new folder
mkdir -p example2
cd example2

# Use -L to follow redirects and download raw files
curl -L https://raw.githubusercontent.com/rivt-info/rivt-single-doc/main/rv000-single-doc.py -O
curl -L https://raw.githubusercontent.com/rivt-info/rivt-single-doc/main/s-beam1-v.csv -O
curl -L https://raw.githubusercontent.com/rivt-info/rivt-single-doc/main/s-sectprop.py -O
curl -L https://raw.githubusercontent.com/rivt-info/rivt-single-doc/main/s-beam.png -O

echo
echo "Setup complete. To run the example (inside the activated venv):"
echo "  python rv000-single-doc.py"
echo
echo "If you want an interactive shell after this script finishes, run:"
echo "  exec \$SHELL"
echo
```
