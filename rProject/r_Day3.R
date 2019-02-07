install.packages("RSelenium")
install.packages("rvest")
install.packages("httr")
install.packages("XML")

# 단일 페이지(rvest 패키지 사용)
install.packages("rvest"); 
library(rvest)
url<- "http://movie.naver.com/movie/point/af/list.nhn?page=1"
text <- read_html(url,  encoding="CP949")
# 영화제목
nodes <- html_nodes(text, ".movie")
title <- html_text(nodes)
# 영화평점
nodes <- html_nodes(text, ".point")
point <- html_text(nodes)
# 영화리뷰
nodes <- html_nodes(text, ".title")
review <- html_text(nodes, trim=TRUE)
review
review <- gsub("\t", "", review)
review <- gsub("\r\n", "", review)
review <- gsub("신고", "", review); review
page <- cbind(title, point)
page <- cbind(page, review)
write.csv(page, "movie_reviews.csv")

# 여러 페이지
site<- "http://movie.naver.com/movie/point/af/list.nhn?page="
movie.review <- NULL
for(i in 1: 100) {
  url <- paste(site, i, sep="")
  text <- read_html(url,  encoding="CP949")
  nodes <- html_nodes(text, ".movie")
  title <- html_text(nodes)
  nodes <- html_nodes(text, ".point")
  point <- html_text(nodes)
  nodes <- html_nodes(text, ".title")
  review <- html_text(nodes, trim=TRUE)
  review <- gsub("\t", "", review);  review <- gsub("\r\n", "", review)
  review <- gsub("신고", "", review)
  page <- cbind(title, point)
  page <- cbind(page, review)
  movie.review <- rbind(movie.review, page)
}
write.csv(movie.review, "movie_reviews2.csv")

# 한국일보 페이지(XML 패키지 사용)
install.packages("XML")
library(XML)
t <- htmlParse("http://hankookilbo.com")
content<- xpathSApply(t,"//p[@class='title']", xmlValue); 
Content
content <- gsub("[[:punct:][:cntrl:]]", "", content)
content
content <- trimws(content)
content


# 동적 스크래핑

install.packages("RSelenium")
library(RSelenium)


# 자바스크립트가 자동 생성하는 댓글 읽어 오기 : 신라스테이 호텔 

remDr$navigate("https://www.agoda.com/ko-kr/shilla-stay-seocho/hotel/seoul-kr.html?cid=-204")
more<-remDr$findElements(using='css','#SearchBoxContainer > div > div > div.Popup__container.Popup__container--garage-door > div > div > div.AlertMessage.CalendarAlertMessage > a')
sapply(more,function(x){x$clickElement()})
doms <- remDr$findElements(using = "css selector", ".Review-comment-bodyText")
sapply(doms, function (x) {x$getElementText()})


# 링크 클릭으로 AJAX 로 처리되는 네이버 웹툰 댓글 읽어 오기
repl_v = NULL;
url<-'http://comic.naver.com/comment/comment.nhn?titleId=570503&no=135'
remDr$navigate(url)
doms1<-remDr$findElements(using ="css selector","ul.u_cbox_list span.u_cbox_contents")
p_repl <- sapply(doms1,function(x){x$getElementText()})
p_repl_v <- unlist(p_repl)
more<-remDr$findElements(using='css','span.u_cbox_in_view_comment')
sapply(more,function(x){x$clickElement()})
doms2<-remDr$findElements(using ="css selector","ul.u_cbox_list span.u_cbox_contents")
repl <-sapply(doms2,function(x){x$getElementText()})
repl_v <- c(repl_v, unlist(repl))

repeat {
  for (i in 4:12) {               
    nextCss <- paste("#cbox_module>div>div.u_cbox_paginate>div> a:nth-child(",i,") > span", sep="")                
    try(nextPage<-remDr$findElements(using='css',nextCss))
    if(length(nextPage) == 0)   break;
    sapply(nextPage,function(x){x$clickElement()})
    Sys.sleep(1)
    doms3<-remDr$findElements(using ="css selector","ul.u_cbox_list span.u_cbox_contents")
    repl <-sapply(doms3,function(x){x$getElementText()})
    repl_v <- c(repl_v, unlist(repl))                
  }
  
  try(nextPage<-remDr$findElements(using='css',
                                   "#cbox_module > div > div.u_cbox_paginate > div > a:nth-child(13) > span.u_cbox_cnt_page"))
  if(length(nextPage) == 0)  break;
  sapply(nextPage,function(x){x$clickElement()})
  Sys.sleep(1)
  doms2<-remDr$findElements(using ="css selector","ul.u_cbox_list span.u_cbox_contents")
  repl <-sapply(doms2,function(x){x$getElementText()})
  repl_v <- c(repl_v, unlist(repl))        
}
print(repl_v)
write(repl_v, "webtoon.txt")



