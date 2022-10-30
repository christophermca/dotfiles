source $HOME/.local/theme-switcher/src/shared-variables.sh
source $HOME/.config/theme-switcher/themes.sh

is_lock_theme() {
  if [[ -n $LOCK_THEME_SWITCHER  ]]; then
    echo "__--__--_THEME LOCKED_--__--___"
    exit 33
  fi
}

update_background() {
is_lock_theme
if [ -z $1  ]; then
    echo "error not passed DAY_NIGHT"
    return
  fi

  if [[ $1 == $DAY_MODE ]]; then
     feh --bg-center \
         --image-bg $DAY_THEME_COLOR \
         -- $DAY_THEME_IMAGE
  elif [[ $1 == $NIGHT_MODE ]]; then
     feh --bg-center \
         --image-bg $NIGHT_THEME_COLOR \
         -- $NIGHT_THEME_IMAGE
  else
    echo $1 is not a valid mode; exit 1;
  fi
}

update_terminal_colors() {
is_lock_theme
# Update Terminal Colors
  if [[ -n $ALACRITTY_USE_SYSTEM_THEME && $ALACRITTY_USE_SYSTEM_THEME -eq 1 ]]; then
   if [[ -f $HOME/.local/share/alacritty/configure-colors.sh ]]; then
     source $HOME/.local/share/alacritty/configure-colors.sh
     configure_alacritty $1
   fi
  fi
}
