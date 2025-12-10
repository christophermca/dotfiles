#!/bin/bash

###
# Listens for Dbus signal when user changes color-mode
# Updates Alacritty with configure-colors
###

if [[ -f $HOME/.local/share/alacritty/configure-colors.sh ]]; then
 source $HOME/.local/share/alacritty/configure-colors.sh
fi

interface="org.freedesktop.portal.Settings"
type="signal"
member="SettingChanged"

function processOutput() {
    awk '
    $2 ~ "color-scheme" {
    next
    }
    $1 ~ "variant" && $2 ~ "string" {
      if ( $3 ~ "prefer-light" || $3 ~ "default" ) {
       system("configure_alacritty day")
     } else if ( $3 ~ "prefer-dark" ) {
      system("configure_alacritty night")
     }
  }'
}

dbus-monitor "type=$type,interface='$interface',member='$member'" | processOutput
