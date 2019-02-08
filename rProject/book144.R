library(ggplot2)
library(dplyr)

mpg <- as.data.frame(ggplot2::mpg)

#Q1
mpg_copy <- mpg
head(mpg_copy)
mpg_copy<-mpg_copy %>% mutate(total = cty+hwy)

#Q2
mpg_copy<-mpg_copy %>% mutate(mean = total/2)

#Q3
mpg_copy %>% arrange(desc(mean)) %>% head(3)

mean_head <- mpg %>% mutate(total=cty+hwy,
                           mean=total/2) %>%  arrange(desc(mean)) %>% head(3)
head(mean_head)  
