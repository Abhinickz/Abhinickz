# ------------------------------------------------------------------------------
# ~/.oh-my-zsh/themes/custom_theme.zsh-theme
# based on https://github.com/caiogondim/bullet-train.zsh/blob/master/bullet-train.zsh-theme 
# ------------------------------------------------------------------------------
# ------------------------------------------------------------------------------
# CONFIGURATION
# The default configuration, that can be overwrite in your .zshrc file
# ------------------------------------------------------------------------------

VIRTUAL_ENV_DISABLE_PROMPT=true

# Define order and content of prompt
if [ ! -n "${CUSTOM_PROMPT_ORDER+1}" ]; then
  CUSTOM_PROMPT_ORDER=(
    time
    status
    custom
    dir
  )
fi

# PROMPT
if [ ! -n "${CUSTOM_PROMPT_CHAR+1}" ]; then
  CUSTOM_PROMPT_CHAR="\$"
fi
if [ ! -n "${CUSTOM_PROMPT_ROOT+1}" ]; then
  CUSTOM_PROMPT_ROOT=true
fi
if [ ! -n "${CUSTOM_PROMPT_SEPARATE_LINE+1}" ]; then
  CUSTOM_PROMPT_SEPARATE_LINE=false
fi
if [ ! -n "${CUSTOM_PROMPT_ADD_NEWLINE+1}" ]; then
  CUSTOM_PROMPT_ADD_NEWLINE=false
fi

# STATUS
if [ ! -n "${CUSTOM_STATUS_EXIT_SHOW+1}" ]; then
  CUSTOM_STATUS_EXIT_SHOW=false
fi
if [ ! -n "${CUSTOM_STATUS_BG+1}" ]; then
  CUSTOM_STATUS_BG=green
fi
if [ ! -n "${CUSTOM_STATUS_ERROR_BG+1}" ]; then
  CUSTOM_STATUS_ERROR_BG=red
fi
if [ ! -n "${CUSTOM_STATUS_FG+1}" ]; then
  CUSTOM_STATUS_FG=white
fi

# TIME
if [ ! -n "${CUSTOM_TIME_BG+1}" ]; then
  CUSTOM_TIME_BG=white
fi
if [ ! -n "${CUSTOM_TIME_FG+1}" ]; then
  CUSTOM_TIME_FG=black
fi

# CUSTOM
if [ ! -n "${CUSTOM_CUSTOM_MSG+1}" ]; then
  CUSTOM_CUSTOM_MSG=false
fi
if [ ! -n "${CUSTOM_CUSTOM_BG+1}" ]; then
  CUSTOM_CUSTOM_BG=black
fi
if [ ! -n "${CUSTOM_CUSTOM_FG+1}" ]; then
  CUSTOM_CUSTOM_FG=default
fi

# DIR
if [ ! -n "${CUSTOM_DIR_BG+1}" ]; then
  CUSTOM_DIR_BG=blue
fi
if [ ! -n "${CUSTOM_DIR_FG+1}" ]; then
  CUSTOM_DIR_FG=white
fi
if [ ! -n "${CUSTOM_DIR_CONTEXT_SHOW+1}" ]; then
  CUSTOM_DIR_CONTEXT_SHOW=false
fi
if [ ! -n "${CUSTOM_DIR_EXTENDED+1}" ]; then
  CUSTOM_DIR_EXTENDED=1
fi

# ------------------------------------------------------------------------------
# SEGMENT DRAWING
# A few functions to make it easy and re-usable to draw segmented prompts
# ------------------------------------------------------------------------------

CURRENT_BG='NONE'
SEGMENT_SEPARATOR=''

# Begin a segment
# Takes three arguments, background, foreground and text. All of them can be omitted,
# rendering default background/foreground and no text.
prompt_segment() {
  local bg fg
  [[ -n $1 ]] && bg="%K{$1}" || bg="%k"
  [[ -n $2 ]] && fg="%F{$2}" || fg="%f"
  if [[ $CURRENT_BG != 'NONE' && $1 != $CURRENT_BG ]]; then
    echo -n " %{$bg%F{$CURRENT_BG}%}$SEGMENT_SEPARATOR%{$fg%} "
  else
    echo -n "%{$bg%}%{$fg%} "
  fi
  CURRENT_BG=$1
  [[ -n $3 ]] && echo -n $3
}

# End the prompt, closing any open segments
prompt_end() {
  if [[ -n $CURRENT_BG ]]; then
    echo -n " %{%k%F{$CURRENT_BG}%}$SEGMENT_SEPARATOR"
  else
    echo -n "%{%k%}"
  fi
  echo -n "%{%f%}"
  CURRENT_BG=''
}

# ------------------------------------------------------------------------------
# PROMPT COMPONENTS
# Each component will draw itself, and hide itself if no information needs
# to be shown
# ------------------------------------------------------------------------------

# Context: user@hostname (who am I and where am I)
context() {
  local user="$(whoami)"
  [[ "$user" != "$CUSTOM_CONTEXT_DEFAULT_USER" || -n "$CUSTOM_IS_SSH_CLIENT" ]] && echo -n "${user}@$CUSTOM_CONTEXT_HOSTNAME"
}

prompt_context() {
  local _context="$(context)"
  [[ -n "$_context" ]] && prompt_segment $CUSTOM_CONTEXT_BG $CUSTOM_CONTEXT_FG "$_context"
}

