#subfinder -d cm.com -o subfind -silent

#gobuster dns -d cm.com -w ../libs/wordlists/SecLists/Discovery/DNS/subdomains-top1million-110000.txt -o gobust -q --no-color -z

#cat gobust | grep -Po "Found: \K.*" > gobust1

#cat gobust1 subfind > cat

#rm uniq

#unique -inp=cat uniq

####cat uniq | httpx-toolkit --sc -title -fr -fhr -silent -nc > httpx

bash loop.sh > getallurls
