#!/bin/sh
# Prints health state of every sd[a-z] device in a format accepted
# by pip3 package telegram-send with parameter --format html.
# For plain HTML replace \n with <br>.
# - Michel Thomas Brodatzki (https://github.com/MichelBrodatzki)

smart="<i>SMART health:</i>\n"

for dev in $(lsblk -d | tail -n+2 | cut -d" " -f1)
do
	device_info=$(smartctl -i /dev/$dev)

	# Output error if device couldn't be opened (1st bit of exit status set)
	if [[ $(($? & 1)) -eq 0 ]]; then
			device_id=$($device_info | grep "Device Model" | cut -c 19-)
			smart="${smart}<u>Drive: $device_id</u>\n$(smartctl -H /dev/$dev | tail -n +5)\n"
	elif [[ $(($? & 1)) -gt 0 ]]; then
		smart="${smart}<u>Failed to fetch drive information for /dev/$dev</u>\n"
	fi
done

printf "$smart"
