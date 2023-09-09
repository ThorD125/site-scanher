#!/bin/bash

url="example.com"
url="hackerone.com"
# url="epicgames.com"


matchResponseCodes="200,301"


rm -f subfinder.txt
subfinder -d $url -o subfinder.txt -nc

rm -f interesting/cnames.txt
cat subfinder.txt | dnsx -cname -resp-only -o interesting/cnames.txt
rm -f interesting/ipspace.txt
cat subfinder.txt | dnsx -a -resp-only -o interesting/ipspace.txt

rm -f bypass403.txt
cat subfinder.txt | httpx -nc -mc 403 -o bypass403.txt

rm -f httpx.txt
cat subfinder.txt | httpx -nc -mc $matchResponseCodes -o httpx.txt

rm -f getallurls.txt
cat httpx.txt | getallurls -o getallurls.txt
