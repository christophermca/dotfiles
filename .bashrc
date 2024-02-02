#!/bin/bash

# This is intended to be a springboard for
[[ -f /etc/bash.bashrc ]] && source /etc/bash.bashrc # include systemwide .bashrc
[[ -f ~/.__rc/.bashrc ]] && source ~/.__rc/.bashrc

[[ -f ~/.__rc/opt/ps1_config ]] && source ~/.__rc/opt/ps1_config
[[ -f ~/.__rc/opt/aliases ]] && source ~/.__rc/opt/aliases
[[ -f ~/.__rc/opt/functions ]] && source ~/.__rc/opt/functions
