#!/bin/bash

# url="example.com"
# url="hackerone.com"
url="epicgames.com"


matchResponseCodes="200,301"



rm -f subfinder.txt
subfinder -d $url -o subfinder.txt -nc



echo LOOT
rm -f interesting/cnames.txt
cat subfinder.txt | dnsx -cname -resp-only -o interesting/cnames.txt
rm -f interesting/ipspace.txt
cat subfinder.txt | dnsx -a -resp-only -o interesting/ipspace.txt



echo gathering
rm -f httpx.txt
cat subfinder.txt | httpx -nc -mc $matchResponseCodes -o httpx.txt
rm -f getallurls.txt
cat httpx.txt | getallurls -o getallurls.txt 



echo LOOT
rm -f interesting/httpxgtallurls.txt
cat getallurls.txt | httpx -mc $matchResponseCodes -o interesting/httpxgtallurls.txt


echo BYPASS
rm -f bypass403.txt
cat subfinder.txt | httpx -nc -mc 403 -o bypass403.txt
rm -f getallpypassurls.txt
cat bypass403.txt | getallurls -o getallpypassurls.txt 

# rm -f httpxgtallurlsbypas403.txt
# cat getallpypassurls.txt | httpx -mc 403 -o httpxgtallurlsbypas403.txt

while IFS= read -r line; do
    echo "$line"
done < getallpypassurls.txt


./bypass-403.sh https://example.com/path/to/resource | grep -E "^200"
