###
# SOURCE {{{
###
[[ -f /usr/share/git/completion/git-completion.bash ]] && source /usr/share/git/completion/git-completion.bash
[[ -f /usr/share/git/completion/git-prompt.sh ]] && source /usr/share/git/completion/git-prompt.sh
[[ -f .local/share/alacritty/configure-colors.sh ]] && source .local/share/alacritty/configure-colors.sh
[[ -s "$NVM_DIR/nvm.sh" ]] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[[ -s "$NVM_DIR/bash_completion" ]] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

 #}}}

# Functions {{{
###

learn() {
  local GREEN="\e[32m";
  local RED="\e[31m";
  local NORMAL="\e[0m";

  [[ ! -d ~/Repos/_learning ]] && mkdir ~/Repos/_learning

  report_error() {
    echo -e "\"${RED}$1${NORMAL}\" is not an option\n\n${GREEN}Available Options:"
    ls -1 ~/Repos/_learning/
  };

  found_subject() {
    echo -e "Lets Learn ${GREEN}$1${NORMAL}!\n"
    cd ~/Repos/_learning/$1
    echo "Projects:"
    ls .
  };

  if (( $# == 1 )); then
    found_subject $2 || report_error $1
  else
    cd ~/Repos/_learning/ && ls
    ## include prompt to get subject. Recursivly run through
  fi
}

kill_port() {
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
      git push origin master
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
    # TODO should I convert to unix code \e[00m or use tput?
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
        #}}}
###
# EXPORTS {{{
###

# better yaourt colors {{{
export YAOURT_COLORS="nb=1:pkg=1:ver=1;32:lver=1;45:installed=1;42:grp=1;34:od=1;41;5:votes=1;44:dsc=0:other=1;35"
#}}}

export NVM_DIR="$HOME/.nvm"
#}}}

# vim: fdm=marker foldlevelstart=1 foldlevel=0

