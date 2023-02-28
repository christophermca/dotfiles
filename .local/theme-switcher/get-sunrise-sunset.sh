#! /bin/bash
source .local/theme-switcher/src/shared-variables.sh
source .local/theme-switcher/src/utils/debug.sh
source .local/theme-switcher/src/utils/is_theme_locked.sh


is_theme_locked
lookup_day_or_night=$(redshift -vp | grep -oP '(?<=Period: )\w+$|(?<=Period: )\w+(?=\))$' | tr [A-Z] [a-z]) # tr API tr from, to
if [[ $lookup_day_or_night == $RDSHFT_DAY ]]; then
  current=$DAY_MODE
elif [[ $lookup_day_or_night == $RDSHFT_NIGHT ]]; then
  current=$NIGHT_MODE
fi

# DEBUG_MODE ::: force themes to always update
# DEBUG_THEME_SWITCHER=1

save_configuration() {
  if [[ -n $DEBUG_THEME_SWITCHER ]]; then
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
