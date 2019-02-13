
# daum 백과 사전 imag  다운 받기 


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

for (i in 1:5){
  
  url <- paste(site,i,sep="")
  text <- read_html(url,encoding="utf-8")
  
  imgs <- html_nodes(text,'.thumb_register img')
  img.src <- html_attr(imgs,'src')

  for (i in 1:length(img.src)){
  
    res = GET(img.src[i])
  
    writeBin(content(res, 'raw'), paste('c:/Temp/photo/', name[i], sep=""))
  
}

}
