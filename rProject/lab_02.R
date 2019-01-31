#문제1
alpha <- matrix(c("a","b","c","d","e","f"), ncol=3)
alpha<-rbind(alpha,c("x","y","z"))
alpha <-cbind(alpha,c("s","p"))

alpha

#문제2
?array
a <- array(c(1:24),c(2,3,4))
a
a[2,3,4]
a[2,,]
a[,1,]
a[,,3]
a+100
a[,,4]*100
a[1,c(2:3),]
a[2,,2]<-a[2,,2]+100
a
a[,,1]<-a[,,1]-2
a<-a*10
a
rm(a)
a
#문제3
df <-data.frame(x=c(1:5),y=seq(2,10,2))
df

#문제4
df2 <-data.frame(col1=c(1:5), col2=letters[1:5],col3=c(6:10))
df2
#문제5
col1<-c("사과","딸기","수박")
col2<-c(1800,1500,3000)
col3<-c(24,38,13)
df3<-data.frame(제품=col1,가격=col2,판매량=col3)
df3

#문제6
mean(df3$가격)
mean(df3$판매량)

#문제7
name <- c("Potter", "Elsa", "Gates", "Wendy", "Ben")
gender <- factor(c("M", "F", "M", "F", "M"))
math <- c(85, 76, 99, 88, 40)
df4 <- data.frame(name,gender,math)
str(df4)
stat <- c(76, 73, 95, 82, 35)
df4<-cbind(df4,stat)
df4$score <- df4$math + df4$stat
df4
df4$grade <- ifelse(df4$score>=150,"A",
                    ifelse(df4$score>=100,"B","C"))


#문제8 
str(emp)

#문제9 
emp[c(3,4,5),,]

#문제10 
emp["ename"]

#문제11
emp[c("ename","sal")]

#문제12
subset(emp,select=c("ename","sal","job"),subset=(emp$job=="SALESMAN"))

#문제13
subset(emp,select=c("ename","sal"),subset=(emp$sal>=3000))

#문제14
subset(emp,select=c("ename","job","sal"),subset=(emp$jo !="ANALYST"))

#문제15
subset(emp, select=c("ename","job"), subset=(emp$job == "SALESMAN" | emp$job=="ANALYST"))

#문제16
emp[order(emp$sal),]



