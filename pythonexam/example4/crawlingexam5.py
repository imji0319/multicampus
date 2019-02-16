# 소스코드 5번 -----------------------------------------------------------
html="""
<html>
     <head>
          <title> test web </title>
     </head>
     <body>
          <p class="ptag black"  align="center"> text contents 1 </p>
          <p class="ptag yellow" align="center"> text contents 2 </p>
          <p class="ptag red"    align="center"> text contents 3 </p>
          <img src="c:\Python34\Koala.jpg" width="500" height="300">
     </body>
</html> """

from bs4 import BeautifulSoup
bs=BeautifulSoup(html,'html.parser')
ptag=bs.find('p')
print(type(ptag))
print(ptag['class'])
print(ptag['align'])
print(ptag.attrs)