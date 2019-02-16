# 소스코드 8번 -----------------------------------------------------------
from urllib.request import urlopen
from bs4 import BeautifulSoup

html = urlopen("http://www.naver.com")
bsObject = BeautifulSoup(html, "html.parser")
print(type(bsObject))
print("----------------------------------------")
print(bsObject.head.title)
print("----------------------------------------")
print (bsObject.head.find("meta", {"name":"description"}).get('content'))
print("----------------------------------------")
for link in bsObject.find_all('a'):
    print("컨텐트 - ", link.text.strip(), " 링크 - ", link.get('href'))

