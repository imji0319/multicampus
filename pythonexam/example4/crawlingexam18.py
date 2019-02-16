# 소스코드 18번 -----------------------------------------------------------
from selenium import webdriver
 
driver = webdriver.Chrome('C:/Rstudy/selenium-server-standalone-master/bin/chromedriver')
driver.get('https://news.v.daum.net/v/20190216060301280')
 
title_data = driver.find_element_by_css_selector('html > head >title')
print(type(title_data))
print("-------------------------------------")
print(title_data.get_attribute('text'))
print(title_data.text)
print("-------------------------------------")
title_data = driver.find_element_by_css_selector('meta[property="og:site_name"]')
print(title_data.get_attribute('content'))
print("-------------------------------------")
contents = driver.find_element_by_css_selector("div#harmonyContainer")
print(contents.text)
print("-------------------------------------")
for p in contents.find_elements_by_tag_name('p'):
    print (p.text)
print("-------------------------------------")   
nav = driver.find_element_by_css_selector("div[role='navigation']")
print(nav.text)
driver.quit()