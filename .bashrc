USERDIR=/home/`whoami` # abhasker

if [ "$(uname)" == "Darwin" ]
then
    USERDIR=/Users/`whoami`;
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]
then
    USERDIR=/home/`whoami`;
elif [ -n "$COMSPEC" -a -x "$COMSPEC" ]
then 
  echo $0: this script does not support this env \:\(
fi

# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

###################################
############ Commented ############
# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
# HISTCONTROL=ignoreboth

# # append to the history file, don't overwrite it
# shopt -s histappend

# # for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
# HISTSIZE=1000
# HISTFILESIZE=2000

# # check the window size after each command and, if necessary,
# # update the values of LINES and COLUMNS.
# shopt -s checkwinsize

############ Commented ############
###################################

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
# alias ll='ls -alF'
# alias la='ls -A'
# alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi


#########################################################################################################################################
################################# Custom Changes start here #############################################################################
#########################################################################################################################################

. "$HOME/.cargo/env"

export PATH=$PATH:/usr/local/go/bin

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
#HISTSIZE=1000
HISTSIZE=-1
#HISTFILESIZE=2000
HISTFILESIZE=-1

# A value of ‘erasedups’ causes all previous lines matching the current line to be removed from the history list before that line is saved.
HISTCONTROL=ignoreboth:erasedups;
# HISTCONTROL=ignoreboth;

## reedit a history substitution line if it failed
shopt -s histreedit

## edit a recalled history line before executing
shopt -s histverify

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# append to the history file, don't overwrite it
shopt -s histappend;

# Don’t store specific lines
#HISTIGNORE='t:bg:fg:mdm';
# Store history immediately
# PROMPT_COMMAND='history -a';

# trying new
_bash_history_sync() {
    builtin history -a         #1
    HISTFILESIZE=$HISTSIZE     #2

    # without -c and -r
    # It means commands you run are available instantly in new shells even before exiting the current shell
    # But not in concurrently running shells.
    # This way Arrow-Up still always selects the last-run commands of the current session
    # builtin history -c         #3
    # builtin history -r         #4
}

history() {                  #5
    _bash_history_sync
    builtin history "$@"
}

PROMPT_COMMAND=_bash_history_sync

# Blue
# export PS1="\[$(tput setaf 4)\]\[$(tput bold)\][\t \u@\h -> \W\\$ \[$(tput sgr0)\]";
# Yellow
#export PS1="\[$(tput setaf 3)\]\[$(tput bold)\][\t ab> \W\\$ \[$(tput sgr0)\]";
# Blue:
# export PS1="\[$(tput setaf 4)\]\[$(tput bold)\][\t ab> \W\\$ \[$(tput sgr0)\]";

# Mixed:
# export PS1="\[$(tput setaf 4)\]\[$(tput bold)\][\t ab>\[$(tput sgr0)\]\[$(tput setaf 2)\] \W]\\$ \[$(tput sgr0)\]"
# Reversed Color:
# export PS1="\[$(tput setaf 4)\]\[$(tput bold)\]\[$(tput rev)\][\t ab>\[$(tput sgr0)\]\[$(tput setaf 2)\]\[$(tput rev)\] \W]\\$\[$(tput sgr0)\] "
# Added Reversed Time Text:
# export PS1="\[$(tput setaf 4)\]\[$(tput bold)\]\[$(tput rev)\][\t❯\[$(tput sgr0)\]\[$(tput setaf 2)\]\[$(tput rev)\]\W]❯❯\[$(tput sgr0)\] "
# Added Blinked Time Text:
# export PS1="\[$(tput setaf 4)\]\[$(tput bold)\]\[$(tput rev)\][\t\[$(tput blink)\]❯\[$(tput sgr0)\]\[$(tput setaf 2)\]\[$(tput rev)\]\W]❯❯\[$(tput sgr0)\] "
# latest with , ❯, ➜
export PS1="\[$(tput setaf 4)\]\[$(tput bold)\]\[$(tput rev)\][\t\[$(tput blink)\]❯\[$(tput sgr0)\]\[$(tput bold)\]\[$(tput setaf 2)\]\[$(tput rev)\]\W]\[$(tput sgr0)\]\[$(tput setaf 2)\]\[$(tput sgr0)\] "

###################################################
# https://github.com/justjanne/powerline-go
# function _update_ps1() {
#     PS1="$($GOPATH/bin/powerline-go -error $?)"
# }

# if [ "$TERM" != "linux" ] && [ -f "$GOPATH/bin/powerline-go" ]; then
#     PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
# fi
###################################################

#~/.psqlrc
# \set PROMPT1 '%[%033[1;31m%][%`date +%H:%M:%S`][%/] %x%# %033[0m%]\n'
# [14:58:48][test_db] RED
# \set PROMPT1 '%[%033[7;32m%] -------- [%`date +%H:%M:%S`]%033[0m%]%[%033[7;32m%][%/] -------- %033[0m%]\n'
# [14:58:48][test_db] YELLOW with Inverted
# \set PROMPT1 '%[%033[7;31m%] -------- [%`date +%H:%M:%S`]%033[0m%]%[%033[7;31m%][%/] -------- %033[0m%]\n'
# [14:58:48][test_db] RED with Inverted

alias enca='enca -L none';


if [ "$(uname)" == "Darwin" ]
then
    alias l='ls -lrthFa --color=tty';
    alias ll='ls -lrthF --color=tty';
    alias lll='ls --color=tty -lrthF -hR -d -1 $PWD/{*,.*}';
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]
then
    alias l='ls -lrthFa --color=tty -T 0';
    alias ll='ls -lrthF -N --color=tty -T 0';
    alias lll='ls -N --color=tty -T 0 -lrthF -hR -d -1 $PWD/{*,.*}';
