#!/bin/bash
# Basic monitoring script.
# Outputs selected information in a format accepted by pip3 package telegram-send
# with parameter --format html. For plain HTML replace \n with <br>
# - Michel Thomas Brodatzki (https://github.com/MichelBrodatzki)

# Make matching case insensitive
shopt -s nocasematch

# Fetch current directory
CURRENT_PATH=$(dirname "$0")

# Output needed modules
for param in $@
do
	case $param in
		"smart")
			printf "$(/bin/bash ${CURRENT_PATH}/smart_errors.sh)\n\n"
		;;

		"zpool")
			printf "$(/bin/bash ${CURRENT_PATH}/zpool_state.sh)\n\n"
		;;
	esac
done

# Restore default case matching
shopt -u nocasematch
