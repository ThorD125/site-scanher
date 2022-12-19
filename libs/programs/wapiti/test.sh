#!/usr/bin/env bash

dir_path="./dirbpost.txt/"

outputsfolder="./outputs/"



find "$dir_path" -type f -name "*.html" ! -name "report.html" -exec echo {} >>test \;


rm out

while read -r line
do

	echo "$line"
	cat "$line" | grep -o -z -a "table.*table" | grep -a "<a"

done < test






cat out



lynx $(wapiti -u http://www.ad.nl | grep Open | sed -e "s/^Open //" -e "s/ with a browser to see this report.$//")
