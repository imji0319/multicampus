getwd()          #working directory
setwd("C:/Users/student/Documents/multicampus/rProject")

#csv파일열기
score <- read.csv("score.csv")  #data.frame으로 리턴 
score
str(score)                      #데이터의 구조 
score$sum <- score$math+score$english+score$science
score$result <- ifelse(score$sum >= 200, "pass", "fail") #조건식 
score

summary(score$result)
table(score$result)             #table : 데이터 개수 
summary(factor(score$result))   #범주형 데이터에 대한 기초통계

summary(score)


#dataframe exam3
emp <- read.csv(file.choose())  #파일을 직접 선택 file.choose()
emp
str(emp)
View(emp)
?read.csv

emp <-read.csv("emp.csv", stringsAsFactors=FALSE)    
#char 기본 factor 형태로 저장 => 문자열 그대로 하고 싶을 때 stringsAsFactors=FALSE 을 주어야 

# 1. emp에서 직원 이름
emp$ename
emp[,2]             #vector 형태
emp[,"ename"]       #vector 형태
emp[,2, drop=FALSE]  #data.frame 형태로 출력 
emp[,"ename",drop=F] #data.frame 형태로 출력 
emp[2]               #data.frame 형태로 출력 
emp["ename"]         #data.frame 형태로 출력 

# 2. emp에서 직원이름, 잡, 샐러리
emp[,c(2,3,6)]
emp[,c("ename","job","sal")]
subset(emp,select = c(ename, job, sal))
# 3. emp에서 1,2,3 행 들만
emp[1:3,]
emp[c(1,2,3),]
# 4. ename이 "KING"인 직원의 모든 정보
emp[9,] 
subset(emp,subset= (emp$ename=="KING"))
subset(emp,emp$ename=="KING") 
emp[c(F,F,F,F,F,F,F,F,T,F,F,F,F,F),]
emp[emp$ename=="KING",] 

# 5. select ename,sal from emp where sal>=2000
subset(emp, select=c("ename","sal"), subset= emp$sal>= 2000)
emp[emp$sal>=2000,c("ename","sal")]

# 6. select ename,sal from emp where sal between 2000 and 3000
subset(emp, select=c("ename","sal"), subset=(sal>=2000 & sal<=3000))
emp[emp$sal>=2000 & emp$sal <=3000, c("ename","sal")]


score$grade <- ifelse(score$sum >= 230,"A",
                      ifelse(score$sum >= 215,"B", 
                             ifelse(score$sum >=200,"C","D")))

v1 <- c(30, 10, 20, 15, 40)
order(v1)  #정렬 순서 default : decreasing = F 
sort(v1)   #정렬 default : decreasing = F 

# emp 데이터셋에서 월급이 적은순으로 직원이름과 월급을 추출한다.

#LIST
lds <- list(1,2,3)
lds
lds+100
lds[1]
lds[1]+10
lds[[1]]+10     # [[]] 사용 
names(lds) <- LETTERS[1:3]
lds
lds[[2]]
lds[["B"]]
lds$B


a<-list(        #list : 모든 데이터 타입 & 함수 저장 가능 
  a = 1:3,
  b= "a string",
  c=pi,
  d=list(-1,-5)
)
a
a[1]
a[[1]]          #list의 데이터를 사용하기 위해서 [[]] 또는 $ 를 써야함 -> vector반환 
a$a
a[[1]][1]
a$a[1]

a[1]+1          #[] 로는 list상의 데이터를 access 할 수 없음 
a[[1]]+1

unlist(a[1])    #unlist() : list형태를 해제하고 vector로 반환 (names 존재)

cat(100,200)              #cat : 여러 값을 출력, 가변 매개변수 지원 
cat(100,200,"\n")

paste("I'm","Duli","!!")  #paste : 문자열 결합 

fruit <- c("Apple", "Banana", "Strawberry")
food <- c("Pie","Juice", "Cake")
paste(fruit, food)

paste(fruit, food, sep="")
paste(fruit, food, sep=":::")
paste(fruit, food, sep="", collapse="-") #원소 전체를 합칠 때 collapse 지정 
paste(fruit, food, sep="", collapse="")
paste(fruit, food, collapse=",")

site<-"http://movie.naver.com/movie/point/af/list.nhn?page="
pageNum <- 10
url <- paste(site, pageNum, sep="")
url

#지금까지 만들어진 데이터set와 함수 저장
ls()
length(ls())
save(list=ls(),file="all.rda") 
rm(list=ls())
ls()
load("all.rda")
ls()

#read file data
nums <- scan("sample_num.txt")               #token 단위의 글을 읽는 경우, 
nums                                         #기본 number 데이터타입으로 저장  
word_ansi <- scan("sample_ansi.txt",what="") #문자열일 경우 what 옵션 
word_ansi                                    #외부 파일을 읽을 때 기본 : CP979, MS949, EUC-KR, ANSI
words_utf8 <- scan("sample_utf8.txt", what="",encoding="UTF-8")  #encoding="UTF-8" 주어야 한글깨짐 방지 

