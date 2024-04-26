#!/bin/sh

###
# all configuration keys REQUIRED by theme-switcher
###

# Day THEME
if ! command -v i3 &> /dev/null; then
  return
fi

DAY_THEME_COLOR="#e8e8e8"
DAY_THEME_CURSOR="Qogir-manjaro"
DAY_THEME_IMAGE="$HOME/Pictures/tweaked_wallpapers/daylight.png"
DAY_THEME_NAME="Matcha-azul"

# Night THEME
NIGHT_THEME_COLOR="#0c0c0c"
NIGHT_THEME_CURSOR="Qogir-manjaro-dark"
NIGHT_THEME_IMAGE="$HOME/Pictures/tweaked_wallpapers/long_cityscape7x_clean.png"
NIGHT_THEME_NAME="Matcha-dark-azul"

