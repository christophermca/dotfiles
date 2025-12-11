#!/bin/bash

# what if we switched this to append an import statement that includes a link to
# the theme.


configure_alacritty() {
  local themeName;
  local dayNight;

  local alacrittyDir=$HOME/.config/alacritty
  local configfile=${alacrittyDir}/alacritty.toml

  local dayTheme=$(cat ${alacrittyDir}/themes/selected.toml | grep -oP '(?<=day = ")[a-z-]+')
  local nightTheme=$(cat ${alacrittyDir}/themes/selected.toml | grep -oP '(?<=night = ")[a-z-]+')


  # Reset to base configuration
  if [[ -f ${alacrittyDir}/src/base.toml ]]; then
    cat ${alacrittyDir}/src/base.toml > $configfile
  elif [[ -f ${alacrittyDir}/.base-config.toml ]]; then
    cat ${alacrittyDir}/.base-config.toml  > $configfile
  fi


  # Set the mood ;)
  # nan na-nan -- ba nan-na nan -- nan-na nan
  if (( $# == 1 )); then
    dayNight=$1
  fi

  case ${dayNight} in
    "night")
      # if not set, alacritty will use its default theme :: Tomorrow-night mixed
      # with Tomorrow-night-bright
      themeName=$nightTheme
      ;;
    "day")
      themeName=$dayTheme
      ;;
  esac

  if [ $themeName ];  then
    cat ${alacrittyDir}/themes/themes/${themeName}.toml >> $configfile
  fi

}

export -f configure_alacritty
