#! /bin/bash

redshift=$(redshift -p)
is_nighttime=$(echo $redshift | grep -o -e 'Period\: Night')

if [[ -n ${is_nighttime} ]]; then
  temp='night'
else
  temp='day'
fi

save_configuration() {
  current=$(cat .config/theme-switcher/mode)
  echo "is ${current} != ${temp}"

  if [[ ${current} != ${temp} ]]; then
    echo $temp > .config/theme-switcher/mode
    declare -g -x DAY_NIGHT=$temp
  fi

}


save_configuration
