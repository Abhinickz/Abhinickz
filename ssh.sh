#!/usr/bin/bash

# export PS1="\[$(tput setaf 2)\]\[$(tput bold)\][\t \u@\\h \w \\$\[$(tput sgr0)\] " ;alias l='ls -lrthFa'; alias ll='ls -lrthF -N --color=tty -T 0'; alias lll='ls -N --color=tty -T 0 -lrthF -hR -d -1 $PWD/*';alias grep='grep --color=auto';
# Prompt this msg to user to export this to logged in Server.
export export_cmd=$(cat <<END
    export PS1="\[\$(tput setaf 2)\]\[\$(tput bold)\][\t \u@\\h \w \\\$\[\$(tput sgr0)\] "; alias l='ls -lrthFa'; alias ll='ls -lrthF -N --color=tty -T 0'; alias lll='ls -N --color=tty -T 0 -lrthF -hR -d -1 \$PWD/*';alias grep='grep --color=auto';
END
); 

# Copied back text to Windows Clipboard, So I can just paste it as soon as I login.
echo -e "\n================================================================================================\n$export_cmd\n================================================================================================\n"
echo $export_cmd > /dev/clipboard;

echo -e "Logging $1\n";

ssh $1

# Because Shell script was still running after the ssh command.
exit;


