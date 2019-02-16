# 소스코드 9번 -----------------------------------------------------------
from urllib.request import urlopen
from bs4 import BeautifulSoup

html = urlopen('https://music.bugs.co.kr/chart')
soup = BeautifulSoup(html, "html.parser")
list_song = soup.find_all(name="p", attrs={"class":"title"})
list_artist = soup.find_all(name="p", attrs={"class":"artist"})

# 곡명 추출
for index in range(0, len(list_song)):
    title = list_song[index].find('a').text
    print(index+1, ' : ', title)
    if index == 100:
        break

# 피처링 제거
for index in range(0, len(list_song)):
    title = list_song[index].find('a').text
    print(index+1, ' : ', title.split("(")[0])
    if index == 100:
        break

# csv로 저장
import csv

with open('melon_chart.csv', 'w', encoding='utf-8') as file:
    writer = csv.writer(file, delimiter=',')
    writer.writerow(['rank', 'song', 'artist'])
    for index in range(0, len(list_song)):
        title = list_song[index].find('a').text
        artist = list_artist[index].find('a').text
        writer.writerow([index+1, title, artist])
        if index == 100:
            break