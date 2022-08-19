#!/bin/bash

echo "__UPDATE_THEME__"
# Fallback to saved config value
CONFIG_PATH=".config/theme-switcher/mode"

if [[ -z $DAY_NIGHT && -f $CONFIG_PATH ]]; then
  DAY_NIGHT=$(cat $CONFIG_PATH)
  echo From File: $DAY_NIGHT
fi

if [[ $DAY_NIGHT = "day" ]]; then
   feh --bg-center \
       --image-bg '#e8e8e9' \
       -- $HOME/Pictures/tweaked_wallpapers/daylight.png
elif [[ $DAY_NIGHT = "night" ]]; then
   feh --bg-center \
       --image-bg 'black' \
       -- $HOME/Pictures/tweaked_wallpapers/long_cityscape6_clean.png
else
  echo mode $DAY_NIGHT is not valid; exit 1;
fi

# Update Terminal Colors
ALACRITTY_USE_SYSTEM_THEME=$(cat .profile | grep ALACRITTY_USE_SYSTEM_THEME | grep -o [[:digit:]])

echo "__SHOULD___FOLLOW SYSTEM_SUNRISE/SUNSET__?"
if [[ $ALACRITTY_USE_SYSTEM_THEME -eq 1 ]]; then
  echo "Yes"
else
  echo "No"
fi

if [[ -n $ALACRITTY_USE_SYSTEM_THEME && $ALACRITTY_USE_SYSTEM_THEME -eq 1 ]]; then
  source .local/share/alacritty/configure-colors.sh
  configure_alacritty $DAY_NIGHT
fi
