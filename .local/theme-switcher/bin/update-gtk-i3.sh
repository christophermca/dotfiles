#!/bin/sh

###
# Update desktop theme for i3 xfce configuration
###


if [[ ! -f /usr/bin/i3 ]]; then
  echo "__i3_is_not_installed__"
  exit 0
fi

echo "__UPDATE_THEME_KIT"

source .local/theme-switcher/src/shared-variables.sh
source .config/theme-switcher/themes.sh


if [[ -z $DAY_NIGHT ]]; then
  if [[ -f $DAY_NIGHT_MODE_PATH ]]; then
    DAY_NIGHT=$(cat $DAY_NIGHT_MODE_PATH)
  else
    echo "Day_night is not set"
    exit 0
  fi
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
  CURSOR_THEME=$DAY_THEME_CURSOR
  THEME_NAME=$DAY_THEME_NAME
elif [[ $DAY_NIGHT = $NIGHT_MODE ]]; then
  reset_keys
  CURSOR_THEME=$NIGHT_THEME_CURSOR
  THEME_NAME=$NIGHT_THEME_NAME
fi

# logging
if [[ $CURRENT_CURSOR != $CURSOR_THEME ]]; then
  echo "__should change gtk: YES__";
else
  echo "__should change gtk: NO__";
fi

# change gtk theme if needed
 if [[ -n $CURSOR_THEME && -n $THEME_NAME ]]; then
   if [[ $CURRENT_CURSOR != $CURSOR_THEME ]]; then
   echo "__UPDATE_THEME_KIT___UPDATING_THEME..."
   xfconf-query -c xsettings -p /Gtk/CursorThemeName -s $CURSOR_THEME > /dev/null
   xfconf-query -c xsettings -p /Net/ThemeName -s $THEME_NAME > /dev/null
   i3-msg restart
 fi
fi

