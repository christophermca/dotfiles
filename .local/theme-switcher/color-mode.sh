#!/bin/bash

###
# color-mode refers to toggling light and dark themes (color-modes)
###

if [[ -f $HOME/.local/share/alacritty/configure-colors.sh ]]; then
 source $HOME/.local/share/alacritty/configure-colors.sh
fi

interface="org.freedesktop.portal.Settings"
type="signal"
member="SettingChanged"
value="'prefer-dark'"

function processOutput() {
    awk '
    $2 ~ "color-scheme" {
    next
    }
    $1 ~ "variant" && $2 ~ "string" {
      if ( $3 ~ "prefer-light" || $3 ~ "default" ) {
       print("day", $0)
       system( "configure_alacritty day" )
       system("")
     } else if ( $3 ~ "prefer-dark" ) {
      print("night", $0)
      system( "configure_alacritty night" )
      system("")
     }
  }'
}

dbus-monitor "type=$type,interface='$interface',member='$member'" | processOutput