# Based on http://stackoverflow.com/a/32164707/3859566
function displaytime {
  local T=$1
  local D=$((T/60/60/24))
  local H=$((T/60/60%24))
  local M=$((T/60%60))
  local S=$((T%60))
  [[ $D > 0 ]] && printf '%dd' $D
  [[ $H > 0 ]] && printf '%dh' $H
  [[ $M > 0 ]] && printf '%dm' $M
  printf '%ds' $S
}

# Prompt previous command execution time
preexec() {
  cmd_timestamp=`date +%s`
}

precmd() {
  local stop=`date +%s`
  local start=${cmd_timestamp:-$stop}
  let CUSTOM_last_exec_duration=$stop-$start
  cmd_timestamp=''
}

prompt_cmd_exec_time() {
  [ $CUSTOM_last_exec_duration -gt $CUSTOM_EXEC_TIME_ELAPSED ] && prompt_segment $CUSTOM_EXEC_TIME_BG $CUSTOM_EXEC_TIME_FG "$(displaytime $CUSTOM_last_exec_duration)"
}

# Custom
prompt_custom() {
  if [[ $CUSTOM_CUSTOM_MSG == false ]]; then
    return
  fi

  local custom_msg
  eval custom_msg=$CUSTOM_CUSTOM_MSG
  [[ -n "${custom_msg}" ]] && prompt_segment $CUSTOM_CUSTOM_BG $CUSTOM_CUSTOM_FG "${custom_msg}"
}

# Dir: current working directory
prompt_dir() {
  local dir=''
  local _context="$(context)"
  local CUSTOM_DIR_EXTENDED=0 # Show only current working directory
  [[ $CUSTOM_DIR_CONTEXT_SHOW == true && -n "$_context" ]] && dir="${dir}${_context}:"

  if [[ $CUSTOM_DIR_EXTENDED == 0 ]]; then
    #short directories
    dir="${dir}%1~"
  elif [[ $CUSTOM_DIR_EXTENDED == 2 ]]; then
    #long directories
    dir="${dir}%0~"
  else
    #medium directories (default case)
    dir="${dir}%4(c:...:)%3c"
  fi

  prompt_segment $CUSTOM_DIR_BG $CUSTOM_DIR_FG $dir
}

prompt_time() {
  if [[ $CUSTOM_TIME_12HR == true ]]; then
    prompt_segment $CUSTOM_TIME_BG $CUSTOM_TIME_FG %D{%r}
  else
    prompt_segment $CUSTOM_TIME_BG $CUSTOM_TIME_FG %D{%T}
  fi
}

# Status:
# - was there an error
# - am I root
# - are there background jobs?
prompt_status() {
  local symbols
  symbols=()
  [[ $RETVAL -ne 0 && $CUSTOM_STATUS_EXIT_SHOW != true ]] && symbols+="✘"
  [[ $RETVAL -ne 0 && $CUSTOM_STATUS_EXIT_SHOW == true ]] && symbols+="✘ $RETVAL"
  [[ $UID -eq 0 ]] && symbols+="%{%F{yellow}%}⚡%f"
  [[ $(jobs -l | wc -l) -gt 0 ]] && symbols+="⚙"

  if [[ -n "$symbols" && $RETVAL -ne 0 ]]; then
    prompt_segment $CUSTOM_STATUS_ERROR_BG $CUSTOM_STATUS_FG "$symbols"
  elif [[ -n "$symbols" ]]; then
    prompt_segment $CUSTOM_STATUS_BG $CUSTOM_STATUS_FG "$symbols"
  fi

}

# Prompt Character
prompt_chars() {
  local bt_prompt_chars="${CUSTOM_PROMPT_CHAR}"

  if [[ $CUSTOM_PROMPT_ROOT == true ]]; then
    bt_prompt_chars="%(!.%F{red}# .%F{green}${bt_prompt_chars}%f)"
  fi

  if [[ $CUSTOM_PROMPT_SEPARATE_LINE == false ]]; then
    bt_prompt_chars="${bt_prompt_chars}"
  fi

  echo -n "$bt_prompt_chars"

  if [[ -n $CUSTOM_PROMPT_CHAR ]]; then
    echo -n " "
  fi
}

# Prompt Line Separator
prompt_line_sep() {
  if [[ $CUSTOM_PROMPT_SEPARATE_LINE == true ]]; then
    # newline wont print without a non newline character, so add a zero-width space
    echo -e '\n%{\u200B%}'
  fi
}

# ------------------------------------------------------------------------------
# MAIN
# Entry point
# ------------------------------------------------------------------------------

build_prompt() {
  RETVAL=$?
  for segment in $CUSTOM_PROMPT_ORDER
  do
    prompt_$segment
  done
  prompt_end
}

NEWLINE='
'
PROMPT=''
[[ $CUSTOM_PROMPT_ADD_NEWLINE == true ]] && PROMPT="$PROMPT$NEWLINE"
PROMPT="$PROMPT"'%{%f%b%k%}$(build_prompt)'
[[ $CUSTOM_PROMPT_SEPARATE_LINE == true ]] && PROMPT="$PROMPT$NEWLINE"
PROMPT="$PROMPT"'%{${fg_bold[default]}%}'
[[ $CUSTOM_PROMPT_SEPARATE_LINE == false ]] && PROMPT="$PROMPT "
PROMPT="$PROMPT"'$(prompt_chars)%{$reset_color%}'
