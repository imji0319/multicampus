library(ggplot2)
library(dplyr)
install.packages("cli")

mpg <- as.data.frame(ggplot2::mpg)

#Q1
mpg %>% group_by(class) %>% summarise(mean_cty=mean(cty))

#Q2
mpg %>% group_by(class) %>% summarise(mean_cty=mean(cty)) %>% 
  arrange(desc(mean_cty))

#Q3
mpg %>% group_by(manufacturer) %>% summarise(mean_hwy=mean(hwy)) %>% 
  arrange(desc(mean_hwy)) %>%  head(3)

#Q4
mpg %>% filter(class=="compact") %>% group_by(manufacturer) %>%
  summarise(count_compact = n()) %>% arrange(desc(count_compact))
