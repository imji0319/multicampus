getwd()
setwd("C:/Users/student/Documents/multicampus/rProject")


# httr 패키지 사용 - GET 방식 요청
install.packages("httr")
library(httr)
library(rvest)
http.standard <- GET('http://www.w3.org/Protocols/rfc2616/rfc2616.html')  #get 함수 호출 
title2 = html_nodes(read_html(http.standard), 'div.toc h2')
title2 = html_text(title2)
title2
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
# httr 패키지 사용 - POST 방식 요청
library(httr)
library(rvest)
# POST 함수를 이용해 모바일 게임 랭킹 10월 29일 주  모바일 게임 랭킹을 찾는다
#(http://www.gevolution.co.kr/score/gamescore.asp?t=3&m=0&d=week) 
game = POST('http://www.gevolution.co.kr/score/gamescore.asp?t=3&m=0&d=week',  #post 함수 호출 
            encode = 'form', body=list(txtPeriodW = '2019-02-04'))
title2 = html_nodes(read_html(game), 'a.tracktitle')
title2 = html_text(title2)
title2[1:10]


# 뉴스, 게시판 등 글 목록에서 글의 URL만 뽑아내기 
res = GET('https://news.naver.com/main/list.nhn?mode=LSD&mid=sec&sid1=001')
htxt = read_html(res)
link = html_nodes(htxt, 'div.list_body a')
article.href = unique(html_attr(link, 'href'))  #unique : 중복제거 
article.href

# 이미지, 첨부파일 다운 받기 
# pdf
res = GET('http://cran.r-project.org/web/packages/httr/httr.pdf')
writeBin(content(res, 'raw'), 'c:/Temp/httr.pdf')

# jpg
h = read_html('http://unico2013.dothome.co.kr/productlog.html')
imgs = html_nodes(h, 'img')       #이미지 속성 img
img.src = html_attr(imgs, 'src')  
for(i in 1:length(img.src)){
  res = GET(paste('http://unico2013.dothome.co.kr/',img.src[i], sep=""))
  writeBin(content(res, 'raw'), paste('c:/Temp/', img.src[i], sep=""))
} 



# 네이버 블로그 연동 : Rcurl 패키지 사용 
install.packages("RCurl")
library(RCurl)
library(XML)
searchUrl<- "https://openapi.naver.com/v1/search/blog.xml"
Client_ID <- "izGsqP2exeThwwEUVU3x"
Client_Secret <- "WrwbQ1l6ZI"
query <- URLencode(iconv("여름추천요리","euc-kr","UTF-8"))   #URLencode : url code로 변경시킴 
url<- paste(searchUrl, "?query=", query, "&display=20", sep="")
doc<- getURL(url, httpheader = c('Content-Type' = "application/xml",
                                 'X-Naver-Client-Id' = Client_ID,'X-Naver-Client-Secret' = Client_Secret))

# 블로그 내용에 대한 리스트 만들기		
doc2 <- htmlParse(doc, encoding="UTF-8")
text<- xpathSApply(doc2, "//item/description", xmlValue)
text

# 네이버 뉴스 연동 : Rcurl 패키지 사용 
library(RCurl)
library(XML)
searchUrl<- "https://openapi.naver.com/v1/search/news.xml"
Client_ID <- "izGsqP2exeThwwEUVU3x"
Client_Secret <- "WrwbQ1l6ZI"
query <- URLencode(iconv("미세먼지","euc-kr","UTF-8"))
url<- paste(searchUrl, "?query=", query, "&display=20", sep="")
doc<- getURL(url, httpheader = c('Content-Type' = "application/xml",
                                 'X-Naver-Client-Id' = Client_ID,'X-Naver-Client-Secret' = Client_Secret))
# 블로그 내용에 대한 리스트 만들기		
doc2 <- htmlParse(doc, encoding="UTF-8")
text<- xpathSApply(doc2, "//item/description", xmlValue); 
text

# 트위터 글 읽어오기
install.packages("twitteR")
library(twitteR) 
api_key <- "gjUkHgO8bFmNobRk4g0Jas8xb"
api_secret <- "loF0mtnzLhtQDFjahdRHox6wcR1fiD6Fw95DP5QCSy3rLTTP1K"
access_token <- "607145164-8L5HtzopZzhjuBCgusUGKE3MHOa9P4RbmhUrM0E1"
access_token_secret <- "2wn2bsCA7JIH5DZ5Ss1deS5BNLabzaX2xSpM2ZLMIqwQf"
setup_twitter_oauth(api_key,api_secret, access_token,access_token_secret)

