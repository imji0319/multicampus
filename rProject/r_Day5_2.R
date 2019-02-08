#### 08-2 ####

## -------------------------------------------------------------------- ##
library(ggplot2)

# x축 displ, y축 hwy로 지정해 배경 생성
ggplot(data = mpg, aes(x = displ, y = hwy))

# 배경에 산점도 추가
ggplot(data = mpg, aes(x = displ, y = hwy)) + geom_point()

# x축 범위 3~6으로 지정
ggplot(data = mpg, aes(x = displ, y = hwy)) + geom_point() + xlim(3, 6)

# x축 범위 3~6, y축 범위 10~30으로 지정
ggplot(data = mpg, aes(x = displ, y = hwy)) + 
  geom_point() + 
  xlim(3, 6) + 
  ylim(10, 30)


#### 08-3 ####

## -------------------------------------------------------------------- ##
library(dplyr)

df_mpg <- mpg %>% 
  group_by(drv) %>%
  summarise(mean_hwy = mean(hwy))

df_mpg

ggplot(data = df_mpg, aes(x = drv, y = mean_hwy)) + geom_col()

ggplot(data = df_mpg, aes(x = reorder(drv, -mean_hwy), y = mean_hwy)) + geom_col()

ggplot(data = mpg, aes(x = drv)) + geom_bar()

ggplot(data = mpg, aes(x = hwy)) + geom_bar()


#### 08-4 ####

## -------------------------------------------------------------------- ##
ggplot(data = economics, aes(x = date, y = unemploy)) + geom_line()


#### 08-5 ####

## -------------------------------------------------------------------- ##
ggplot(data = mpg, aes(x = drv, y = hwy)) + geom_boxplot()


## -------------------------------------------------------------------- ##
## 1.산점도
ggplot(data = mpg, aes(x = displ, y = hwy)) + geom_point()

# 축 설정 추가
ggplot(data = mpg, aes(x = displ, y = hwy)) +
  geom_point() +
  xlim(3, 6) +
  ylim(10, 30)


## 2.평균 막대 그래프

# 1단계.평균표 만들기
df_mpg <- mpg %>%
  group_by(drv) %>%
  summarise(mean_hwy = mean(hwy))

# 2단계.그래프 생성하기, 크기순 정렬하기
ggplot(data = df_mpg, aes(x = reorder(drv, -mean_hwy), y = mean_hwy)) + geom_col()


## 3.빈도 막대 그래프
ggplot(data = mpg, aes(x = drv)) + geom_bar()

## 4.선 그래프
ggplot(data = economics, aes(x = date, y = unemploy)) + geom_line()

## 5.상자 그림
ggplot(data = mpg, aes(x = drv, y = hwy)) + geom_boxplot()



library(RColorBrewer)
library(ggplot2)

ggplot(mpg, aes(x=class))+geom_bar()+theme_light()
ggplot(mpg, aes(x=class))+geom_bar()+theme_linedraw()
ggplot(mpg, aes(x=class))+geom_bar()+theme_minimal()
ggplot(mpg, aes(x=class))+geom_bar()+theme_bw()
ggplot(mpg, aes(x=class))+geom_bar()+theme_gray()
ggplot(mpg, aes(x=class))+geom_bar()+theme_classic()
ggplot(mpg, aes(x=class))+geom_bar()+theme_light()


ggplot(data = mpg, aes(x = displ, y = hwy)) + geom_point(aes(colour=drv))

ggplot(data = mpg, aes(x = displ, y = hwy)) + geom_point(aes(colour=cyl))

ggplot(data = mpg, aes(x = displ, y = hwy, colour=cyl)) + geom_point() + scale_fill_brewer(palette="Reds") 

ggplot(data = mpg, aes(x = displ, y = hwy))+ geom_point(aes(colour=drv)) +scale_fill_manual(values=c("red", "blue", "green"))
company <- c('A', 'A', 'A', 'A', 'B', 'B', 'B', 'B')
year <- c('1980', '1990', '2000', '2010', '1980', '1990', '2000', '2010')
sales <- c(2750, 2800, 2830, 2840, 2760, 2765, 2775, 2790)

coSalesDF <- data.frame(company, year, sales)

ggplot(coSalesDF, aes(x=year, y=sales)) + geom_line(aes(group=company))

#-------------------------------------------------------------
# 선 색상 및 두께 설정
ggplot(coSalesDF, aes(x=year, y=sales)) + geom_line(size=2, aes(group=company,colour=company))

