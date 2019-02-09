

# R과 Oacle 연동
install.packages("DBI");library(DBI)
install.packages("RJDBC");library(RJDBC)

drv <- JDBC("oracle.jdbc.driver.OracleDriver","C:/Users/student/Documents/multicampus/rProject/ojdbc6.jar")

conn <- dbConnect(drv,"jdbc:oracle:thin:@localhost:1521:xe","javatest","javatest")
conn

result1<-dbReadTable(conn,"VISITOR") # DB에서 table정보 dataframe으로 가져오기 - 테이블명 대문자!
str(result1)


# 테이블에 데이터 저장하기
# 방법 1 : dbWriteTable - 테이블 추가 + 데이터 저장 
## colname , data 
dbWriteTable(conn,"book1",data.frame(bookname=c("자바의 정석","하둡 완벽 입문","이것이 리눅스다"),
                                     price=c(30000,25000,32000)))

dbWriteTable(conn,"cars",head(cars,3))  # cars 내장된 데이터 셋 

# 방법 2 : dbSendUpdate - 데이터 추가 
dbSendUpdate(conn, "INSERT INTO VISITOR VALUES 
             ('R언어', sysdate, 'R언어로 데이터를 입력해요', visitor_seq.nextval)")

dbSendUpdate (conn, "INSERT INTO VISITOR VALUES 
              ('하둡', sysdate, '대용량 데이터 분산저장&처리기술', visitor_seq.nextval)")

dbReadTable(conn,"VISITOR")

# 데이터 수정 : dbSendUpdate
dbSendUpdate(conn,"INSERT INTO cars(speed, dist) VALUES(1,1)")
dbSendUpdate(conn,"INSERT INTO cars(speed, dist) VALUES(2,2)")
dbReadTable(conn,"CARS")

dbSendUpdate(conn,"UPDATE CARS SET DIST =DIST*100 WHERE SPEED =1")
dbReadTable(conn,"CARS")

dbSendUpdate(conn,"UPDATE CARS SET DIST =DIST*3 WHERE SPEED =1")
dbReadTable(conn,"CARS")

# 테이블 삭제
dbRemoveTable(conn,"CARS")

#######################다양한 DB 연동 예제들##################################

# 예제 1
df <- read.table("rProject/datafile/product_click.log",stringsAsFactors = F)

names(df) <-c("click_time","pid")
df$click_time <- as.character(df$click_time) # 시간 -> 문자열 처리 


dbWriteTable(conn,"productlog",df)
result4 <-dbReadTable(conn,"PRODUCTLOG")
result4


# 예제 2
dbWriteTable(conn,"mtcars",mtcars)

#select 등 조회 : dbSendQuery
rs <- dbSendQuery(conn,"SELECT*FROM mtcars WHERE cyl=4")
dbFetch(rs)
dbClearResult(rs)

rs <- dbSendQuery(conn,"SELECT*FROM mtcars")
ret1<- dbFetch(rs,10) #dbFetch : 끊어서 확인하는 것으로 한번 조회하면 안나옴 
ret1
ret2<- dbFetch(rs)
ret2
ret3<-dbFetch(rs)     #이미 모두 조회 했기 때문에 조회결과 없음 
ret3
dbClearResult(rs)

nrow(ret1)
nrow(ret2)