lines_ansi <- readLines("sample_ansi.txt")   #행단위로 읽음 
lines_utf8 <- readLines("sample_utf8.txt",encoding="UTF-8")

df2 <- read.table("product_click.log")       #read.table : tab으로 분류 되어 있을 때 
str(df2)
summary(df2$V2)
summary(df2$V2)[1]

#제어문
#if else
randomNum <-sample(1:10,1)
if(randomNum>5){
  cat(randomNum,":5보다 크군요","\n")
}else{
  cat(randomNum,":5보다 작거나 같군요","\n")
}

if(randomNum%%2){       #조건식에서 1: True, 0: False
  cat(randomNum,";홀수","\n")
}else{
  cat(randomNum,";짝수","\n")
}


if(randomNum%%2 == 1){
  cat(randomNum,";홀수","\n")
}else{
  cat(randomNum,";짝수","\n")
}

score <- c(50)
if (score >=90){
  cat(score,"는 A등급입니다","\n")
}else if (score >=80){
  cat(score,"는 B등급입니다","\n")
}else if (score >=70){
  cat(score,"는 C등급입니다","\n")
}else if (score >=60){
  cat(score,"는 D등급입니다","\n")
}else {
  cat(score,"는 F등급입니다","\n")
}

#for문
#for 실습
for(data in month.name)
  print(data)
for(data in month.name)print(data);print("ㅋㅋ")
for(data in month.name){print(data);print("ㅋㅋ")}

for(n in 1:5)
  cat("hello?","\n")

for(i in 1:5){
  for(j in 1:5){
    cat("i=",i,"j=",j,"\n")
  }
}

for(i in 1:9){
  for(j in 1:9){
    if(i*j>30) break;
    cat(i,"*",j,"=",i*j,"\t")
  }
  cat("\n")
}

bb <- F
for(i in 1:9){
  for(j in 1:9){
    if(i*j>30){
      bb<-T
      break
    } 
    cat(i,"*",j,"=",i*j,"\t")
  }
  cat("\n")
  if(bb) #bb가 TRUE이면
    break
}

#while문
i<-1
while(i <= 10){
  cat(i,"\n")
  i <- i+1
}
cat("종료 후 :",i,"\n")

i<-1
while (i<=10) {
  cat(i,"\n")
}

i<-1
while (i<=10) {
  cat(i,"\n")
  i<-i+2
}

i<-1
while (i<=10) {
  cat(i,"\n")
  i<-i+1
}

#switch 문
month <- sample(1:12,1)
month <- print(paste(month,"월",sep=""))
result <- switch(EXPR=month,
                 "12월"=,"1월"=,"2월"="겨울",
                 "3월"=,"4월"=,"5월"="봄",
                 "6월"=,"7"=,"8월"="여름",
                 "가을")
cat(month,"는 ",result,"입니다","\n",sep="")

month <- sample(1:12,1)
result <- switch(EXPR=month,"겨울", "겨울", "봄", "봄", "봄", 
                 "여름", "여름", "여름","가을", "가을", "가을", "겨울")
cat(month,"월은 ",result,"입니다","\n",sep="")

num <- sample(1:10,1)
num
switch(EXPR = num,"A","B","C","D")

for(num in 1:10){
  cat(num,":",switch(EXPR = num,"A","B","C","D"),"\n")
}
#숫자일 때는 기본 값 지정 못한다. 1부터 시작
#따라서 문자로 바꿔서 부여한다. 
for(num in 1:10){
  num<-paste(num,"",sep = "")
  cat(num,":",switch(EXPR = num,"7"="A","8"="B","9"="C","10"="D", "ㅋㅋ"),"\n")
}

for(num in 1:10){
  cat(num,":",switch(EXPR = as.character(num),"7"="A","8"="B","9"="C","10"="D", "ㅋㅋ"),"\n")
}


#break 와 next
#next는 java에서 continue와 비슷하다.
sum <-0
for(i in 5:15){
  #if(i%%2==0) {
  #  next;
  #}
  if(i%%10==0){
    break;
  }
  sum <- sum + i
  print(paste(i,":",sum))
}



# 함수 정의와 활용

func1 <- function() {
  xx <- 10
  yy <- 20
  return(xx*yy)
}
func1()
result <- func1()
result
xx
func2 <- function(x,y) {
  xx <- x
  yy <- y
  return(sum(xx, yy))
}

func2()
func2(5,6)

func3 <- function(x,y) {
  x3 <- x+1
  y3 <- y+1
  x4 <- func2(x3, y3)
  return(x4)
}

func3(9, 19)  # 30

func4 <- function(x=100, y=200, z) {
  return(x+y+z)
}
func4()
func4(10,20,30)
func4(x=1,y=2,z=3)
func4(y=11,z=22,x=33)
func4(z=1000)  

