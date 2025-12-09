#!/bin/bash

configure_alacritty() {
  local themeName;
  local dayNight;

  local current_dir=$(dirname "${BASH_SOURCE[0]}")
  local alacritty_dir=$HOME/.config/alacritty
  local configfile=${alacritty_dir}/alacritty.toml

  local day_theme=$(cat ${current_dir}/selected.toml | grep -oP '(?<=day = ")[a-z-]+')
  local night_theme=$(cat ${current_dir}/selected.toml | grep -oP '(?<=night = ")[a-z-]+')


  # Reset to base configuration
  cat ${current_dir}/base.toml > $configfile


  # Sets the mood ;)
  # nan na-nan ba-ban-na nan nan-na nan
  if (( $# == 1 )); then
    dayNight=$1
  fi

  case ${dayNight} in
    "night")
      # if not set, alacritty will use its default theme :: tomorrow-night
      themeName=$night_theme
      ;;
    "day")
      themeName=$day_theme
      ;;
  esac

  if [ $themeName ];  then
    cat ${alacritty_dir}/colors/themes/${themeName}.toml >> $configfile
  fi

}

export -f configure_alacritty
