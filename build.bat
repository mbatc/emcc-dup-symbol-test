@echo off

call emcc -c foo.c
call emcc -c test.c
call emar rcs libfoo.a foo.o

REM No errors
call emcc libfoo.a libfoo.a test.o -o test.js

REM No errors (just a .o file though)
call emcc libfoo.a libfoo.a test.o -o test_shared.so -shared

REM Fails with duplicate symbol error
call emcc libfoo.a libfoo.a test.o -o test_side_module.so -sSIDE_MODULE

REM Fails with duplicate symbol error
call emcc libfoo.a libfoo.a test.o -o test_main_module.js -sMAIN_MODULE
