# 소스코드 2번 -----------------------------------------------------------
html="""
<html>
     <head>
          <title> test web </title>
     </head>
     <body>
          <p align="center"> text contents </p>
          <p align="right">  text contents 2 </p>
          <p align="left">   text contents 3 </p>
          <img src="c:\Python34\Koala.jpg" width="500" height="300">
          <div>
              <p>text contents 4 </p> 
          </div>
     </body>
</html> """

from bs4 import BeautifulSoup
bs=BeautifulSoup(html, 'html.parser')
print(bs.find('title'))
print(bs.find('p'))
print(bs.find('img'))
print("----------------------------------------------------------------------")
ptags = bs.find_all('p')
print(ptags)
for tag in ptags :
    print(tag)
print("----------------------------------------------------------------------")
body_tag = bs.find('body')
list1 = body_tag.find_all(['p','img'])

for tag in list1:
    print(tag) 
print("----------------------------------------------------------------------")
body_tag = bs.find('div')
list2 = body_tag.find_all('p')

for tag in list2:
    print(tag)