# oauth 정보 저장 확인
key <- "취업"
key <- enc2utf8(key)
result <- searchTwitter(key, n=100)
DF <- twListToDF(result)
str(DF)
content <- DF$text
content <- gsub("[[:lower:][:upper:][:digit:][:punct:][:cntrl:]]", "", content)   
content

#실시간 버스 
install.packages("XML")
library(XML)
API_key  <- "%2BjzsSyNtwmcqxUsGnflvs3rW2oceFvhHR8AFkM3ao%2Fw50hwHXgGyPVutXw04uAXvrkoWgkoScvvhlH7jgD4%2FRQ%3D%3D"
bus_No <- "402"
url <- paste("http://ws.bus.go.kr/api/rest/busRouteInfo/getBusRouteList?ServiceKey=", API_key, "&strSrch=", bus_No, sep="")
url
doc <- xmlParse(url)
top <- xmlRoot(doc)
top
df <- xmlToDataFrame(getNodeSet(doc, "//itemList"))
df
str(df)
busRouteId <- df$busRouteId
busRouteId
url <- paste("http://ws.bus.go.kr/api/rest/buspos/getBusPosByRtid?ServiceKey=", API_key, "&busRouteId=", busRouteId, sep="")
doc <- xmlParse(url)
top <- xmlRoot(doc); top
df <- xmlToDataFrame(getNodeSet(doc, "//itemList"))
df





# 기본 시각화 API 학습

국어<- c(4,7,6,8,5,5,9,10,4,10)  
plot(국어)

plot(국어, type="o", col="blue")       
title(main="성적그래프", col.main="red", font.main=4) 

국어 <- c(4,7,6,8,5,5,9,10,4,10)
수학 <- c(7,4,7,3,8,10,4,10,5,7)

plot(국어, type="o", col="blue")
lines(수학, type="o", pch=16, lty=2, col="red")     
title(main="성적그래프", col.main="red", font.main=4)

국어 <- c(4,7,6,8,5,5,9,10,4,10)
par(mar=c(1,1,1,1), mfrow=c(4,2))

plot(국어, type="p", col="blue", main="type = p", xaxt="n", yaxt="n")
plot(국어, type="l", col="blue", main="type = l", xaxt="n", yaxt="n")
plot(국어, type="b", col="blue", main="type = b", xaxt="n", yaxt="n")
plot(국어, type="c", col="blue", main="type = c", xaxt="n", yaxt="n")
plot(국어, type="o", col="blue", main="type = o", xaxt="n", yaxt="n")
plot(국어, type="h", col="blue", main="type = h", xaxt="n", yaxt="n")
plot(국어, type="s", col="blue", main="type = s", xaxt="n", yaxt="n")
plot(국어, type="S", col="blue", main="type = S", xaxt="n", yaxt="n")

국어 <- c(4,7,6,8,5,5,9,10,4,10); 
수학 <- c(7,4,7,3,8,10,4,10,5,7)
par(mar=c(5,5,5,5), mfrow=c(1,1))
plot(국어, type="o", col="blue", ylim=c(0,10), axes=FALSE, ann=FALSE) 

# x, y 축 추가하기
axis(1, at=1:10, lab=c("01","02","03","04", "05","06","07","08","09","10")) # x축 추가
axis(2, at=c(0,2,4,6,8,10))  # y축 추가

# 그래프 추가하고, 그래프에 박스 그리기
lines(수학, type="o", pch=16, lty=2, col="red")    
box()   # 박스 그리기

# 그래프 제목, 축의 제목, 범례 나타내기
title(main="성적그래프", col.main="red", font.main=4) 
title(xlab="학번", col.lab=rgb(0,1,0)) title(ylab="점수", col.lab=rgb(1,0,0)) 
legend(1, 10, c("국어","수학"), cex=0.8, col=c("blue","red"), pch=c(16,21), lty=c(1,2))  


(성적 <- read.table("성적.txt", header=TRUE));

plot(성적$학번, 성적$국어, main="성적그래프", xlab="학번", ylab="점수",  xlim=c(0, 11), ylim=c(0, 11)) 

