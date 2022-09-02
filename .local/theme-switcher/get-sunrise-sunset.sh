#! /bin/sh

# constants
DAY_MODE='day'
NIGHT_MODE='night'

lookup_day_or_night=$(redshift -vp | grep -oP '(?<=Period: )\w+$|(?<=Period: )\w+(?=\))$')

if [ $lookup_day_or_night = $NIGHT_MODE ]; then
  current=$NIGHT_MODE
else
  current=$DAY_MODE
fi
current=$DAY_MODE

save_configuration() {
  local readonly dayNight_from_file=$(cat .config/theme-switcher/mode)

  echo "is $dayNight_from_file != ${current}"

  if [[ ${dayNight_from_file} != ${current} ]]; then

    # TODO clean up this "set-it-and-forget-it" approach

    # HOLD until all uses of mode are updated to the new path
    if [[ ! -f  .config/theme-switcher/mode ]]; then
      touch .config/theme-switcher/mode
    fi

    echo $current > .config/theme-switcher/mode
  fi
}


save_configuration
