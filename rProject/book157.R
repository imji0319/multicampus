library(ggplot2)
library(dplyr)

fuel <- data.frame(fl = c("c","d","e","p","r"),
                   price_fl = c(2.35,2.38,2.11,2.76,2.22),
                   stringsAsFactors = F)   #stringsAsFactors = F : 문자를 factor 타입으로 변환하지 않도록 설정 

fuel
mpg <- as.data.frame(ggplot2::mpg)

#Q1
mpg<-left_join(mpg, fuel, by = "fl")
head(mpg)

#Q2
mpg %>% select(model, fl, price_fl) %>% head(5)
