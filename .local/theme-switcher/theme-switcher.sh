#! /bin/sh

# NOTE to log cron `journalctl -xb -u cronie`

# latLng=$(curl -s "https://location.services.mozilla.com/v1/geolocate?key=geoclue" | awk 'OFS=":" {print $3,$5}' | tr -d ',}')
# readarray -d : -t strarr <<< "$latLng"

echo "____THEME-switcher____"
THEME_SWITCHER_DIRECTORY=".local/theme-switcher"

# sets DAY_NIGHT
source $THEME_SWITCHER_DIRECTORY/get-sunrise-sunset.sh


if [ -n $DAY_NIGHT ]; then
  . $THEME_SWITCHER_DIRECTORY/update-theme.sh
fi

