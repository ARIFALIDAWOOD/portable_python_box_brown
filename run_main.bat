@echo off
set CURRENT_PATH=%~dp0
set activate_bat=%CURRENT_PATH%.Env\Scripts\activate.bat
@REM current path
@REM python path "WPy64-3771\scripts\python"
set PYTHON_PATH=%CURRENT_PATH%WPy64-3771\python-3.7.7.amd64\python.exe
set PIP_PATH=%CURRENT_PATH%WPy64-3771\python-3.7.7.amd64\Scripts\pip3.7.exe

@REM call "%activate_bat%"
if not exist "%activate_bat%" (
    @echo on
    echo "Creating Virtual Environment"
    @REM run python -m venv Env
    "%PYTHON_PATH%" -m venv .Env
    @REM activate the virtual environment
    call "%activate_bat%"
    @REM run pip install -r req.txt
    "%PYTHON_PATH%" -m pip install -r "%CURRENT_PATH%config\req.txt"
) else (
    call "%activate_bat%"
)

call "%PYTHON_PATH%" "%CURRENT_PATH%main.py"
