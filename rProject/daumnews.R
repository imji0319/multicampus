#다음 뉴스 랭킹 
library(rvest)

url<- "http://media.daum.net/ranking/popular/"
text <- read_html(url,  encoding="utf-8")

#뉴스제목 
nodes <- html_nodes(text, ".list_news2 .tit_thumb> .link_txt")
newstitle <- html_text(nodes,trim=TRUE)

#신문사
nodes <- html_nodes(text, ".list_news2 .tit_thumb> .info_news")
newspapername <- html_text(nodes,trim=TRUE)

newstitle<-gsub("\n", "", newstitle) 

newstitle
newspapername
page <- cbind(newspapername, newstitle)
str(page)
write.csv(page,"190207_daumnews.csv")
