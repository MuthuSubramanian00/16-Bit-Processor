@echo off
set xv_path=D:\\Xilnx\\Vivado\\2014.4\\bin
call %xv_path%/xelab  -wto e792489ab8e649569c1f1c55032e266a -m64 --debug typical --relax -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip --snapshot ctrl_unit_test_behav xil_defaultlib.ctrl_unit_test xil_defaultlib.glbl -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