#-------------------------------------------------------------
ggplot(coSalesDF, aes(x=year, y=sales)) + geom_line(size=2, aes(group=company, colour=company)) + geom_point(size=2)


df <- read.table(header=TRUE, text='
                 cond yval
                 A 2
                 B 2.5
                 C 1.6
                 ')

df2 <- read.table(header=TRUE, text='
                  cond1 cond2 yval
                  A      I 2
                  A      J 2.5
                  A      K 1.6
                  B      I 2.2
                  B      J 2.4
                  B      K 1.2
                  C      I 1.7
                  C      J 2.3
                  C      K 1.9
                  ')

library(ggplot2)
# Default: dark bars
ggplot(df, aes(x=cond, y=yval)) + geom_bar(stat="identity")
# Bars with red outlines
ggplot(df, aes(x=cond, y=yval)) + geom_bar(stat="identity", colour="#FF9999") 
# Red fill, black outlines
ggplot(df, aes(x=cond, y=yval)) + geom_bar(stat="identity", fill="#FF9999", colour="black")


# Standard black lines and points
ggplot(df, aes(x=cond, y=yval)) + 
  geom_line(aes(group=1)) +     # Group all points; otherwise no line will show
  geom_point(size=3)
# Dark blue lines, red dots
ggplot(df, aes(x=cond, y=yval)) + 
  geom_line(aes(group=1), colour="#000099") +  # Blue lines
  geom_point(size=6, colour="#CC0000")         # Red dots

# Bars: x and fill both depend on cond2
ggplot(df, aes(x=cond, y=yval)) + geom_bar(stat="identity", aes(fill=cond))

ggplot(df2, aes(x=cond1, y=yval)) + 
  geom_bar(aes(fill=cond2),   # fill depends on cond2
           stat="identity",
           colour="black")

# Bars with other dataset; fill depends on cond2
ggplot(df2, aes(x=cond1, y=yval)) + 
  geom_bar(aes(fill=cond2),   # fill depends on cond2
           stat="identity",
           colour="black",    # Black outline for all
           position=position_dodge()) # Put bars side-by-side instead of stacked

# Lines and points; colour depends on cond2
ggplot(df2, aes(x=cond1, y=yval)) + 
  geom_line(aes(colour=cond2, group=cond2)) + # colour, group both depend on cond2
  geom_point(aes(colour=cond2),               # colour depends on cond2
             size=3)


# These two are equivalent; by default scale_fill_hue() is used
ggplot(df, aes(x=cond, y=yval, fill=cond)) + geom_bar(stat="identity")
ggplot(df, aes(x=cond, y=yval, fill=cond)) + geom_bar(stat="identity") + scale_fill_hue()

# These two are equivalent; by default scale_colour_hue() is used
ggplot(df, aes(x=cond, y=yval, colour=cond)) + geom_point(size=2)
ggplot(df, aes(x=cond, y=yval, colour=cond)) + geom_point(size=2) + scale_colour_hue()

myg <- ggplot(df, aes(x=cond, y=yval, fill=cond)) + geom_bar(stat="identity") 

myg + scale_fill_brewer()

myg + scale_fill_brewer(palette="Set1")

myg + scale_fill_brewer(palette="Spectral")

myg + scale_fill_brewer(palette="Set2")

myg + scale_fill_manual(values=c("red", "blue", "green"))

myg + scale_fill_manual(values=c("#CC6666", "#9999CC", "#66CC99"))


ggplot(df, aes(x=cond, y=yval)) + geom_bar(stat="identity", aes(fill=cond)) + geom_point(aes(colour=cond)) +
  scale_fill_brewer(palette="Set2")



df1 <- data.frame(xval=rnorm(50), yval=rnorm(50))

# Make color depend on yval
ggplot(df1, aes(x=xval, y=yval, colour=yval)) + geom_point()

# Use a different gradient
ggplot(df1, aes(x=xval, y=yval, colour=yval)) + geom_point() + 
  scale_colour_gradientn(colours=rainbow(4))


# 인터랙티브 그래프 만들기
# 패키지 준비하기
install.packages("plotly")    #동적 그래프 
library(plotly)
p <- ggplot(data = mpg, aes(x = displ, y = hwy, col = drv)) + geom_point()
# 인터랙티브 그래프 만들기
ggplotly(p)

# 인터랙티브 막대 그래프 만들기
p <- ggplot(data = diamonds, aes(x = cut, fill = clarity)) + 
  geom_bar(position = "dodge")
ggplotly(p)

