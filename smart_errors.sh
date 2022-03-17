#!/bin/sh
# Prints health state of every sd[a-z] device in a format accepted
# by pip3 package telegram-send with parameter --format html.
# For plain HTML replace \n with <br>.
# - Michel Thomas Brodatzki (https://github.com/MichelBrodatzki)

smart="<i>SMART health:</i>\n"

for dev in $(ls /dev/sd[a-z])
do
	device_id=$(smartctl -i $dev | grep "Device Model" | cut -c 19-)
	smart="${smart}<u>Drive: $device_id</u>\n$(smartctl -H $dev | tail -n +5)\n"
done

printf "$smart"
