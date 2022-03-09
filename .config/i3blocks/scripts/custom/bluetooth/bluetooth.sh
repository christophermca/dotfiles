#!/bin/bash

# Left click
if [[ "${BLOCK_BUTTON}" -eq 1 ]]; then
  bluetooth toggle
fi

STATUS=$(bluetooth | grep -Eo '(on|off)')

echo ${STATUS}
echo ${STATUS}
echo ""
