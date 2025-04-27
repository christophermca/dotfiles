#!/bin/bash

echo "____THEME-switcher____"
THEME_SWITCHER_DIRECTORY="$HOME/.local/theme-switcher"

# DEBUG_MODE ::: Uncomment next-line to force THEME_SWITCHER to update the mode every run
# DEBUG_THEME_SWITCHER=1

# sets DAY_NIGHT
source $THEME_SWITCHER_DIRECTORY/bin/get-sunrise-sunset.sh

echo "_____${DAY_NIGHT}____"
if [ -n $DAY_NIGHT ]; then
  sh $THEME_SWITCHER_DIRECTORY/bin/update-gdm.sh
fi
