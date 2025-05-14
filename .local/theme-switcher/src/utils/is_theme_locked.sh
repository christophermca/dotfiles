source .local/theme-switcher/src/shared-variables.sh

is_theme_locked() {
  if [[ -n $LOCK_THEME_SWITCHER ]]; then
    echo "0000 __--__--_THEME LOCKED_--__--___"
    exit 33
  fi
}