ymax <- max(성적[3:5]) #성적 데이터 중에서 최대값을 찾는다(y 축의 크기 제한)
ymax
pcols<- c("red","blue","green")
png(filename="성적.png", height=400, width=700, bg="white") # 출력을 png파일로 설정
plot(성적$국어, type="o", col=pcols[1], ylim=c(0, ymax), axes=FALSE, ann=FALSE)
axis(1, at=1:10, lab=c("01","02","03","04","05","06","07","08","09","10"))
axis(2, at=0:5, lab=c(0,2,4,6,8,10))
box()
lines(성적$수학, type="o", pch=16, lty=2, col=pcols[2])
lines(성적$영어, type="o", pch=23, lty=3, col=pcols[3] )
title(main="성적그래프", col.main="red", font.main=4)
title(xlab="학번", col.lab=rgb(1,0,0))
title(ylab="점수", col.lab=rgb(0,0,1))
legend(1, ymax, names(성적)[-1], cex=0.8, col=pcols, pch=c(21,16,23), lty=c(1,2,3))
dev.off()

# 막대그래프 그리기

barplot(국어)

coldens <- seq(from=10, to=100, by=10)   # 막대그래프의 색밀도 설정을 위한 벡터
xname <- 성적$학번                                         # X 축 값 설정위한  벡터
barplot(성적$국어, main="성적그래프", xlab="학번", ylab="점수", border="red", col="green", density=coldens, names.arg=xname)

# 학생의 각 과목에 대한 각각의 점수에 대한 그래프
성적1<- 성적[3:5]                                           
barplot(as.matrix(성적1), main="성적그래프", ylab="점수", beside=TRUE, col=rainbow(10))


# 학생의 각 과목에 대한 합계 점수에 대한 그래프
xname <- 성적$학번;    #  x축 레이블용 벡터
par(xpd=T, mar=par()$mar+c(0,0,0,4));   # 우측에 범례가 들어갈 여백을 확보
barplot(t(성적1), main="성적그래프", ylab="점수", col=rainbow(3), space=0.1, cex.axis=0.8, names.arg=xname, cex=0.8)
legend(11,30, names(성적1), cex=0.8, fill=rainbow(3));

# 학생의 각 과목에 대한 합계 점수에 대한 그래프(가로막대 그래프)
xname <- 성적$학번;    #  x축 레이블용 벡터
barplot(t(성적1), main="성적그래프", ylab="학번", col=rainbow(3), space=0.1, cex.axis=0.8, names.arg=xname, cex=0.8, horiz=T);
legend(30,11, names(성적1), cex=0.8, fill=rainbow(3));

# 히스토그램
hist(성적$국어, main="성적분포-국어", xlab="점수", breaks=5, col = "lightblue", border = "pink")
hist(성적$수학, main="성적분포-수학", xlab="점수", col = "lightblue", border = "pink")
hist(성적$국어, main="성적분포-국어", xlab="점수", ylab="도수", col=rainbow(12), border = "pink")

nums <- sample(1:100, 30)
hist(nums)
hist(nums, breaks=c(0,33,66,100))


# 파이그래프
(성적 <- read.table("성적.txt", header=TRUE));
pie(성적$국어, labels=paste(성적$성명, "-", 성적$국어), col=rainbow(10))
pie(성적$국어, labels=paste(성적$성명, "-", 성적$국어), col=rainbow(10), main="국어성적", edges=10)
pie(성적$국어, labels=paste(성적$성명,"\n","(",성적$국어,")"), col=rainbow(10))




# 박스플롯
summary(성적$국어)
boxplot(성적$국어, col="yellow",  ylim=c(0,10), xlab="국어", ylab="성적")


성적2 <- 성적[,3:5]
boxplot(성적2, col=rainbow(3), ylim=c(0,10), ylab="성적")

data <- read.table("온도.txt", header=TRUE, sep=",")
head(data, n=5); 
boxplot(data)
boxplot(data, las = 2)
boxplot(data, las = 2, at = c(1,2,3,4, 6,7,8,9, 11,12,13,14))
chtcols = rep(c("red","sienna","palevioletred1","royalblue2"), times=3)
chtcols
boxplot(data, las = 2, at = c(1,2,3,4, 6,7,8,9, 11,12,13,14), col=chtcols)
grid(col="gray", lty=2, lwd=1)

rainbow()
heat.colors()
terrain.colors()
topo.colors()
cm.colors()
gray.colors()

install.packages("ggplot2")
library(ggplot2)
mpg<-as.data.frame(ggplot2::mpg)
str(mpg)
?mpg

#엑셀파일 불러오기

install.packages("readxl")
library(readxl)

df_exam <- read_excel("datafile/excel_exam.xlsx")
df_exam

df_exam_sheet <- read_excel("datafile/excel_exam_sheet.xlsx", sheet=3)
df_exam_sheet

#rename 이용 -> dplyr 패키지 설치 
install.packages("dplyr")
library(dplyr)
