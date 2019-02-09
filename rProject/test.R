url <- "http://www.doopedia.co.kr/doopedia/master/master.do?_method=view&MAS_IDX=101013000879839"

text <- read_html(url, encoding = "utf-8")
text
imgs <- html_nodes(text,".bigImage a img")
imgs
src <- html_attr(imgs,'src')
src


h = read_html('http://unico2013.dothome.co.kr/productlog.html')
imgs = html_nodes(h, 'img')       #이미지 속성 img
img.src = html_attr(imgs, 'src') 
