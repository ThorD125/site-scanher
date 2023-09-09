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