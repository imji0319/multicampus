

# R과 Oacle 연동

#install.packages("DBI");
library(DBI)
#install.packages("RJDBC");
library(RJDBC)


drv <- JDBC("oracle.jdbc.driver.OracleDriver","C:/Users/student/Documents/multicampus/rProject/ojdbc6.jar")

conn <- dbConnect(drv,"jdbc:oracle:thin:@70.12.111.101:1521:xe","NA","NA")
conn

cockTable <- read.csv("rProject/datafile/cocktaildata.csv")
dbWriteTable(conn,"cocktail",cockTable)
