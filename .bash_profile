# To the extent possible under law, the author(s) have dedicated all 
# copyright and related and neighboring rights to this software to the 
# public domain worldwide. This software is distributed without any warranty. 
# You should have received a copy of the CC0 Public Domain Dedication along 
# with this software. 
# If not, see <http://creativecommons.org/publicdomain/zero/1.0/>. 

# base-files version 4.2-4

# ~/.bash_profile: executed by bash(1) for login shells.

# The latest version as installed by the Cygwin Setup program can
# always be found at /etc/defaults/etc/skel/.bash_profile

# Modifying /etc/skel/.bash_profile directly will prevent
# setup from updating it.

# The copy in your home directory (~/.bash_profile) is yours, please
# feel free to customise it to create a shell
# environment to your liking.  If you feel a change
# would be benifitial to all, please feel free to send
# a patch to the cygwin mailing list.

# User dependent .bash_profile file

# source the users bashrc if it exists
if [ -f "${HOME}/.bashrc" ] ; then
  source "${HOME}/.bashrc"
fi

# Set PATH so it includes user's private bin if it exists
# if [ -d "${HOME}/bin" ] ; then
#   PATH="${HOME}/bin:${PATH}"
# fi

# Set MANPATH so it includes users' private man if it exists
# if [ -d "${HOME}/man" ]; then
#   MANPATH="${HOME}/man:${MANPATH}"
# fi

# Set INFOPATH so it includes users' private info if it exists
# if [ -d "${HOME}/info" ]; then
#   INFOPATH="${HOME}/info:${INFOPATH}"
# fi



HISTSIZE=10000
HISTFILESIZE=200000

#export PS1="\[$(tput setaf 0)\]\[$(tput bold)\][\u -> \W]\\$ \[$(tput sgr0)\]"
#export PS1="\[$(tput setaf 4)\]\[$(tput bold)\][\t \u@\\H \W \\$\[$(tput sgr0)\]"
#export PS1="\[$(tput setaf 4)\]\[$(tput bold)\][\t \u -> \W\\$ \[$(tput sgr0)\]"
export PS1="\[$(tput setaf 4)\]\[$(tput bold)\][\t abhasker@xerox -> \W\\$ \[$(tput sgr0)\]"
############################################################################################################`
# http_proxy settings for accessing internet in office network.
		#export http_proxy=http://httpproxy.test.com:8080/
		#export https_proxy=$http_proxy
##############################################################################################################

# Aliases for common commands:
alias space="sed 's/ /\\ /g\'"
alias enca='enca -L none'
alias l='ls -lrthFa'
alias ll='ls -rthFl -N --color=tty -T 0'
alias lll='ll -hR -d -1 $PWD/{*,.*} | grep -v "\/\."'
alias mysql='mysql -A -u root -p'
alias open='cygstart'
# Aliases for common directories:
alias work='cd /cygdrive/c/Abhasker/Work'
alias c='cd /cygdrive/c/'
alias download='cd /cygdrive/c/Users/50007746/Downloads/'
cd /cygdrive/c/Abhasker/Work
alias bug='cd /cygdrive/c/Abhasker/Work; perl ../Script\ Files/make_wr_sql_folder.pl'
alias s='echo /cygdrive/c/Abhasker/xls_Info.txt | xargs grep -in'
alias ws='echo /cygdrive/c/Abhasker/WorkFlow.txt | xargs grep -in'
alias workflow='function _workflow(){ number=$1; add=10; echo -e "\t\t\t\t\t\tWorkFlow.txt\n"; cat -n /cygdrive/c/Abhasker/WorkFlow.txt | head -$(expr $number + $add;) | tail -21;};_workflow'
alias xls='function _xls(){ number=$1; add=10; echo -e "\t\t\t\t\t\txls_Info.txt\n"; cat -n /cygdrive/c/Abhasker/xls_Info.txt | head -$(expr $number + $add;) | tail -21;};_xls'
alias ext="find . -type f | grep -v '\/\.'|perl -ne 'print $1 if m/\.([^.\/]+)$/' | sort -u"
alias desk='cd /cygdrive/c/Users/50007746/Desktop'
alias
# US Work Servers SSH aliases : ssh to multiple servers.
alias test='ssh -t abhasker@server1 ssh abhasker@server2.test.com'













