#!bin/sh

debug_mode() {
  local -r current_mode=$(cat $DAY_NIGHT_MODE_PATH)
  if [[ $current_mode == $DAY_MODE ]]; then
    current=$NIGHT_MODE
  elif [[ $current_mode == $NIGHT_MODE ]]; then
    current=$DAY_MODE
  fi
}

print_theme_switcher_state() {
    echo "FINDME:::: DAY_NIGHT is currently set to *$DAY_NIGHT*\
      ||variables||\
      file=$(cat $DAY_NIGHT_MODE_PATH),\
      day_mode=$DAY_MODE,\
      night_mode=$NIGHT_MODE"
}

if [[ $DEBUG_THEME_SWITCHER ]]; then
  print_theme_switcher_state
fi
