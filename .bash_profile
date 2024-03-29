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

[[ -f ~/.profile ]] && . ~/.profile
[[ -f ~/.bashrc ]] && . ~/.bashrc
[[ -f ~/.bin/attach.bash ]] && . ~/.bin/attach.bash

# PATH
export PATH="/usr/bin:/usr/sbin:/bin:/sbin"
export PATH="/usr/local/bin:$HOME/.local/bin:$PATH"
export PATH="$HOME/node_modules/.bin:$PATH"
export PATH="$HOME/.yarn/bin:$PATH"

export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$RUBY/bin

# eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)

#RBENV

# export PATH="$HOME/.rbenv/shims:$HOME/.gem/ruby/2.7.0/bin/:$PATH"
# if command -v rbenv > /dev/null ; then
# 	eval "$(rbenv init - --no-rehash)"
# fi

# Load .tmuxinator, containing tmuxinator logic
 if [ -e "$HOME/.bin/tmuxinator.bash" ]; then
   source ~/.bin/tmuxinator.bash
   alias mux=tmuxinator
 fi

