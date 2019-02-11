# R과 Oacle 연동
library(DBI)
library(RJDBC)
library(ggplot2)

drv <- JDBC("oracle.jdbc.driver.OracleDriver","C:/Users/student/Documents/multicampus/rProject/ojdbc6.jar")

conn <- dbConnect(drv,"jdbc:oracle:thin:@localhost:1521:xe","javatest","javatest")
conn


df <- read.csv("rProject/cocktailData.csv",stringsAsFactors = F)

names(df)[1] <- "cock_id"

summary(df)

cock <- df[,c(1,2,3,4,8,9)]

names(cock) <- c("cock_id","cockname","alcohol","base","taste","contents")
write.csv(cock,"rProject/cocktailData2.csv")

#DB에 저장 

#dbWriteTable(conn,"cocktail",df)
#db_cock <-dbReadTable(conn,"COCKTAIL")

cock$sweet <- 0  
cock$sour <- 0 

bin <- as.data.frame(table(cock$taste))

