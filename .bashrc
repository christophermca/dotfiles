#!/bin/bash

# This is intended to be a springboard for
[[ -f /etc/bash.bashrc ]] && source /etc/bash.bashrc # include systemwide .bashrc
[[ -f ~/.__rc/.bashrc ]] && source ~/.__rc/.bashrc

[[ -f ~/.__rc/ps1_config ]] && source ~/.__rc/ps1_config
[[ -f ~/.__rc/aliases ]] && source ~/.__rc/aliases
[[ -f ~/.__rc/functions ]] && source ~/.__rc/functions
