@echo off
setlocal

::::    Setup directories   ::::

set MXNET_DISTRO=%~dp0.
set MXNET_DISTRO=%MXNET_DISTRO%\..
if "%MXNET_INSTALL_DIR%" == "" set MXNET_INSTALL_DIR=%MXNET_DISTRO%\build

echo %ECHO_PREFIX% Install libmxnet.dll
cd /D %MXNET_DISTRO%\python
python setup.py install
if errorlevel 1 goto :FAIL

set NEW_PATH=%NEW_PATH:\\=\%
echo %ECHO_PREFIX% Setup succeed!
echo %ECHO_PREFIX% Add the following path to your system path or Run env.cmd per cmd window
echo %NEW_PATH%
echo @SET PATH=%%PATH%%;%NEW_PATH%>%MXNET_DISTRO%\env.cmd
goto :END

:END

