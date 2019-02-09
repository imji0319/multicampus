library(rvest)
library(httr)

site<- "http://www.doopedia.co.kr/doopedia/master/master.do?_method=view&MAS_IDX=101013000804708"


text <- read_html(site,  encoding="utf-8")

nodes <- html_nodes(text, ".eTit")
name <- html_text(nodes)

nodes <- html_nodes(text, "table.infoTableData > tbody")
tbody <- html_text(nodes)

nodes <-html_nodes(text,"table.infoTableData > tbody th")
th <- html_text(nodes)

nodes <-html_nodes(text,".contPapragraph1 p")
p <- html_text(nodes, trim=TRUE)
p<-data.frame(p)



