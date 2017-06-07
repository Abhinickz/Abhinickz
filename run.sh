#!/bin/bash

code=$(g++ /home/Abhishek.Bhasker/c_plus_plus/stackTest.cpp -o /home/Abhishek.Bhasker/c_plus_plus/program_c_plus_plus.exe 2>&1);
if [ -z "${code// }" ]
then
    tput setaf 2; echo -e "========================= OUTPUT ========================="; tput sgr0;    
    /home/Abhishek.Bhasker/c_plus_plus/program_c_plus_plus.exe
    tput setaf 2; echo -e "=========================================================="; tput sgr0;
else
    tput setaf 1; echo -e "========================= ERROR =========================\n"; tput sgr0;
    # Because I wasn't getting colored error ouput and created the another alias to find errors :)
    `g++ /home/Abhishek.Bhasker/c_plus_plus/stackTest.cpp -o /home/Abhishek.Bhasker/c_plus_plus/program_c_plus_plus.exe`
    tput setaf 1; echo -e "========================================================\n"; tput sgr0;
fi




# Line Commented for another configuration.

<<comment
code=$(g++ /cygdrive/d/Abhasker/Per/clion_C_plus_plus/main.cpp -o main.exe 2>&1);
if [ -z "${code// }" ]
then
    ./main.exe
else
    echo -e "++++++++++++++++++++ Error: ++++++++++++++++++++\n$code"
fi

comment