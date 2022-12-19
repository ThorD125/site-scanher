#!/usr/bin/env bash

url_file="$1"


if [[ -f "output$url_file" ]]; then
	sudo rm "output$url_file"
fi


while read -r line; do
        if [[ $line =~ ^\*\. ]]; then
		subfinder -d "${line/\*./}" -o "$line.txt"


		cat "$line.txt" >> "output$url_file"

	if [[ -f "$line.txt" ]]; then
			sudo rm "$line.txt"
		fi
        else

                echo "$line" >> "output$url_file"

       fi


done < "$url_file"


cp template.html "index$url_file.html"

echo "





DONE LOOPING SUBFINDER






"


while read -r line; do
        echo $line

echo "<div><h2>$line</h2><table>" >> "index$url_file.html"
        bash ./wapiti.sh $line >> "index$url_file.html"
echo "</table>" >> "index$url_file.html"


done < "output$url_file"





