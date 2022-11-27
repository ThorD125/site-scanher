import os
import re
import urllib.request
import httpx


import helperfuncts

# ip = "192.168.10.21"
# ip = "https://thor-demeestere.be"
ip = "MYVM"
# ip = "http://github.com/"
# ip = "pixl.rip"
# os.system(f'httpx {ip}')
# os.syste(f'{ip}')


# os.syste(f'{ip}')

# lib onelist for all

# ffuf
# dirsearch
# fierce pl
# https://github.com/TheRook/subbrute

# https://github.com/jkcso/Intel-One
# https://github.com/ThoughtfulDev/EagleEye

# https://github.com/infosecn1nja/Red-Teaming-Toolkit
# https://github.com/michenriksen/gitrob
# https://github.com/securebinary/firebaseExploiter




# from CORScanner.cors_scan import cors_check
# ret = cors_check("https://www.instagram.com", None)
# print(ret)



# a program that tests ssh connectons
os.system(f'python3 libs/programs/SSHBrute/ssh-brute.py --hostname {ip} --port 22 --user killerb --passlist sshpass.txt --background >> sshs.txt')
os.system(f'python3 libs/programs/SSHBrute/ssh-brute.py --hostname {ip} --port 22 --user naruto --passlist sshpass.txt --background >> sshs.txt')
os.system(f'python3 libs/programs/SSHBrute/ssh-brute.py --hostname {ip} --port 22 --user ther --passlist sshpass.txt --background >> sshs.txt')
