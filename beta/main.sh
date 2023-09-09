#!/bin/bash

url="example.com"
url="hackerone.com"


matchResponseCodes="200,301"


# subfinder -d $url -o subfinder.txt -nc

cat subfinder.txt | httpx -nc -tech-detect -status-code -title -follow-redirects -o httpx.txt -mc $matchResponseCodes
