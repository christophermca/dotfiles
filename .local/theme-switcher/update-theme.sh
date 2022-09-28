#!/bin/bash

echo "__UPDATE_THEME__"
source .local/theme-switcher/src/shared-variables.sh
source .config/theme-switcher/themes.sh
source .local/theme-switcher/src/utils/debug.sh


if [[ -z $DAY_NIGHT ]]; then
  echo "__UPDATE_THEME__No_Change"
  exit 0
fi



if [[ $DAY_NIGHT == $DAY_MODE ]]; then
   feh --bg-center \
       --image-bg $DAY_THEME_COLOR \
       -- $DAY_THEME_IMAGE
elif [[ $DAY_NIGHT == $NIGHT_MODE ]]; then
   feh --bg-center \
       --image-bg $NIGHT_THEME_COLOR \
       -- $NIGHT_THEME_IMAGE
else
  echo mode $DAY_NIGHT is not valid; exit 1;
fi

# Update Terminal Colors
ALACRITTY_USE_SYSTEM_THEME=$(cat .profile | grep ALACRITTY_USE_SYSTEM_THEME | grep -o [[:digit:]])

if [[ $ALACRITTY_USE_SYSTEM_THEME -eq 1 ]]; then
  echo "__SHOULD___FOLLOW SYSTEM_SUNRISE/SUNSET__YES"
else
  echo "__SHOULD___FOLLOW SYSTEM_SUNRISE/SUNSET__NO"
fi

if [[ -n $ALACRITTY_USE_SYSTEM_THEME && $ALACRITTY_USE_SYSTEM_THEME -eq 1 ]]; then
 if [[ -f .local/share/alacritty/configure-colors.sh ]]; then
	 source .local/share/alacritty/configure-colors.sh
	 configure_alacritty $DAY_NIGHT
 fi
fi
