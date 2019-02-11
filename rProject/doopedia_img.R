
### doopedia 칵테일 이름 + 특징 + 내용 크롤링 ###

install.packages("RSelenium")
library(RSelenium)
remDr<-remoteDriver(remoteServerAddr = "localhost", port=4445, browserName="chrome")
remDr$open()
site<- "http://www.doopedia.co.kr/doopedia/theme/theme.do?_method=list&MTH_IDX_CD=18&page="
extra<-"&searchKeyword=&ListType=search&consonant="

for (i in 1:13){
  remDr$navigate(site)
  webElem <- remDr$findElement("css", ".bigImage img")

  
}