# 쉬트에 있는 함수 코드
f1 <- function() print("TEST")     #한줄에 나타낼 때 {} 안써도 됨  
f2 <- function(num) {print("TEST"); print(num) }
f3<- function (p="R") print(p)     
#arg가 하나일경우 지정하지 않아도 됨 f3(), f3(p="python"),f3(p="java") default 값이 있어도 arg 변경 가능  
f4<- function (p1="ㅋㅋㅋ",p2) for(i in 1:p2) print(p1)
f5<- function(...) { print("TEST"); data <- c(...); print(length(data))}
#매개변수를 가변적으로 처리 가능 
f6<- function(...) {
  print("수행시작")
  data <- c(...)
  for(item in data) {
    print(item)
  }
  return(length(data))
}
f6();
f7<- function(...) {
  data <- c(...)
  sum <- 0;
  for(item in data) {
    if(is.numeric(item))
      sum <- sum + item
    else
      print(item)
  }
}
f8<- function(...) {
  data <- list(...)
  sum <- 0;
  for(item in data) {
    if(is.numeric(item))
      sum <- sum + item
    else
      print(item)
  }
  return(sum)
}

x <- 70
func5 <- function() {
  x <- 10
  y <- 20
  x <<- 40  # 외부 변수 x 를 수정
  return (x+y)
}
func5()  
x  

#전역변수/지역변수
a<-3;b<-7;c<-11 
ft<-function(a){
  b<-a+10     
  c<<-a+10    
  d<-a
  print(a);print(b);print(c);print(d)
}
ft(100)
print(a);print(b);print(c);print(d) 

#invisible()함수 

ft.1 <- function(x) return()
ft.2 <- function(x) return(x+10)
ft.3 <- function(x) invisible(x+10)

ft.1(100)
ft.2(100)
ft.3(100)

r1 <- ft.1(1000);r1
r2 <- ft.2(1000);r2
r3 <- ft.3(1000);r3


testParamType <- function(x){
  if(is.vector(x)) print("벡터를 전달했군요!")
  if(is.data.frame(x)) print("데이터프레임을 전달했군요!")
  if(is.list(x)) print("리스트를 전달했군요!")
  if(is.matrix(x)) print("매트릭스를 전달했군요!")
  if(is.array(x)) print("배열을 전달했군요!")
  if(is.function(x)) print("함수를 전달했군요!")
}

#dataframe이 list에, list는 vector에 포함 됨 
#list는 원소 1개 짜리 1차원 배열과 같다.

testParamType(100)
testParamType(LETTERS)
testParamType(data.frame())
testParamType(matrix())
testParamType(list())
testParamType(array())
testParamType(function(){})


#testParamType
testParamType1 <- function(x){
  result <- NULL
  if(is.vector(x)  && !is.list(x)) result <-"벡터를 전달했군요!"
  else if(is.data.frame(x)) result <- "데이터프레임을 전달했군요!"
  else if(is.list(x)) result <- "리스트를 전달했군요!"
  else if(is.matrix(x)) result <- "매트릭스를 전달했군요!"
  else if(is.array(x)) result <- "배열을 전달했군요!"
  else if(is.function(x)) result <- "함수를 전달했군요!"
  return(result)
}

#dataframe이 list에, list는 vector에 포함 됨 #list는 원소 1개 짜리 1차원 배열과 같다.....?

testParamType1(100)
testParamType1(LETTERS)
testParamType1(data.frame())
testParamType1(matrix())
testParamType1(list())
testParamType1(array())
testParamType1(function(){})

#stop() 함수
testError1 <- function(x){
  if(x<=0)
    stop("양의 값만 전달 하숑!! 더 이상 수행 안할거임..")
  return(rep("테스트",x))
}

testError1(5)
testError1(0)



#warning() 함수
testWarn <- function(x){
  if(x<=0)
    stop("양의 값만 전달 하숑!! 더 이상 수행 안할거임..")
  if(x>5){
    x<-5
    warning("5보다 크면 안됨!! 하여 5로 처리했삼...!!")
  }
  return(rep("테스트",x))
}

test1 <-function(p){
  cat("난 수행함\n")
  testError(-1)
  cat("나 수행할 까요? \n")
}
test1()

#try()
test2 <- function(p){
  cat("난 수행함\n")
  try(testError(-1))
  cat("나 수행할 까요? \n")
}
test2()

testAll <-function(p){
  tryCatch({
    if(p=="오류테스트"){
      testError(-1)
    }else if (p =="경고테스트"){
      testWarn(6)
    }else{
      cat("정상 수행..\n")
      print(testError(2))
      print(testWarn(3))
    }
  },warning = function(w){
    print(w)
    cat("-.-;;\n")
  }, error = function(e){
    print(e)
    cat("ㅠㅠ \n")
  },finally ={
    cat("오류, 경고 발생 여부를 따라서 반드시 수행되는 부분입니다요..\n")
  })
}

testAll("오류테스트")
testAll("경고테스트")
testAll("아무거나")
