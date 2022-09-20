#! /bin/bash
source .local/theme-switcher/shared-variables.sh

lookup_day_or_night=$(redshift -vp | grep -oP '(?<=Period: )\w+$|(?<=Period: )\w+(?=\))$' | tr [A-Z] [a-z])
if [[ $lookup_day_or_night == $RDSHF_DAY ]]; then
  current=$DAY_MODE
elif [[ $lookup_day_or_night == $RDSHF_NIGHT ]]; then
  current=$NIGHT_MODE
fi

# DEBUG_MODE ::: used for testing to force value
debug_mode() {
  echo "__DEBUG_MODE_SWITCH__"
  local -r current_mode=$(cat $DAY_NIGHT_MODE_PATH)
  if [[ $current_mode == $DAY_MODE ]]; then
    current=$NIGHT_MODE
  elif [[ $current_mode == $NIGHT_MODE ]]; then
    current=$DAY_MODE
  fi
  echo "INSIDE::: " $current
}

save_configuration() {
  if [[ $DEBUG_THEME_SWITCHER -eq 1 ]]; then
    debug_mode
  else
    local -r day_night_mode=$(cat $DAY_NIGHT_MODE_PATH)
  fi

  if [[ -v current && $day_night_mode != $current ]]; then
    if [[ ! -f  $DAY_NIGHT_MODE_PATH ]]; then
      touch $DAY_NIGHT_MODE_PATH
    fi

    echo $current > $DAY_NIGHT_MODE_PATH
    DAY_NIGHT=$current
  fi
}

save_configuration
