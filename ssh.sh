#!/usr/bin/bash

# Prompt this msg to user to export this to logged in Server.
cat << EOF 
    export PS1="\[\$(tput setaf 2)\]\[\$(tput bold)\][\t \u@\\h \w \\\$\[\$(tput sgr0)\] " ;alias l='ls -lrthFa'; alias ll='ls -lrthF -N --color=tty -T 0'; alias lll='ls -N --color=tty -T 0 -lrthF -hR -d -1 $PWD/*';alias grep='grep --color=auto';
    
Logging $1

EOF
ssh $1