# 소스코드 11번 -----------------------------------------------------------
from urllib.request import urlopen
from bs4 import BeautifulSoup
import re

base_url = 'http://news.naver.com/main/list.nhn?mode=LS2D&mid=shm&sid1=100&sid2=269'
req = urlopen(base_url)
html = req.read()
soup = BeautifulSoup(html, 'html.parser')
newslist = soup.find(name="div", attrs={"class":"list_body"})
newslist_atag = newslist.find_all('a')
content_list = []
company_list = []
for a in newslist_atag:
    content=a.get_text(strip=True)      
    content=re.sub('동영상기사', '', content)
    if len(content) != 0 :   
        content_list.append(content)
        
newslist_spantag = newslist.find_all('span', attrs={"class":"writing"})  
for span in newslist_spantag:
    company_list.append(span.get_text(strip=True))      

print(len(content_list))
print(len(company_list))

import pandas as pd
data = {'company' : company_list, 'content' : content_list}
df = pd.DataFrame(data)
print(df)