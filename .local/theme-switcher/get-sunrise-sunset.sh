#! /bin/sh

lookup_day_or_night=$(redshift -vp | grep -oP '(?<=Period: )\w+$|(?<=Period: )\w+(?=\))$')

if [ $lookup_day_or_night = 'Night' ]; then
  current='night'
else
  current='day'
fi
  current='night'


save_configuration() {
  echo 'findme__--_' $USER $LOGNAME
  local readonly dayNight_from_file=$(cat /var/lib/theme-switcher/mode)
  if [[ -z $DAY_NIGHT ]]; then
    echo DAY_NIGHT is not set
  fi

  echo "is $DAY_NIGHT != ${current}"

  if [[ ${dayNight_from_file} != ${current} ]]; then

    # TODO clean up this "set-it-and-forget-it" approach
    declare -g -x DAY_NIGHT=$current
    declare -g -p DAY_NIGHT > .config/theme-switcher/day_night

    # HOLD until all uses of mode are updated to the new path
    echo $DAY_NIGHT > .config/theme-switcher/mode


    # NOTE this won't work without root access
    # Do we want to require root access?
    echo $DAY_NIGHT > /var/lib/theme-switcher/mode

  fi
}


save_configuration
