#!/bin/bash

url="example.com"
url="hackerone.com"


matchResponseCodes="200,301"


# subfinder -d $url -o subfinder.txt -nc

# cat subfinder.txt | httpx -nc -mc $matchResponseCodes -o httpx.txt
# -tech-detect -status-code -title 

cat httpx.txt | getallurls -o getallurls.txt
