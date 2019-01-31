# 문제 1
L1 <- list(
  name = "scott",
  sal=3000
)
result1 <- L1$sal*2

# 문제 2
L2 <- list(
  "Scott",
  c(100,200,300)
)
L2
# 문제 3
li <- list(
  c(3,5,7),
  c("A","B","C")
)

li[[2]][1] <- "Alpha"
li

# 문제 4
li2 <- list(
  alpha=0:4,
  beta=sqrt(1:5),
  gamma=log(1:5)
)
li2$alpha<-li2$alpha+10
li2

# 문제 5
li3<-list(
  math=list(95, 90), 
  writing=list(90, 85), 
  reading=list(85, 80)
)
avg<-sum(unlist(li3$math),unlist(li3$writing),unlist(li3$reading))/6
avg

lis <- unlist(li3)
mean(lis)

# 문제 6
grade <- sample(1:10,1)
ifelse((grade%%2==0),
       paste(grade,": 짝수"),paste(grade,": 홀수"))

paste(grade,ifelse((grade%%2==0),": 짝수",": 홀수"))

if (grade%%2){
  paste(grade,": 홀수")
}else{
  paste(grade,": 짝수")
}
  

# 문제 7
choice <- sample(1:5,1)
result <- switch(EXPR=choice,300+50,300-50,300*50,300/50,300%%50)
cat("결과값 :",result,"\n")

getwd()
#문제 8
iotest1 <- scan("iotest1.txt")
iotest1
cat("오름차순 : ", sort(iotest1))
cat("내림차순 : ", sort(iotest1, decreasing = T))
cat("합 : ", sum(iotest1))
cat("평균 : ", mean(iotest1))

#문제 9
iotest2<-scan("iotest2.txt", what="")
count <- table(iotest2)
result <-names(count)[which.max(count)]
#result <- names(which.max(table(iotest2)))
#result <- names(sort(count), decreasing =T)[1] 
#result <- head(names(sort(count), decreasing=T),1)
#result <- tail(names(sort(count)),1)

cat("가장 많이 등장한 단어는", result ,"입니다.","\n")
