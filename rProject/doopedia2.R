library(rvest)
library(httr)
library(data.table)

#cocktail info
site<- "http://www.doopedia.co.kr/doopedia/theme/theme.do?_method=list&MTH_IDX_CD=18&page="
extra<-"&searchKeyword=&ListType=search&consonant="

name <-NULL
sub <- NULL
cock <- NULL 
for(i in 1:2) {
  url <- paste(site, i, sep="")
  url <- paste(url,extra,sep="")
  
  text <- read_html(url,  encoding="utf-8")
  
  #cocktail이름 
  nodes <- html_nodes(text, ".item .itemTit a")
  title <- html_text(nodes)
  
  title <-t(title)
  name <- cbind(name,title)
  
  #name 링크 주소 
  nodes <- html_nodes(text,".item .itemTit a")
  sub.url <- html_attr(nodes,"href")

  sub.url <-t(sub.url)
  sub <-cbind(sub,sub.url)

  cock <-rbind(name,sub)
  
}

cock_t <- data.frame(t(cock))
doo <-"http://www.doopedia.co.kr"
detail <- NULL


for (i in cock_t$X2){
  url <-paste(doo,i,sep="")
  text <- read_html(url, encoding = "utf-8")
  
  nodes <- html_nodes(text, ".eTit")
  name <- html_text(nodes, trim=TRUE)

  nodes <- html_nodes(text, "table.infoTableData > tbody")
  tbody <- html_text(nodes,trim=TRUE)
  
  
  nodes <-html_nodes(text,"table.infoTableData > tbody th")
  th <- html_text(nodes,trim=TRUE)
  
  nodes <-html_nodes(text, "table.infoTableData > tbody td")
  td <-html_text(nodes,trim=TRUE)
  
  tbody <- t(td)
  tbody <- data.frame(tbody)
  names(tbody) <- th
  
  #tbody<-cbind(name,tbody)
  
  nodes <-html_nodes(text,".contPapragraph1")
  p <- html_text(nodes, trim=TRUE)
  cont <- cbind(tbody,p)
  
  l <- list(detail,cont)
  detail<-as.data.frame(rbindlist(l, use.names=TRUE, fill=TRUE))

}

detail<-cbind(cock_t$X1,detail)
colnames(detail)[1]<-"cocktail"

write.csv(detail,"rProject/cocktailData.csv")

# cocktail images 저장 

for (i in cock_t$X2){
  url <-paste(doo,i,sep="")
  text <- read_html(url, encoding = "utf-8")
  
  imgs <- html_nodes(text,".bigImage > a > img")
  src <- html_attr(imgs,"src")
  
  print(src)
  
  #nodes <- html_nodes(text, ".eTit")
  #name <- html_text(nodes, trim=TRUE)
  
  #res = GET(paste(url,src,sep=""))
  #writeBin(content(res, 'raw'), paste('c:/Temp/Photo/', name, sep=""))

}
src<-data.frame(src)
