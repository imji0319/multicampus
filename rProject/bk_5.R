library(ggplot2)

#문제1
midwest<-as.data.frame(ggplot2::midwest)
str(midwest)
summary(midwest)
head(midwest)
tail(midwest)
View(midwest)
#문제2
library(dplyr)
midwest <- rename(midwest, total = poptotal,
                  asian=popasian)

#문제3
midwest$percent_asian <- midwest$asian/midwest$total 
hist(midwest$percent_asian)

#문제4
avg_asian <- mean(midwest$percent_asian)
midwest$ls <- ifelse(midwest$percent_asian > avg_asian, "large","small")

#문제5
table(midwest$ls)
qplot(midwest$ls)
