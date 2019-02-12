

doopedia<-read.csv("rProject/datafile/cocktailData.csv")
daum <-read.csv("rProject/datafile/daum_cock.csv")

doopedia <- doopedia[c(1:9)]

names(doopedia) <-c("cock_id","cock_name","alcol","base","making","argu","glass","taste","contents")
doopedia <- doopedia[c(1,2,3,4,6,8,9)]


names(daum) <- c("cock_id","cock_name","kinds","alcol","making","glass","argu","argu2","deco")
daum <- daum[c(1,2,4,7,8)]


library(dplyr)

daum <- daum %>% 
  mutate( base = ifelse( grepl("보드카",argu),"보드카",
                         ifelse(grepl("진",argu),"진", 
                                ifelse(grepl("데킬라",argu),"데킬라",
                                       ifelse(grepl("와인",argu),"와인",
                                              ifelse(grepl("럼",argu),"럼",
                                                     ifelse(grepl("브랜디",argu),"브랜디",
                                                            ifelse(grepl("위스키",argu),"위스키","리큐어"
                                                                   ))))))))
                                                    
daum <- daum %>% 
  mutate( base = ifelse(is.na(argu) ,"논알콜",base))
         
table(daum$base)
write.csv(daum,"rProject/datafile/daumcock.csv")
