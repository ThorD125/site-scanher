import httpx
import re

def gethttporhtp(ip):
    testingurl = filterip(ip)
    http = httpx.get(f"http://{testingurl}", follow_redirects=True)
    return http.url

def filterip(ip):
    return re.sub("\*\.", '', re.sub("https?//", '', re.sub("www.", '', ip)))

