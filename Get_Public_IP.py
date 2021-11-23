import urllib.request
import re

#print ("we will try to open this url, in order to get IP Address")

url = "http://checkip.dyndns.org"

#print (url)

request = urllib.request.urlopen(url).read().decode()

theIP = re.findall(r"\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}", request)[0]

#print ("your IP Address is: ",  theIP)
print ("*****************\n",theIP,"\n*****************\n")