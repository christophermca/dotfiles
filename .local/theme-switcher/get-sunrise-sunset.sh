#! /bin/sh

. shared-variables.sh

lookup_day_or_night=$(redshift -vp | grep -oP '(?<=Period: )\w+$|(?<=Period: )\w+(?=\))$')

if [ $lookup_day_or_night = $NIGHT_MODE ]; then
  current=$NIGHT_MODE
else
  current=$DAY_MODE
fi
current=$DAY_MODE

save_configuration() {
  local readonly dayNight_from_file=$(cat $THEME_SWITCHER_MODE_PATH)

  echo "is $dayNight_from_file != ${current}"

  if [[ ${dayNight_from_file} != ${current} ]]; then

    # TODO clean up this "set-it-and-forget-it" approach

    # HOLD until all uses of mode are updated to the new path
    if [[ ! -f  $THEME_SWITCHER_MODE_PATH ]]; then
      touch $THEME_SWITCHER_MODE_PATH
    fi

    echo $current > $THEME_SWITCHER_MODE_PATH
  fi
}


save_configuration
