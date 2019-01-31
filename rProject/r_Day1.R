nums <- c(10, 5, 3, 9, 7)
print(nums)
c(10,"ABC")     # 자동 형변환 숫자->문자열
c(10,T)         # 자동 현변환 문자 -> 숫자
c(10,"ABC",T)   # -> 모두 문자열 리터럴 


x <- c(10,2,7,4,15)
x
print(x)
class(x)        #데이터 타입 
rev(x)          #데이터를 역순으로 프린트 but 데이터가 바뀌는 것은 아님 
range(x)        #최대, 최소 값을 리턴 
sort(x)         #정렬 default : 오름차순, decreasing = FALSE 
sort(x, decreasing = TRUE)
sort(x, decreasing = T)
length(x)       #원소의 개수 

x<- c(1,4,6,8,9); x  #수행문장이 두개 => 여러개의 명령을 한 줄에 표현하고 싶을 때 ; 활용 
(x<- c(1,4,6,8,9))   #() 를 통해 console 출력까지 
x[2]            #인덱스 1부터 시작 
x[-2]           #- : 해당 인덱스 제외 -> 2번 인덱스 제외하고 출력
x[c(1,3,5)]     #여러 인덱스를 벡터를 통해 지정 가능 
x[3] <- 10      #특정 인덱스 값을 변경 가능 
x
x+1             # x + c(1) -> x + (1,1,1,1,1)  모든 원소에 적용 
x               
x <- x+1        #해당 변수에 적용하지 않으면 영향이 없음 
x
max(x)
min(x)
mean(x)
sum(x)
x>5             #원소마다 체크 
x[x>5]          # x[c(T,F,T,F,T)]
x[c(F,F,T,T,T)] # x[c(3,4,5)] :T/F를 통해 인덱스 지정 가능 
x[2<x & x<10]   # & : 모든 원소별 적용
x[2<x && x<10]  # && : 첫번째 원소만 적용 
# R의 builtin constants
letters         #영소문자
LETTERS         #영대문자
month.name      #월별 영어이름
month.abb       #월별 영어축약이름 
pi
names(x) <- LETTERS[1:5] # LETTERS[c(1,2,3,4,5)]
x[3]
x["C"]
z <- -5:5; names(z)
z1 <- 10:20; z11 <- 20:10
z;z1;z11        #값 합침 
z2 <- seq(from=1, to=20, by=3); 
z2
z2 <- seq(by=3,from=1, to=20)
z3 <- seq(10,20,2)
?seq
sample(1:20, 5) #1~20 사이 5개    
sample(1:45, 6)
sample(1:10, 10)
sample(1:10, 10, replace=T)
r1 <- sample(10:20, 5)
r2 <- sample(1:9, 5)
r1;r2
r4 <- append(r2, r1)
r3 <- replace(r1, c(2,3), c(100,200))
r3
rep(9,5)
rep(1:5,3)     # rep(1:5,times=3); 
rep(1:5, each=3)

x <- 1:3; y <-c(4,2,8)
x;y
x>y
x>=y
x==y
y >3 # y > c(3,3,3)

#연산기호 비교
c(T,T,F,F) & c(T,F,T,F)
c(T,T,F,F) | c(T,F,T,F)
c(T,T,F,F) && c(T,F,T,F)
c(T,T,F,F) || c(T,F,T,F)
#논리 + 숫자 --> 논리 T = 1, F = 0
c(T,T,F,F) + 1:4

(a1 <- LETTERS[1])
a2 <- LETTERS[c(1,3,5,7)]
a3 <- LETTERS[1:10]
a4 <- LETTERS
a1;a2;a3;a4
100->v1
v1
r1
sum(r1); median(r1); mean(r1); max(r1); min(r1)
summary(r1)      #숫자 - 요약통계량 
summary(LETTERS) #문자 - 길이, class, mode 
a<- -3:3
ls()             #현재 저장된 변수 
rm(a)            #변수 삭제 
w1 <- c(1,2,3,NA,4,5) # NA : 값이 없음 
length(w1)
sum(w1)         # 중간에 NA 가 있으면 연산 불가능 -> NA 
sum(w1, na.rm =T) # na.rm = T : NA 제외하고 계산 
w2 <- na.omit(w1); #NA 제외하고 저장 
help(na.omit)
w2;
length(w2) 
w2[1]
sum(w2)
rainfall<-c(21.6,23.6,45.8,77.0,
            102.2,133.3,327.9,348.0,
            137.6,49.3,53.0,24.9)
rainfall >100
rainfall[rainfall > 100] #변수[조건]을 통해 검색 가능 
which(rainfall >100)     #해당 조건이 True인 인덱스 반환 
which.max(rainfall)
which.min(rainfall)
month.name[which.max(rainfall)] #최대값이 8 -> month,name[8] => August  
month.name[which(rainfall>100)] 


#새로운 변수를 저장 
month.korname <-c("1월","2월","3월","4월",
                  "5월","6월","7월","8월",
                  "9월","10월","11월","12월")
#내장객체이외도 적용 가능 
month.korname[which.max(rainfall)]
month.korname[which(rainfall>100)]