# YES24 명견만리 댓글

# 첫 페이지 5개
library(RSelenium)
remDr<-remoteDriver(remoteServerAddr = "localhost", port=4445, browserName="chrome")
remDr$open()
site <- paste("http://www.yes24.com/24/goods/40936880")
remDr$navigate(site)
webElem <- remDr$findElement("css", "body")
remDr$executeScript("scrollTo(0, document.body.scrollHeight-200)", args = list(webElem))
remDr$executeScript("scrollBy(0, 2000)", args = list(webElem))
Sys.sleep(1)
remDr$executeScript("scrollBy(0, 2000)", args = list(webElem))
Sys.sleep(1)
remDr$executeScript("scrollBy(0, 2000)", args = list(webElem))
Sys.sleep(1)
remDr$executeScript("scrollBy(0, 1000)", args = list(webElem))
Sys.sleep(3)
repl_v = NULL
for(index in 1:5) {
  fullContentLinkCSS <- paste('#PartContent', index, sep='')
  fullContentLink<-remDr$findElements(using='css',  fullContentLinkCSS)
  print(fullContentLink)
  if (length(fullContentLink) == 0) {
    endFlag <- TRUE
    break
  }
  sapply(fullContentLink,function(x){x$clickElement()})      
  Sys.sleep(1)
  fullContentCSS <- paste('#FullContent', index, sep='')
  fullContent<-remDr$findElements(using='css', fullContentCSS)
  #print(fullContent)
  repl <-sapply(fullContent,function(x){x$getElementText()})    
  #print(repl)
  repl_v <- c(repl_v, unlist(repl))
}
repl_v



# 모든 페이지
library(RSelenium)
remDr<-remoteDriver(remoteServerAddr = "localhost", port=4445, browserName="chrome")
remDr$open()
site <- paste("http://www.yes24.com/24/goods/40936880")
remDr$navigate(site)
webElem <- remDr$findElement("css", "body")
#remDr$executeScript("scrollTo(0, document.body.scrollHeight-200)", args = list(webElem))
remDr$executeScript("scrollBy(0, 2000)", args = list(webElem))
Sys.sleep(1)
remDr$executeScript("scrollBy(0, 2000)", args = list(webElem))
Sys.sleep(1)
remDr$executeScript("scrollBy(0, 2000)", args = list(webElem))
Sys.sleep(1)
remDr$executeScript("scrollBy(0, 1000)", args = list(webElem))
Sys.sleep(3)
repl_v = NULL
endFlag <- FALSE
page <- 3
repeat {
  for(index in 1:5) {
    fullContentLinkCSS <- paste('#PartContent', index, sep='')
    fullContentLink<-remDr$findElements(using='css',  fullContentLinkCSS)
    #print(fullContentLink)
    if (length(fullContentLink) == 0) {
      endFlag <- TRUE
      break
    }
    sapply(fullContentLink,function(x){x$clickElement()})      
    Sys.sleep(1)
    fullContentCSS <- paste('#FullContent', index, sep='')
    fullContent<-remDr$findElements(using='css', fullContentCSS)
    #print(fullContent)
    repl <-sapply(fullContent,function(x){x$getElementText()})    
    #print(repl)
    repl_v <- c(repl_v, unlist(repl))
  }
  if(endFlag)
    break;#Div_Review > p:nth-child(11) > a:nth-child(4)
  
  page <- page+1;
  if(page == 5)
    page <- page+1;
  nextPageCSS <- paste("#Div_Review > p:nth-child(11) > a:nth-child(",page,")",sep="")
  nextPageLink<-remDr$findElements(using='css',nextPageCSS)  
  if(page == 14)
    page<-3
  sapply(nextPageLink,function(x){x$clickElement()})  
  Sys.sleep(5)
  remDr$executeScript("scrollBy(0, -3000)", args = list(webElem))
  #print(page)
}
write(repl_v, "yes24.txt")

# 정규표현식 사용

word <- "JAVA javascript 가나다 123 %^&*"
gsub("A", "", word) 
gsub("a", "", word) 
gsub("[Aa]", "", word) 
gsub("[가-힣]", "", word) 
gsub("[^가-힣]", "", word) 
gsub("[&^%*]", "", word) 
gsub("[[:punct:]]", "", word) 
gsub("[[:alnum:]]", "", word) 
gsub("[1234567890]", "", word) 
gsub("[[:digit:]]", "", word) 
gsub("[^[:alnum:]]", "", word) 
gsub("[[:space:]]", "", word) 


