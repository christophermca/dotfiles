#! /bin/sh

lookup_day_or_night=$(redshift -vp | grep -oP '(?<=Period: )\w+$|(?<=Period: )\w+(?=\))$')

if [ $lookup_day_or_night = 'Night' ]; then
  current='night'
else
  current='day'
fi

save_configuration() {
  local readonly dayNight_from_file=$(cat .config/theme-switcher/mode)
  if [[ -z $DAY_NIGHT ]]; then
    echo DAY_NIGHT is not set
  fi

  echo "is $dayNight_from_file or $DAY_NIGHT != ${current}"

  if [[ ${dayNight_from_file} != ${current} ]]; then

    # TODO clean up this "set-it-and-forget-it" approach
    declare -g -x DAY_NIGHT=$current

    # HOLD until all uses of mode are updated to the new path
    echo $DAY_NIGHT > .config/theme-switcher/mode
  fi
}


save_configuration
