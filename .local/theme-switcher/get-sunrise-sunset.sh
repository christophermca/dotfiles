#! /bin/sh
source .local/theme-switcher/shared-variables.sh

lookup_day_or_night=$(redshift -vp | grep -oP '(?<=Period: )\w+$|(?<=Period: )\w+(?=\))$' | tr [A-Z] [a-z])
if [ $lookup_day_or_night = $NIGHT_MODE ]; then
  current=$NIGHT_MODE
else
  current=$DAY_MODE
fi
  # current=$NIGHT_MODE

save_configuration() {
  local -r day_night_mode=$(cat $DAY_NIGHT_MODE_PATH)
  echo "is $day_night_mode != $current"

  if [[ $day_night_mode != $current ]]; then

    # TODO clean up this "set-it-and-forget-it" approach

    # HOLD until all uses of mode are updated to the new path
    if [[ ! -f  $DAY_NIGHT_MODE_PATH ]]; then
      touch $DAY_NIGHT_MODE_PATH
    fi

    echo $current > $DAY_NIGHT_MODE_PATH
    DAY_NIGHT=$current
  fi
}


save_configuration
