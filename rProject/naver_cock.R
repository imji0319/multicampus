library(rvest)
library(httr)

site<- "https://terms.naver.com/list.nhn?searchId=au4064&page="

cock <-NULL
for(i in 1:110) {
  url <- paste(site, i, sep="")
  text <- read_html(url,  encoding="utf-8")
  
  #cocktail이름 
  nodes <- html_nodes(text, ".content_list .title a:not(.btn_txt)")
  title <- html_text(nodes)
  title <- gsub("\r\n", "", title)
  title <- gsub("\t", "", title)
  title <- gsub("담기", "", title)
  
  #cocktail related 
  nodes <- html_nodes(text,"div.related:not(.v2) > .iner")
  kinds <- html_text(nodes, trim=TRUE)
  kinds
  page <- cbind(title,kinds)
  
  
  nodes <- html_nodes(text,".contents_list > .title > a")
  sub.url <- html_attr(nodes,"href")
  
  sub_text <-read_html(sub.url, encoding="utf-8")
  sub_node <-html_nodes(sub_text,".txt")
  contents <-html_text(sub_node)
  
  
  cock <- rbind(cock, page)
  
}

library(dplyr)

cock<-data.frame(cock)

test<-cock[grepl("칵테일",cock$kinds),]

