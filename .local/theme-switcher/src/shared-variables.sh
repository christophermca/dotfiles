#!/bin/sh

#-----#
# redshift expected search terms
# subject to change depending on the redshift api
#-----#
RDSHFT_NIGHT='night'
RDSHFT_DAY='daytime'

#-----#
# theme_switcher
#-----#

NIGHT_MODE='night'
DAY_MODE='day'
DAY_NIGHT_MODE_PATH='/home/christophermca/.config/theme-switcher/mode'
ALACRITTY_USE_SYSTEM_THEME=$(cat $HOME/.profile | grep ALACRITTY_USE_SYSTEM_THEME | grep -o [[:digit:]])

