#!/bin/bash
echo "__UPDATE_THEME_KIT"
source .local/theme-switcher/shared-variables.sh

if [[ -z $DAY_NIGHT ]]; then
  exit 0
fi

CURRENT_CURSOR=$(xfconf-query -c xsettings -p /Gtk/CursorThemeName)

reset_keys() {
  if [[ -v $CURSOR_THEME  ||  -v $THEME_NAME ]]; then
    unset CURSOR_THEME
    unset THEME_NAME
  fi
}

if [[ $DAY_NIGHT = $DAY_MODE ]]; then
  reset_keys
  CURSOR_THEME="Qogir-manjaro"
  THEME_NAME="Matcha-azul"
elif [[ $DAY_NIGHT = $NIGHT_MODE ]]; then
  reset_keys
  CURSOR_THEME="Qogir-manjaro-dark"
  THEME_NAME="Matcha-dark-azul"
fi

# logging
echo __should change gtk?__ [ "$CURRENT_CURSOR" !=  "$CURSOR_THEME"]
if [[ $CURRENT_CURSOR != $CURSOR_THEME ]]; then
  echo "__should change gtk: YES__";
else
  echo "__should change gtk: NO__";
fi

# change gtk theme if needed
 if [[ -n $CURSOR_THEME && -n  $THEME_NAME ]]; then
   if [[ $CURRENT_CURSOR != $CURSOR_THEME ]]; then
   echo '--__ Hi Bom! - will try to update theme'
   xfconf-query -c xsettings -p /Gtk/CursorThemeName -s $CURSOR_THEME > /dev/null
   xfconf-query -c xsettings -p /Net/ThemeName -s $THEME_NAME > /dev/null
   i3-msg restart
 fi
fi

