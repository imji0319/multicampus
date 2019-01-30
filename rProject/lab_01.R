# 문제 1
v1 <- c(1:10);v1
v2 <-v1*2 ;v2
max_v <-max(v2);max_v
min_v <-min(v2);min_v
avg_v <-mean(v2);avg_v
sum_v <-sum(v2);sum_v
v3 <- v2[-5];v3
v1;v2;v3;max_v;min_v;avg_v;sum_v;


# 문제 2
m1<-matrix(seq(10,38,2), nrow=3, ncol=5); m1
m2<-m1+100;m2
m_max_v <-max(m1);m_max_v
m_min_v <-min(m1);m_min_v
row_max <-apply(m1,1,max);row_max
col_max <-apply(m1,2,max);col_max
m1; m2; m_max_v; m_min_v; row_max; col_max


#문제 3
seq(1,10,2)
rep(1,5)
rep(c(1,2,3),3)
rep(1:4,each=2)

#문제 4
v3 <-seq(1,10,3)
names(v3)<-c("A", "B", "C", "D")
v3

#문제 5
count <- sample(1:100,7)
count
week.korname=c("일요일","월요일","화요일","수요일","목요일","금요일","토요일")
paste(week.korname, count, sep=":") # "일요일:XX"
names(count)<-week.korname
week.korname[which.max(count)]
week.korname[which.min(count)]
week.korname[which(count>50)]

#문제6
n1 <- c(1,2,3)
n2 <- c(4,5,6)
n3 <- c(7,8,9)
m1 <- cbind(n1,n2,n3);m1


#문제7
m2 <- matrix(c(1:9),nrow=3,byrow=T);m2

#문제8
m3<-m2
rownames(m3) <- c("row1","row2","row3")
colnames(m3) <- c("col1","col2","col3")
m3
