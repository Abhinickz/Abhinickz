# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
#HISTSIZE=1000
HISTSIZE=-1
#HISTFILESIZE=2000
HISTFILESIZE=-1
# Record timestamps
HISTTIMEFORMAT='%F %T '
# Don’t store specific lines
HISTIGNORE='t:bg:fg:history'
# Store history immediately
PROMPT_COMMAND='history -a'

#BLUE: [00:56:08 abhinickz -> Abhinickz$
#export PS1="\[$(tput setaf 4)\]\[$(tput bold)\][\t \u -> \W\\$ \[$(tput sgr0)\]"

#BLUE: [12:31:33 abhinickz@abhinickz -> ~$
export PS1="\[$(tput setaf 4)\]\[$(tput bold)\][\t \u@\h -> \W\\$ \[$(tput sgr0)\]";
############################################################################################################`
# http_proxy settings for accessing internet in proxy network.
#export http_proxy=http://httpproxy.test.com:8080/
#export https_proxy=$http_proxy
##############################################################################################################
# Aliases for common commands:

#	Check encoding of file.
alias enca='enca -L none';

alias l='ls -lrthFa --color=tty -T 0';
alias ll='ls -lrthF -N --color=tty -T 0';
alias lll='ls -N --color=tty -T 0 -lrthF -hR -d -1 $PWD/{*,.*}';
alias sudo='sudo '; #Fixes sudo alias not found.
alias calc='function _calc(){ exp="$@"; echo $1 | bc -l ;};_calc';	# Replace bc -l to bc if need to work with integers only!

#	Using ripgrep now instead of this alias agrep.
alias agrep='function _agrep(){ grep -nrH $1 . ;};_agrep';
alias grep='grep --color=auto';

#export LC_ALL=C.UTF-8
#export LANG=C.UTF-8

# Prints the line given for file.
printLine (){
    sed -n -e "$1p" "$2"
}

alias dir='ls --color=tty -lrtd */';  #Show only dir
alias perm='stat -c "%A %a %n"';
alias calc='function _calc(){ exp="$@"; echo $1 | bc -l ;};_calc';
alias fullPath='readlink -f';


#	Stops CTRL+C ^C from tty: Ubuntu Specific Issue.
stty -echoctl;

#	This will open file with preferred application.
#	Hide output from terminal and will let you use the terminal after (Ubuntu)
alias open='function _open(){ xdg-open "$@">/dev/null 2>&1; };_open';

alias process='watch -n 1 "ps auxf"';
alias ipv4='wget -qO- ipv4.icanhazip.com';

alias did="vim +'normal Go' +'r!date' ~/did.txt";
alias gif='/home/abhinickz/.local/bin/gif-for-cli';

alias postgres='sudo -u postgres -i';
alias ipwifi="ip addr show wlp5s0 | grep inet | awk '{ print $2; }' | sed 's/\/.*$//'";
alias ram='free -m';
alias ack='rg';
alias alert_ok='alert "🆗" || alert "⚠ Not 🆗!"';
#	Bluetooth Device Stuff:
alias connect_bluetooth='bt-device -c XX:XX:XX:XX:XX:XX';
alias disconnect_bluetooth='bt-device -d XX:XX:XX:XX:XX:XX';

alias mysql='mysql -A -u root -p';
# for cygwin only.
# alias open='cygstart'
alias  # Remind me all the aliases at startup.
# US Work Servers SSH aliases : ssh to multiple servers.
alias test='ssh -t abhinickz@server1 ssh abhinickz@server2.test.com';

# Countdown function: count 5 && echo test
function count() {
	total=$1
	for ((i=total; i>0; i--)); do sleep 1; printf "Time remaining $i secs \r"; done
	echo -e "\a"
}

alias desktop="cd ~/Desktop/";
alias download="cd ~/Downloads/";
alias dev="cd ~/dev_work/";
alias work="cd ~/work/";
alias pers="cd ~/🔒/";
#	Ubuntu && PSQL version Specific
alias dblogs='tail -f /var/log/postgresql/postgresql-11-main.log';
#	Use deb package installation will show icon on Apps.
#alias alacritty='nohup alacritty > /dev/null &';

# Change Gnome-Terminal TAB Title:
function t() {
  if [[ -z "$ORIG" ]]; then
    ORIG=$PS1
  fi
  TITLE="\[\e]2;$*\a\]"
  PS1=${ORIG}${TITLE}
}

#	Start http-server on port 5000;
alias server='http-server -p 5000 -c-1';

# Sync test folder to remote Backup test.
alias sync='NOW=/home/abhinickz/test/rsync_$(date +"%F_%H_%M_%S").log; echo $NOW;sh /home/abhinickz/test/clear_logs.sh && rsync -razP --delete -e '"'"'ssh -p 22'"'"' --progress /home/abhinickz/test/. abhinickz@abhinickz_remote:/home/abhinickz/Backup_Local/test/. > $NOW';

#######################################################################################################################
################################################### Aliases for GIT: ##################################################
#######################################################################################################################
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
alias gd='git diff -U0'
alias gdc='git diff --cached -U0'
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

#######################################################################################################################
#######################################################################################################################