elif [ -n "$COMSPEC" -a -x "$COMSPEC" ]
then 
  echo $0: this script does not support this env \:\(
fi

# alias ram_free="sudo sh -c 'free -m && sync && echo 3 > /proc/sys/vm/drop_caches && free -m'"; # emptying the buffers cache

#wsl:
alias ram_free="sudo sh -c 'free -m && sync && echo 1 > /proc/sys/vm/drop_caches && free -m'"; # emptying the buffers cache
alias sudo='sudo ';
alias calc='function _calc(){ exp="$@"; echo $1 | bc -l ;};_calc';	# Replace bc -l to bc if need to work with integers only!
alias agrep='function _agrep(){ grep -nrH $1 . ;};_agrep';
alias grep='grep --color=auto';

# Create File with recursive dir creation:
function mktouch() {
    if [ $# -lt 1 ]; then
        echo "Missing argument";
        return 1;
    fi

    for f in "$@"; do
        mkdir -p -- "$(dirname -- "$f")" && touch -- "$f"
    done
}

# Copy to clipboard by default:
alias xclip='xclip -selection clipboard';

# rg with sk fuzzy search finder:
alias rgs="sk --ansi -i -c 'rg --color=always --line-number \"{}\"'";

# preview which combines fzf with bat for the preview and a custom key binding to open VS Code
alias pre="fzf --preview 'bat --color \"always\" {}'"
export FZF_DEFAULT_OPTS="--bind='ctrl-o:execute(code {})+abort'"

alias ping='prettyping --nolegend';

printLine (){
    sed -n -e "$1p" "$2"
}

alias dir='ls --color=tty -lrtd */';
alias perm='stat -c "%A %a %n"';
#alias open='nautilus';
alias full_path='readlink -f ';
# fd & get full path:
alias fdf='function _fdf(){ fd $1 | xargs readlink -f ;};_fdf';
alias ports='sudo netstat -plntu';

#	Stops CTRL+C ^C from tty
stty -echoctl;

#	This will open file with preferred application.
#	Hide output from terminal and will let you use the terminal after.
alias open='function _open(){ xdg-open "$@">/dev/null 2>&1; };_open';

alias process='watch -n 1 ps auxf';
alias ipv4='wget -qO- ipv4.icanhazip.com';

alias did="vim +'normal Go' +'r!date' ~/did.txt";
alias gif='${USERDIR}/.local/bin/gif-for-cli';

alias postgres='sudo -u postgres -i';

#wsl:
alias ipadd="ip r | sed -n '2 p' | awk ' { print \$NF } ' ";

#############################################################################################################################################################################
function fw() {
	if [ -z "$1" ]
	then
		echo "Pass 0 to remove iptables rules: firewall 0";
		echo "Pass 1 to apply iptables rules: firewall 1";
		echo 'current iptables rules: ';
		sudo iptables -nvL
	else
		sudo bash ${USERDIR}/dev_work/iptables_rules_apply.bash $1
	fi
}
#############################################################################################################################################################################

function count() {
	total=$1
	for ((i=total; i>0; i--)); do sleep 1; printf "Time remaining $i secs \r"; done
	echo -e "\a"
}

# Stopwatch
alias timer='echo "Timer started. Stop with Ctrl-D." && date && time cat && date'

alias systail='tail -f /var/log/syslog'
# alias top='top -o cpu'

cheat() {
	curl "http://cheat.sh/$1"
}

alias desktop="cd ~/desktop/";
alias download="cd ~/downloads/";
alias dev="cd ~/dev_work/";
alias work="cd ~/work/";
alias calc='function _calc(){ exp="$@"; echo $1 | bc -l ;};_calc';	# Replace bc -l to bc if need to work with integers only!
# alias 0='paplay ${USERDIR}/.config-bak/.config/google-chrome-beta/Default/Extensions/oeopbcgkkoapgobdbedcemjljbihmemj/22.1_0/sounds/ultranova.ogg';alias error=0;
# alias 1='paplay /usr/share/sounds/Kopete_User_is_Online.ogg';alias ok=1;
# alias ok='paplay ${USERDIR}/.config-bak/.config/google-chrome-beta/Default/Extensions/oeopbcgkkoapgobdbedcemjljbihmemj/22.1_0/sounds/bell.ogg';
#########################################################################################################################################
export PGPASSWORD='XXXXX';
export PERL5LIB=${USERDIR}/projects/:${PERL5LIB};
#########################################################################################################################################
alias psqldb='psql test;';
alias project='cd ${USERDIR}/projects/';
export PAT='XXXXX'; # github dev token for docker test build
#########################################################################################################################################
# Sync Work Stuff:
# alias sync_work='NOW=${USERDIR}/backup_local/rsync_$(date +"%F_%H_%M_%S")_work.log; echo $NOW; rsync -razP --delete -e '"'"'ssh'"'"' --progress ${USERDIR}/work/. abhishek@test:/home/abhishek/backup_local/work/. | tee $NOW';
#########################################################################################################################################
# alias compile_handlbars='function _compile_handlbars { exp="$@"; dir=$(dirname $exp); cd $dir; handlebars -am *.handlebars > template.build.js; cd -; };_compile_handlbars';
#########################################################################################################################################
# check_tickets_date_range '2018-12-31 00:00' '2020-05-25 00:00'
function check_tickets_date_range () {
    echo -e \
	`cd ${USERDIR}/projects/ && git log upstream/master --after="$1" --before="$2" --merges | rg 'Abhinickz' | perl -ne 'print $1."\n" if ( $_ =~ m/.*(P3-\d{4}).*/g);' | uniq | sort` \
	| tr " " "\n" \
	| sort \
	| uniq

	# git log upstream/master --author=Abhinickz --after="2020-05-06 00:00" --before="2020-05-15 18:46" | rg P3 | awk 'BEGIN{FS=" "} {print $1}' | sed 's/://g' | sort | uniq

}
#########################################################################################################################################
#########################################################################################################################################
###################################################### WSL2/Gnome/Konsole Terminal ######################################################
function t() {
	if [[ -z "$ORIG" ]]; then
		ORIG=$PS1
	fi
	TITLE="\[\e]2;$*\a\]"
	PS1=${ORIG}${TITLE}
}
#########################################################################################################################################
# Docker Stuff:

# WSL2: running different build stages concurrently
export DOCKER_BUILDKIT=1
# Alias for docker:
alias doc_up='function _doc_up(){ in="$@"; docker start "$1"; };_doc_up';
alias doc_down='function _doc_down(){ in="$@"; docker stop "$1"; };_doc_down';
alias doc_restart='function _doc_restart(){ in="$@"; docker restart "$1"; };_doc_restart';
alias doc_bash='function _doc_bash(){ in="$@"; docker exec -it -u root "$1" /bin/bash $2; };_doc_bash';
alias doc_log='function _doc_log(){ in="$@"; docker exec -it -u root "$1" tail -f /logs/postgresql.log; };_doc_log';

# Gracefully shoutdown docker postgres instance:
alias stopdb='function _stopdb(){ in="$@"; docker exec -it -u root "$1" "kill -s TERM 10"; };_stopdb';
# ---------------------------------------------------------------------------------------------------------------------------------------
alias psql='psql -q -h 0.0.0.0 -U abhasker -d ';
alias pgcl='pgcli -h 0.0.0.0 -U abhasker -d ';
alias psql3='psql -q -h localhost -p 5433 -U abhasker -d ';
#########################################################################################################################################
export RUSTC_WRAPPER=sccache; # will use cache (sccache) for compilation
alias run='RUSTFLAGS=-Awarnings cargo run -q';
export RUST_SRC_PATH='${USERDIR}/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src/';
export CARGO_PKG_AUTHORS='Abhishek Bhasker <abhinickz6@gmail.com>';
export GOPATH='${USERDIR}/dev_work/softwares/go_path';

# go bin:
export PATH=$PATH:'/usr/local/go/bin';
export PATH=$PATH:'~/.go/bin';

# python bin:
export PATH=$PATH:'${USERDIR}/.local/bin';

alias cls='clear';alias cl='clear';
# Start node http-server on port 5000;
alias server='http-server -p 5000 -c-1';

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="${USERDIR}/.sdkman"
[[ -s "${USERDIR}/.sdkman/bin/sdkman-init.sh" ]] && source "${USERDIR}/.sdkman/bin/sdkman-init.sh"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

export PATH="$HOME/.cargo/bin:$PATH"

# --------------------------------------------
# working on WSL2:
# Ensure agent is running
ssh-add -l &>/dev/null
if [ "$?" == 2 ]; then
    # Could not open a connection to your authentication agent.

    # Load stored agent connection info.
    test -r ~/.ssh-agent && \
        eval "$(<~/.ssh-agent)" >/dev/null

    ssh-add -l &>/dev/null
    if [ "$?" == 2 ]; then
        # Start agent and store agent connection info.
        (umask 066; ssh-agent > ~/.ssh-agent)
        eval "$(<~/.ssh-agent)" >/dev/null
    fi
fi

# Load identities
ssh-add -l &>/dev/null
if [ "$?" == 1 ]; then
    # The agent has no identities.
    # Time to add one.
    ssh-add -t 4h
fi

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2 | tr ' ' '\n')" scp sftp ssh
# ---------------------------------------------

#########################################################################################################################################
export LANGUAGE=en_IN.UTF-8
export LANG=en_IN.UTF-8
export LC_ALL=en_IN.UTF-8
export TZ_LIST="Asia/Kolkata,home;America/Chicago,work";
alias and_copy='kdeconnect-cli -d $(kdeconnect-cli -a --id-only) --share-text';

# All ripped file in this directory:
alias rip='rip --graveyard ~/.deleted/';
#########################################################################################################################################
# To print a line:
alias line="perl -e 'use Term::ANSIColor; my \$width = qx{tput cols}; print color(q{red}), q{x} x \$width . qq{\n}, color(q{reset});'";
#########################################################################################################################################
eval "$(zoxide init bash)"
#########################################################################################################################################
complete -C /usr/local/bin/bitcomplete bit

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
#########################################################################################################################################
source ${USERDIR}/.config/broot/launcher/bash/br
#########################################################################################################################################
#########################################################################################################################################
################################################### Aliases for GIT: ####################################################################
#########################################################################################################################################
alias gdiff='git diff'
alias gcl='git clone'
alias ga='git add'
alias grm='git rm'
alias gap='git add -p'
alias gall='git add -A'
alias gf='git fetch --all --prune'
alias gft='git fetch --all --prune --tags'
alias gfv='git fetch --all --prune --verbose'
alias gftv='git fetch --all --prune --tags --verbose'
alias gus='git reset HEAD'
alias gpristine='git reset --hard && git clean -dfx'
alias gclean='git clean -fd'
alias gm="git merge"
alias gmv='git mv'
alias g='git'
alias get='git'
alias gst='git status'
alias gs='git status -uno'
alias gss='git status -s'
alias gsu='git submodule update --init --recursive'
alias gl='git pull'
alias glum='git pull upstream master'
alias gpr='git pull --rebase'
alias gpp='git pull && git push'
alias gup='git fetch && git rebase'
alias gp='git push'
alias gpo='git push origin'
alias gpu='git push --set-upstream'
alias gpuo='git push --set-upstream origin'
alias gpom='git push origin master'
alias gr='git remote'
alias grv='git remote -v'
alias gra='git remote add'
alias gd='git diff'
alias gdf='git diff -U0'
alias gdc='git diff --cached'
alias gdfc='git diff --cached -U0'
alias gdv='git diff -w "$@" | vim -R -'
alias gc='git commit -v'
alias gca='git commit -v -a'
alias gcm='git commit -v -m'
alias gcam="git commit -v -am"
alias gci='git commit --interactive'
alias gb='git branch'
alias gba='git branch -a'
alias gbt='git branch --track'
alias gbm='git branch -m'
alias gbd='git branch -d'
alias gbD='git branch -D'
alias gcount='git shortlog -sn'
alias gcp='git cherry-pick'
alias gco='git checkout'
alias gcom='git checkout master'
alias gcb='git checkout -b'
alias gcob='git checkout -b'
alias gct='git checkout --track'
alias gexport='git archive --format zip --output'
alias gdel='git branch -D'
alias gmu='git fetch origin -v; git fetch upstream -v; git merge upstream/master'
alias gll='git log --graph --pretty=oneline --abbrev-commit'
alias gg="git log --graph --pretty=format:'%C(bold)%h%Creset%C(magenta)%d%Creset %s %C(yellow)<%an> %C(cyan)(%cr)%Creset' --abbrev-commit --date=relative"
alias ggs="gg --stat"
alias gsl="git shortlog -sn"
alias gwc="git whatchanged"
alias gt="git tag"
alias gta="git tag -a"
alias gtd="git tag -d"
alias gtl="git tag -l"
# From http://blogs.atlassian.com/2014/10/advanced-git-aliases/
# Show commits since last pull
alias gnew="git log HEAD@{1}..HEAD@{0}"
# Add uncommitted and unstaged changes to the last commit
alias gcaa="git commit -a --amend -C HEAD"
alias ggui="git gui"
alias gcsam="git commit -S -am"
alias gstd="git stash drop"
alias gstl="git stash list"
alias gh='cd "$(git rev-parse --show-toplevel)"'
# Show untracked files
alias gu='git ls-files . --exclude-standard --others'

case $OSTYPE in
  darwin*)
    alias gtls="git tag -l | gsort -V"
    ;;
  *)
    alias gtls='git tag -l | sort -V'
    ;;
esac

#########################################################################################################################################
#########################################################################################################################################
#########################################################################################################################################
#########################################################################################################################################
#########################################################################################################################################

