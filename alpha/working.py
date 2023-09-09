import os
import httpx
import re

from helperfuncts import *

ip2 = ""
ipsplit2 = ""

options = {
    "nmap": "-r -sV --open -v -A",
    "subfinder": "-silent",
    "nuclei": "-rdb -fr -stats -ut",
}

# ip1 = "*.google.com"
ip1 = "192.168.10.21"
ip2 = "192.168.10.50"


ipsplit1 = ip1.split(".")

if ip2 != "":
    ipsplit2 = ip2.split(".")

basedir = "./scan"



if not os.path.exists(f"{basedir}"):
    os.mkdir(f"{basedir}")

dirs = ["nmap", "nuclei", "sqlmap", "httpx", "subfinder", "gau", "robots"]

for dir in dirs:
    if not os.path.exists(f"{basedir}/{dir}"):
        os.mkdir(f"{basedir}/{dir}")

def dostuff(ip):
    print(ip)
    try:
        # os.system(f'nmap {filterip(ip)} -oN {basedir}/nmap/{ip}.txt {options["nmap"]}')
        
        # # os.system(f'nuclei -u {gethttporhtp(ip)} -o {basedir}/nuclei/{filterip(ip)}.txt {options["nuclei"]}')
        
        # os.system(f'gau {ip} --mc "200" --o {basedir}/gau/{filterip(ip)}.txt')
        
        os.system(f'wget {gethttporhtp(ip)}/robots.txt -O {basedir}/robots/{filterip(ip)}.txt -k')
        # os.system(f'python3 libs/programs/SSHBrute/ssh-brute.py --hostname {ip} --port 22 --user killerb --passlist sshpass.txt --background >> {basedir}/sshs.txt')
    except:
        pass




if ip2 == "":
    dostuff(ip1)
else:
    while int(ipsplit1[-1]) < int(ipsplit2[-1]):
        dostuff(".".join(ipsplit1))
        ipsplit1[-1]=str(int(ipsplit1[-1])+1)

# os.system(f'subfinder -d {filterip(ip)} -o {basedir}/subfinder/{filterip(ip)}.txt {options["subfinder"]}')
# blob:https://thor.demedestere.be/02b4e666-8111-4d1b-94e6-aeac138dc3e4
