#! /bin/bash

# NOTE to log cron `journalctl -xb -u cronie`

# latLng=$(curl -s "https://location.services.mozilla.com/v1/geolocate?key=geoclue" | awk 'OFS=":" {print $3,$5}' | tr -d ',}')
# readarray -d : -t strarr <<< "$latLng"

echo "____THEME-switcher____"
WORKING_DIRECTORY=".local/theme-switcher"

# sets DAY_NIGHT
source $WORKING_DIRECTORY/get-sunrise-sunset.sh

echo "____DAY_NIGHT___ " $DAY_NIGHT
if [[ -n $DAY_NIGHT ]]; then
  . $WORKING_DIRECTORY/update-theme.sh
fi

