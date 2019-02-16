# 소스코드 10번 -----------------------------------------------------------
import requests 
from bs4 import BeautifulSoup
url="http://www.inven.co.kr/webzine/news/?news=170888&site=overwatch"
res = requests.get(url)
print(type(res))
print("----------------------------------------")
html = res.text
print(html)   
print("----------------------------------------")
ret_dict = {} 
parser = BeautifulSoup(html, "html.parser") 
ret_dict["title"] = parser.title.string 
ret_dict["date"] = parser.find('dl', class_="date").find('dd').text.strip() 
ret_dict["writer"] = parser.find('div', class_="writer").text.strip() 
ret_dict["body"] = parser.find('div', class_="contentBody").text.replace("\r\n", " ").strip()
 
for key, value in ret_dict.items(): 
    print(key, ":", value)