# MATRIX 테스트
vec1 <- c(1,2,3)
vec2 <- c(4,5,6)
vec3 <- c(7,8,9)
mat1 <- rbind(vec1,vec2,vec3); mat1 #rbind : 아래로 붙임 
mat2 <- cbind(vec1,vec2,vec3); mat2 #cbind : 오른쪽에 붙임
mat1[1,1]
mat1[2,]          #2행의 모든 열 
mat1[,3]          #3열의 모든 행 
mat1[1,1,drop=F]  #drop=F : Matrix 형태로 출
mat1[2,,drop=F]
mat1[,3,drop=F] 

rownames(mat1) <- NULL #행의 이름 삭제 : 인덱스 값으로 변환  
colnames(mat2) <- NULL #열의 이름 삭제 : 인덱스 값으로 변
mat1;mat2
rownames(mat1) <- c("row1","row2","row3")  #행 이름 지정 가능 
colnames(mat1) <- c("col1","col2","col3")  #열 이름 지정 가능 

chars <- letters[1:10]
chars
mat1 <-matrix(chars) # 벡터 -> 메트릭스 dim : [벡터개수, 1]
mat1; dim(mat1)
mat2 <-matrix(chars, nrow=1) #행렬을 만들 때 row, col값을 지정하여 만듬 
mat2
mat3 <-matrix(chars, nrow=5) #열부터 값을 채움 
mat3
mat4 <-matrix(chars, nrow=5, byrow=T) #byrow=T : 행부터 값을 채움 
mat4
mat5 <- matrix(chars, ncol=5)
mat5
mat6 <- matrix(chars, ncol=5, byrow=T)
mat6
mat7 <- matrix(chars, nrow=3, ncol=5) #데이터의 개수와 행렬의 dim차이가 있을 경우 data의 앞부터 다시 채움 
mat7
mat8 <- matrix(chars, nrow=3)
mat8

x1 <-matrix(1:8, nrow = 2)
x1
x1<-x1*3;x1 #행렬 연산 가능 

sum(x1); min(x1);max(x1);mean(x1)

x2 <-matrix(1:8, nrow =3)
x2

mat1;max(mat1);min(mat1);
sum(mat1);mean(mat1);median(mat1) #데이터타입이 문자일 경우는 불가

mean(x2); sum(x2)
mean(x2[2,])
sum(x2[2,])
rowSums(x2); colSums(x2) #행/열 단위로 합계계산 
apply(x2, 1, sum); #first arg : 데이터 second arg : 1-행 2-열 third arg :  적용함수   
apply(x2, 2, sum)  
?apply #help
apply(x2, 1, max)
apply(x2, 1, min)
apply(x2, 1, mean)

apply(x2, 2, max)
apply(x2, 2, min)
apply(x2, 2, mean)


#배열
a1 <- array(1:30, dim=c(2,3,5))
a1

a1[1,3,4]

a1[,,3]

a1[,2,]

a1[1,,]



#factor
score <-c(1,3,2,4,2,1,3,5,1,3,3,3)
summary(score)

#factor 만드는 방법: factor함수 호출
f_score <- factor(score) # factor : 범주형 데이터 => levels 
score;f_score

#summary of factor show the number of each levels
summary(f_score)
levels(f_score)
data <- c("월","수","토","월","목","화")
summary(data)
day <- factor(data)
summary(day)
iris
View(iris)
str(iris)
summary(iris)



#Dataframe
no <- c(1,2,3,4)
name <- c('Apple','Banana','Peach','Berry')
qty <- c(5,2,7,9)
price <- c(500,200,200,500)
fruit <- data.frame(no, name, qty, price)    #데이터프레임 변환 : data.frame 
str(fruit)
View(fruit)
#vector form
fruit[1,]
fruit[-1,]
fruit[,2]
fruit[,3]
fruit[, c(3,4)]
fruit[3,2]
fruit[3,1]

fruit[3]        # 데이터프레임 구조 유지 -> 굳이 유지할 필요는 없음 

#vector form
fruit$qty       # dataframe의 column 값으로 추출  
fruit[[3]]

str(fruit$qty)
str(fruit[3])

# dataframe exam1
english <- c(90, 80, 60, 70)
math <- c(50, 60, 100, 20)
classnum <- c(1,1,2,2)
df_midterm <- data.frame(english, math, classnum)
df_midterm
str(df_midterm)
colnames(df_midterm); rownames(df_midterm); names(df_midterm) # colnames == names 
mean(df_midterm$english)
mean(df_midterm$math)

df_midterm2 <- data.frame(
  c(90, 80, 60, 70), c(50, 60, 100, 20), c(1,1,2,2))
colnames(df_midterm2); rownames(df_midterm2); names(df_midterm2) 
df_midterm2

df_midterm2 <- data.frame(
  영어=c(90, 80, 60, 70), 수학=c(50, 60, 100, 20), 
  클래스=c(1,1,2,2))
df_midterm2
df_midterm2$영어

df <- data.frame(var1=c(4,3,8), var2=c(2,6))    #모든 열은 데이터의 개수가 동일해야 함 -> 오류
df <- data.frame(var1=c(4,3,8), var2=c(2,6,1))
str(df)
df$var_sum <- df$var1 + df$var2  #데이터 프레임에 새로운 변수를 추가: 파생변수 
df$var_mean <- df$var_sum/2
df$result <- ifelse(df$var1>df$var2, 
                    "var1이 크다", "var1이 작다")

