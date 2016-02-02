###### Variaveis de Ambiente
export CLICOLOR=1
export LSCOLORS=DxGxcxdxCxegedabagacad

force_color_prompt=yes


####### Prompt ###############
function prompt {
  local LIGHT_RED="\[\033[1;31m\]"
  local LIGHT_GREEN="\[\033[1;32m\]"
  local NO_COLOUR="\[\033[0m\]"

  local TITLEBAR='\[\033]0;\u@\h\007\]'

  export GIT_PS1_SHOWDIRTYSTATE=true
  export GIT_PS1_SHOWUNTRACKEDFILES=true
  export GIT_PS1_SHOWUPSTREAM=auto
  export GIT_PS1_SHOWSTASHSTATE=true

  PS1="$TITLEBAR\n\w/$LIGHT_GREEN\$(__git_ps1 ' (%s)') $LIGHT_RED\$(~/.rvm/bin/rvm-prompt i v g)\n$NO_COLOUR$ "
}
prompt