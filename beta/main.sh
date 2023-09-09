#!/bin/bash

url="example.com"
url="hackerone.com"


matchResponseCodes="200,301"


# rm subfinder.txt
# subfinder -d $url -o subfinder.txt -nc

rm interesting/cnames.txt
cat subfinder.txt | dnsx -cname -resp -o interesting/cnames.txt
rm interesting/ipspace.txt
cat subfinder.txt | dnsx -a -resp-only -o interesting/ipspace.txt


# rm httpx.txt
# cat subfinder.txt | httpx -nc -mc $matchResponseCodes -o httpx.txt

# rm getallurls.txt
# cat httpx.txt | getallurls -o getallurls.txt
