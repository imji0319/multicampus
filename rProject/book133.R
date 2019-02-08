library(ggplot2)
mpg <- as.data.frame(ggplot2::mpg)
str(mpg)

library(dplyr)

#Q1
displ_4 <- mpg %>% filter(displ <= 4)
displ_5 <- mpg %>% filter(displ > 5)
mean(displ_4$hwy)
mean(displ_5$hwy)


#Q2
audi <-mpg %>% filter(manufacturer == "audi")
toyota <-mpg %>% filter(manufacturer =="toyota")

head(audi)
head(toyota)

mean(audi$cty)
mean(toyota$cty)

#Q3
hwy <- mpg %>% filter(manufacturer == "chevrolet" |
                        manufacturer == "ford"|
                        manufacturer =="honda")

hwy_in <-mpg %>% filter(manufacturer %in% c("chevrolet","ford","honda"))

mean(hwy$hwy)
mean(hwy_in$hwy)
