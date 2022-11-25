import os



ip1 = "192.168.10.21"
ip2 = "192.168.10.51"

ipsplit1 = ip1.split(".")
ipsplit2 = ip2.split(".")

basedir = "./scan"


if not os.path.exists(f"{basedir}"):
    os.mkdir(f"{basedir}")

dirs = ["nmap", "nuclei", "sqlmap", "httpx", "subfinder"]

for dir in dirs:
    if not os.path.exists(f"{basedir}/{dir}"):
        os.mkdir(f"{basedir}/{dir}")

def dostuff(ip):
    print(ip)

    os.system(f'nmap {ip} -r -sV --open -oN {basedir}/nmap/{ip}.txt -v')





while int(ipsplit1[-1]) < int(ipsplit2[-1]):
    dostuff(".".join(ipsplit1))
    ipsplit1[-1]=str(int(ipsplit1[-1])+1)

