#!/bin/bash
code=$(g++ /cygdrive/d/Abhasker/Per/clion_C_plus_plus/main.cpp -o main.exe 2>&1);
if [ -z "${code// }" ]
then
	./main.exe
else
	echo -e "++++++++++++++++++++ Error: ++++++++++++++++++++\n$code"
fi
