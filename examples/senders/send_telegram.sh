#!/bin/bash
# Sends monitoring script output via Telegram.
# - Michel Thomas Brodatzki (https://github.com/MichelBrodatzki)

# Check for correct script usage
if [[ $# -lt 2 ]]; then
	echo "USAGE: send_telegram.sh [TITLE] [MODULES ...]"
	exit 1
fi

# Use pip3 package telegram-send.
# It sadly doesn't support <br>, so I have to use literal new lines.
telegram-send -g --format html "<b>$1</b>

$(/root/utils/monitoring.sh ${@:2})"
