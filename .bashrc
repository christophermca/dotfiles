#!/bin/bash

# This is intended to be a springboard for
[[ -f ~/.__rc/ps1_config ]] && source ~/.__rc/ps1_config
[[ -f ~/.__rc/.bashrc ]] && source ~/.__rc/.bashrc
[[ -f ~/.__rc/aliases ]] && source ~/.__rc/aliases
[[ -r /usr/share/bash-completion/bash_completion ]] && source /usr/share/bash-completion/bash_completion
