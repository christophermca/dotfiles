#!/bin/bash

echo "__UPDATE_THEME__"
source .local/share/theme-switcher/toggle-theme.sh

if [[ -z $DAY_NIGHT ]]; then
  echo "__UPDATE_THEME__No_Change"
  exit 0
fi

update_background $DAY_NIGHT

# Update Terminal Colors
if [[ $ALACRITTY_USE_SYSTEM_THEME -eq 1 ]]; then
  echo "__SHOULD___FOLLOW SYSTEM_SUNRISE/SUNSET__YES"
else
  echo "__SHOULD___FOLLOW SYSTEM_SUNRISE/SUNSET__NO"
fi

update_terminal_colors $DAY_NIGHT
