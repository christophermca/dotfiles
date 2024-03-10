#!/bin/bash

###
# SOURCE {{{
###
[[ -f /usr/share/git/completion/git-completion.bash ]] && source /usr/share/git/completion/git-completion.bash
# [[ -f /usr/share/git/completion/git-prompt.sh ]] && source /usr/share/git/completion/git-prompt.sh
[[ -f .local/share/alacritty/configure-colors.sh ]] && source .local/share/alacritty/configure-colors.sh
[[ -f .local/share/obsidian/create-project-folder.sh ]] && source .local/share/obsidian/create-project-folder.sh
[[ -f "$HOME/Repos/_learning/.local/learn.bash" ]] && source $HOME/Repos/_learning/.local/learn.bash
# NVM
[[ -s "$NVM_DIR/nvm.sh" ]] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[[ -s "$NVM_DIR/bash_completion" ]] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# __rc
[[ -f "$HOME/.__rc/opt/ps_config" ]] && source "$HOME/.__rc/opt/ps_config"
[[ -f "$HOME/.__rc/opt/aliases" ]] && source "$HOME/.__rc/opt/aliases"

## Functions {{{
####

[[ -f "$HOME/.__rc/bin/sourceShellScripts" ]] && source "$HOME/.__rc/bin/sourceShellScripts"

list=(git colors ex attach killport learn)

sourceShellScripts "${list[*]}"


#}}}

# EXPORTS {{{
###

# better yaourt colors {{{
export YAOURT_COLORS="nb=1:pkg=1:ver=1;32:lver=1;45:installed=1;42:grp=1;34:od=1;41;5:votes=1;44:dsc=0:other=1;35"
#}}}

export NVM_DIR="$HOME/.nvm"
#}}}

# vim: fdm=marker foldlevelstart=1 foldlevel=0

