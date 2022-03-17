#!/bin/bash
# Prints name, total size, free space and health of all currently imported zpools.
# Output is in a format accepted by pip3 package telegram-send with parameter --format html.
# For plain HTML replace \n with <br>
# - Michel Thomas Brodatzki (https://github.com/MichelBrodatzki)

printf "The following zpools are currently imported:\n<pre>$(zpool list -o name,size,free,health)</pre>"
