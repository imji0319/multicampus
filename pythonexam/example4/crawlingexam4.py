# 소스코드 1번 -----------------------------------------------------------
html="""
<html>
     <head>
          <title> test web </title>
     </head>
     <body>
          <p align="center">     text contents </p>
          <img src="c:\Python34\Koala.jpg" width="500" height="300">
     </body>
</html> """

from bs4 import BeautifulSoup
bs=BeautifulSoup(html, 'html.parser')

ptag=bs.find('p')

print(ptag.name)
print("----------------------------------------")
print(ptag.string)
print(ptag.string.strip())
print("----------------------------------------")
print(ptag.text)
print(ptag.text.strip())
print("----------------------------------------")
print(ptag.get_text(strip=True))