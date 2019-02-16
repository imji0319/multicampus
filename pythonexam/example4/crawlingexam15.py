# 소스코드 15번 -----------------------------------------------------------
from bs4 import BeautifulSoup
doc = ['<html><head><title>Page title</title></head>', \
    '<body><p id="firstpara" align="center">This is paragraph <b>one</b></p>', \
    '<p id="secondpara" align="blah">This is a paragraph <b>two</b></p>', '</html>']

soup = BeautifulSoup("".join(doc), 'html.parser')

import re
tagsStartingWithB = soup.findAll(re.compile('^b'))
for tag in tagsStartingWithB :
    print(tag.name)

tagsEndingId = soup.find_all(id=re.compile("para$"))
for tag in tagsEndingId :
    print(tag.name)


