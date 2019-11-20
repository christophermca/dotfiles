#
# ~/.bash_profile
#

[[ -f ~/.fzf.bash ]] && source ~/.fzf.bash

GIT_PS1_SHOWUPSTREAM=""
GIT_PS1_STATESEPARATOR=":"
GIT_PS1_SHOWSTASHSTATE=1
GIT_PS1_SHOWCOLORHINTS=1
GIT_PS1_SHOWDIRTYSTATE=1

# start ssh-agent
if [ ! -v $SSH_AGENT_PID ]; then
  eval "$(ssh-agent -s)" >> /dev/null
fi

# PATH
export PATH="/usr/bin:/usr/sbin:/bin:/sbin"
export PATH="/usr/local/bin:$HOME/local/bin:$PATH"
export PATH="./node_modules/.bin:$PATH"
export PATH="$HOME/.yarn/bin:$PATH"
export PATH="$HOME/.rbenv/shims:$HOME/.gem/ruby/2.6.0/bin/:$PATH"

#RBENV
if command -v rbenv > /dev/null ; then
	eval "$(rbenv init - --no-rehash)"
fi

# Load .tmuxinator, containing tmuxinator logic
 if [ -e "$HOME/.bin/tmuxinator.bash" ]; then
   source ~/.bin/tmuxinator.bash
   alias mux=tmuxinator
 fi

[[ -f ~/.bin/attach.bash ]] && . ~/.bin/attach.bash
[[ -f ~/.bashrc ]] && . ~/.bashrc
