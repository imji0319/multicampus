# 소스코드 14번 -----------------------------------------------------------
from bs4 import BeautifulSoup
import urllib.request
import re 

for n in range(0,10):
        #클리앙의 중고장터 주소 
        data ='https://www.clien.net/service/board/sold?&od=T31&po=' + str(n)
        req = urllib.request.Request(data)
        data = urllib.request.urlopen(req).read()
        page = data.decode('utf-8', 'ignore')
        soup = BeautifulSoup(page, 'html.parser')
        list1 = soup.findAll('a', attrs={'class':'list_subject'})

        for item in list1:
                try:                    
                    span = item.contents[1]
                    span2 = span.nextSibling.nextSibling
                    title = span2.text 
                    if (re.search('아이폰', title)):
                        print(title.strip())
                        print('https://www.clien.net'  + item['href'])
                except:
                        pass
        

