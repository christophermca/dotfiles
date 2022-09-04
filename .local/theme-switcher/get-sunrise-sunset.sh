#! /bin/sh
source .local/theme-switcher/shared-variables.sh

lookup_day_or_night=$(redshift -vp | grep -oP '(?<=Period: )\w+$|(?<=Period: )\w+(?=\))$' | tr [A-Z] [a-z])
if [ $lookup_day_or_night = $NIGHT_MODE ]; then
  current=$NIGHT_MODE
else
  current=$DAY_MODE
fi

save_configuration() {
  local -r day_night_mode=$(cat $DAY_NIGHT_MODE_PATH)

  if [[ $day_night_mode != $current ]]; then
    if [[ ! -f  $DAY_NIGHT_MODE_PATH ]]; then
      touch $DAY_NIGHT_MODE_PATH
    fi

    echo $current > $DAY_NIGHT_MODE_PATH
    DAY_NIGHT=$current
  fi
}

save_configuration
