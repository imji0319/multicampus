# 소스코드 13번 -----------------------------------------------------------
import requests
from bs4 import BeautifulSoup
import re
req = requests.get('http://movie.naver.com/movie/point/af/list.nhn?page=1')
html = req.text
soup = BeautifulSoup(html, 'html.parser')
titles = soup.select('.movie' )
points = soup.select('.point' )
reviews = soup.select('.title:not(.movie)' )
movie_title = []
movie_point = []
movie_review = [] 
for dom in titles:
    movie_title.append(dom.text)
for dom in points:
    movie_point.append(dom.text)
for dom in reviews:
    content = dom.text
    content=re.sub("신고", '', content)
    content=re.sub("[\n\t]", '', content)
    movie_review.append(content)
    
import pandas as pd

data = {'point' : movie_point, 'title' : movie_title,  'review' : movie_review}
df = pd.DataFrame(data)
print(df)
df.to_csv('myDataFrame.csv')