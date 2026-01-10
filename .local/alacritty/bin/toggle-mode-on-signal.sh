#!/bin/bash

###
# Listens for Dbus signal when user changes color-mode
# Updates Alacritty with alacritty-use-theme
###

interface="org.freedesktop.portal.Settings"
type="signal"
member="SettingChanged"

if [[ -f /usr/bin/alacritty-use-theme/use-theme.sh ]]; then
  source /usr/bin/alacritty-use-theme/use-theme.sh
fi

function processOutput() {
    awk '
    $2 ~ "color-scheme" { next }
    $1 ~ "variant" && $2 ~ "string" {
      if ( $3 ~ "prefer-light" || $3 ~ "default" ) {
       system("alacritty-use-theme day")
      } else if ( $3 ~ "prefer-dark" ) {
       system("alacritty-use-theme night")
      }
  }'
}

dbus-monitor "type=$type,interface='$interface',member='$member'" | processOutput
