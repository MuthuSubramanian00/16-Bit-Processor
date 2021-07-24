@echo off
set xv_path=D:\\Xilnx\\Vivado\\2014.4\\bin
call %xv_path%/xsim ctrl_unit_test_behav -key {Behavioral:sim_1:Functional:ctrl_unit_test} -tclbatch ctrl_unit_test.tcl -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
