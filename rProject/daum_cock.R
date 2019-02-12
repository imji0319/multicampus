
### daum 칵테일 이름 + 특징 + 내용 크롤링 ###


library(rvest)
library(httr)
library(data.table)

site <- "http://100.daum.net/book/630/list?sort=vcnt&index=&page="

name <- NULL

#cocktail이름 
for (i in 1:5){
  url <- paste(site, i, sep="")
  
  text <- read_html(url,  encoding="utf-8")
  
  nodes <- html_nodes(text, ".link_register")
  title <- html_text(nodes)

  title <-t(title)
  name <- cbind(name,title)
  
}
name <- t(name)

#name 링크 주소 
sub <- NULL
for (i in 1:5){
  url <- paste(site, i, sep="")
  text <- read_html(url,  encoding="utf-8")

  nodes <- html_nodes(text,".link_register")
  sub.url <- html_attr(nodes,"href")
  
  sub.url <-t(sub.url)
  sub <-cbind(sub,sub.url)
  
}

sub <- t(sub)
daum_cock <- data.frame(cbind(name,sub))

daum <-"http://100.daum.net"
all<- NULL

for (i in daum_cock$X2){
  url <-paste(daum,i,sep="")
  text <- read_html(url, encoding = "utf-8")
  
  nodes <- html_nodes(text, ".txt_nowrap")
  name <- html_text(nodes, trim=TRUE)
  
  nodes <- html_nodes(text, ".list_summary tbody")
  tbody <- html_text(nodes,trim=TRUE)
  
  
  nodes <-html_nodes(text,".list_summary th")
  th <- html_text(nodes,trim=TRUE)
  
  nodes <-html_nodes(text, ".list_summary td")
  td <-html_text(nodes,trim=TRUE)
  
  tbody <- t(td)
  tbody <- data.frame(tbody)
  names(tbody) <- th
  
  l <- list(all,tbody)
  all<-as.data.frame(rbindlist(l, use.names=TRUE, fill=TRUE))
  
}

daum<-cbind(daum_cock$X1,all)
write.csv(daum,"rProject/datafile/daum_cock.csv")



