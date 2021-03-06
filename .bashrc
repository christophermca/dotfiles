#
# ~/.bashrc
#

# /etc/skel/.bashrc {{{

[[ $- != *i* ]] && return

colors() {
  local fgc bgc vals seq0

  printf "Color escapes are %s\n" '\e[${value};...;${value}m'
  printf "Values 30..37 are \e[33mforeground colors\e[m\n"
  printf "Values 40..47 are \e[43mbackground colors\e[m\n"
  printf "Value  1 gives a  \e[1mbold-faced look\e[m\n\n"

  # foreground colors
  for fgc in {30..37}; do
    # background colors
    for bgc in {40..47}; do
      fgc=${fgc#37} # white
      bgc=${bgc#40} # black

      vals="${fgc:+$fgc;}${bgc}"
      vals=${vals%%;}

      seq0="${vals:+\e[${vals}m}"
      printf "  %-9s" "${seq0:-(default)}"
      printf " ${seq0}TEXT\e[m"
      printf " \e[${vals:+${vals+$vals;}}1mBOLD\e[m"
    done
    echo; echo
  done
}

[ -r /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion

# Change the window title of X terminals
case ${TERM} in
  xterm*|rxvt*|Eterm*|aterm|kterm|gnome*|interix|konsole*)
    PROMPT_COMMAND='echo -ne "\033]0;${HOSTNAME%%.*}\007"'
    ;;
  screen*)
    PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\033\\"'
    ;;
esac

use_color=true

# Set colorful PS1 only on colorful terminals.
# dircolors --print-database uses its own built-in database
# instead of using /etc/DIR_COLORS.  Try to use the external file
# first to take advantage of user additions.  Use internal bash
# globbing instead of external grep binary.
safe_term=${TERM//[^[:alnum:]]/?}   # sanitize TERM
match_lhs=""
[[ -f ~/.dir_colors   ]] && match_lhs="${match_lhs}$(<~/.dir_colors)"
[[ -f /etc/DIR_COLORS ]] && match_lhs="${match_lhs}$(</etc/DIR_COLORS)"
[[ -z ${match_lhs}    ]] \
  && type -P dircolors >/dev/null \
  && match_lhs=$(dircolors --print-database)
  [[ $'\n'${match_lhs} == *$'\n'"TERM "${safe_term}* ]] && use_color=true

  if ${use_color} ; then
    # Enable colors for ls, etc.  Prefer ~/.dir_colors #64489
    if type -P dircolors > /dev/null ; then
      if [[ -f ~/.dir_colors ]] ; then
        eval $(dircolors -b ~/.dir_colors)
      elif [[ -f /etc/DIR_COLORS ]] ; then
        eval $(dircolors -b /etc/DIR_COLORS)
      fi
      fi

      if [[ ${EUID} == 0 ]] ; then
        # root
        PS1="\e[31;40m❲\u@\h❳\e[0m \w \e[0m\n \$ "
      else
        RESET="\e[m";
        BLUE="\e[1;34m\]";
        GREY="\e[2;37m\]";
        COLOR1="\e[0;33m\]"

        CURRENT_PATH="$GREY\w$RESET";
        COMPNAME="$RESET$BLUE\h$RESET";
        GIT_INFO="\$(__git_ps1 '|$COLOR1%s$RESET')";
        END=" \$ ";

        PS1="❲$COMPNAME$GIT_INFO❳ $CURRENT_PATH\n$END"

      fi

      alias ls='ls --color=auto'
      alias grep='grep --colour=auto'
      alias egrep='egrep --colour=auto'
      alias fgrep='fgrep --colour=auto'
    else
      if [[ ${EUID} == 0 ]] ; then
        # show root@ when we don't have colors
        PS1='\u@\h \W \$ '
      else
        PS1='\u@\h \w \$ '
      fi
      fi

      unset use_color safe_term match_lhs sh

      alias cp="cp -i"                          # confirm before overwriting something
      alias df='df -h'                          # human-readable sizes
      alias free='free -m'                      # show sizes in MB
      alias np='nano -w PKGBUILD'
      alias more=less

      xhost +local:root > /dev/null 2>&1

      complete -cf sudo

# Bash won't get SIGWINCH if another process is in the foreground.
# Enable checkwinsize so that bash will check the terminal size when
# it regains control.  #65623
# http://cnswww.cns.cwru.edu/~chet/bash/FAQ (E11)
shopt -s checkwinsize

shopt -s expand_aliases

# export QT_SELECT=4

# Enable history appending instead of overwriting.  #139609
shopt -s histappend

#
# # ex - archive extractor
# # usage: ex <file>

ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# better yaourt colors
export YAOURT_COLORS="nb=1:pkg=1:ver=1;32:lver=1;45:installed=1;42:grp=1;34:od=1;41;5:votes=1;44:dsc=0:other=1;35"


#}}}

[[ -f /usr/share/git/completion/git-completion.bash ]] && source /usr/share/git/completion/git-completion.bash
[[ -f /usr/share/git/completion/git-prompt.sh ]] && source /usr/share/git/completion/git-prompt.sh

###
# ALIASES
###

alias .bashrc='vim $HOME/.bashrc'
alias .bash_profile='vim $HOME/.bash_profile'

alias killport="killPort"

###
# GIT aliases
###

alias graph='git log --oneline --graph --abbrev-commit --pretty=format:"%Cgreen %h %Creset%s %n%an - %cr %n%n"'
alias reb='git rebase'
alias rebc='git add . && git rebase --continue'
alias rebs='git rebase --skip'
alias fix='vim `git diff --name-only | uniq | xargs`'
alias rem='remaster'
alias dfi='/usr/bin/git --git-dir=$HOME/.dotfiles.git --work-tree=$HOME'

# Functions

killPort() {
  if (( $# == 1 )); then
    local PORT=$1
    local readonly USEDPORT=$(lsof -i :$PORT);

    if [[ -n $USEDPORT ]];
    then
      $(ps -eo pid,command | ag [n]ode | awk "{print $2}" | xargs kill -9 > /dev/null 2>&1 &)
      echo -e "${COL_GREEN} Done!";
    else
      echo -e "${COL_BLUE} Port ${PORT} not in use";
    fi
  else
    echo "${COL_BLUE}Usage: killPort <pid>${NORMAL}"
  fi
}

remaster() {
  local readonly CURRENTBRANCH=$(git symbolic-ref --short HEAD)

  git fetch --all

  if [[ -n "$CURRENTBRANCH" ]]; then
    if [[ "$CURRENTBRANCH" != "master" ]]; then
      git checkout master
      git reset --hard upstream/master
      git push origin master --no-verify
      git checkout $CURRENTBRANCH
      git pull --rebase upstream master
    else
      git reset --hard upstream/master
    fi
  fi
}

attach() {
  if type "tmux" > /dev/null; then

    local SESSION=$1
    #TODO should I convert to unix code \e[00m or use tput?
    local readonly GREEN=$(tput setaf 2)
    local readonly NORMAL=$(tput sgr0)

    if [ $# -eq 0 ]; then
      tmux ls >> /dev/null 2>&1
      if [ $? -eq 0 ]; then
        printf "${GREEN}list:________\n${NORMAL}";
        tmux ls -F '#{session_name}'
        printf "\n\nWhat session would you like to attach? " -n
        read SESSION
        $(tmux attach -d -t $SESSION)
      else
        printf "${GREEN}No sessions created\n${NORMAL}"
      fi

    else
      if [ $? -ne 0 ]; then
        $(tmux attach -d -t $SESSION)
      else
        printf "ERR: Could not find session \`${SESSION}\`\n"
      fi
    fi
  fi
}

# vim: fdm=marker foldlevelstart=1 foldlevel=0
