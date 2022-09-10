#!/bin/bash

echo "__UPDATE_THEME__"
source .local/theme-switcher/shared-variables.sh

if [[ -z $DAY_NIGHT ]]; then
  echo "__UPDATE_THEME__No_Change"
  exit 0
fi

if [[ $DAY_NIGHT = $DAY_MODE ]]; then
   feh --bg-center \
       --image-bg '#e8e8e9' \
       -- $HOME/Pictures/tweaked_wallpapers/daylight.png
elif [[ $DAY_NIGHT = $NIGHT_MODE ]]; then
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
 if [[ -f .local/share/alacritty/configure-colors.sh ]]; then
	 source .local/share/alacritty/configure-colors.sh
	 configure_alacritty $DAY_NIGHT
 fi
fi
