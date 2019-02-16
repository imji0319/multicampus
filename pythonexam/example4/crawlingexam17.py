# 소스코드 17번 -----------------------------------------------------------
from selenium import webdriver
from selenium.webdriver.common.keys import Keys

# setup Driver|Chrome : 크롬드라이버를 사용하는 driver 생성
driver = webdriver.Chrome('C:/Rstudy/selenium-server-standalone-master/bin/chromedriver')
driver.implicitly_wait(3) 

driver.get('http://www.google.com/ncr') 
target=driver.find_element_by_css_selector("[name = 'q']")
target.send_keys('자바')
target.send_keys(Keys.ENTER)
driver.quit()
