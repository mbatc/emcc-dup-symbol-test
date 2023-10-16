
emcc -c foo.c
emcc -c test.c

emar rcs libfoo.a foo.o

emcc libfoo.a libfoo.a test.o -o test.js                             # No errors
emcc libfoo.a libfoo.a test.o -o test_shared.so -shared              # No errors (just a .o file though)
emcc libfoo.a libfoo.a test.o -o test_side_module.so -sSIDE_MODULE # Fails with duplicate symbol error
emcc libfoo.a libfoo.a test.o -o test_main_module.wasm -sMAIN_MODULE # Fails with duplicate symbol error
