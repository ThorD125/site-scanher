#!/usr/bin/env bash


cat $(wapiti -u http://$1 --flush-session | grep Open | sed -e "s/^Open //" -e "s/ with a browser to see this report.$//") | grep -o -z -a "<table.*table>" | grep -o -z -a "<tbody.*tbody>" 



# grep -o -z -a "0"
# grep -o -z -a "<tr.+?0.+?tr>

