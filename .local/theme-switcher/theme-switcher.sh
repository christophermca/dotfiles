#! /bin/sh

echo "____THEME-switcher____"
THEME_SWITCHER_DIRECTORY=".local/theme-switcher"

# sets DAY_NIGHT
source $THEME_SWITCHER_DIRECTORY/get-sunrise-sunset.sh


if [ -n $DAY_NIGHT ]; then
  . $THEME_SWITCHER_DIRECTORY/update-theme.sh
fi

