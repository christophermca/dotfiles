#!/bin/bash
echo '_____THEME-switcher-update-gtk______'

. /shared-variables
if [[ -z $DAY_NIGHT && -f $DAY_NIGHT_MODE_PATH ]]; then
  DAY_NIGHT=$(cat $DAY_NIGHT_MODE_PATH)
  echo From File: $DAY_NIGHT
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

