# 소스코드 3번 -----------------------------------------------------------
html="""
<html>
     <head>
          <title> test web </title>
     </head>
     <body>
          <p align="center"> text contents </p>
          <p align="right" class="myp">  text contents 2 </p>
          <p align="left" a="b">   text contents 3 </p>
          <img src="c:\Python34\Koala.jpg" width="500" height="300">
     </body>
</html> """

from bs4 import BeautifulSoup
bs=BeautifulSoup(html, 'html.parser')
print(bs.find('p', align="center"))
print(bs.find('p', align="right", class_="myp"))
print(bs.find('p', align="left"))
print("-------------------------------------")
print(bs.find('p', attrs={"align":"center"}))
print(bs.find('p', attrs={"align":"right", "class":"myp"}))
print(bs.find('p', attrs={"align":"left"}))