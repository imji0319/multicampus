library(ggplot2)
library(dplyr)

midwest <- as.data.frame(ggplot2::midwest)

#Q1
midwest <-midwest %>% mutate(nonadult_percent = (poptotal-popadults)/poptotal)

#Q2
midwest %>% group_by(county) %>% arrange(desc(nonadult_percent)) %>% select(nonadult_percent) %>% head(5)

#Q3
midwest <- midwest %>% mutate( grade = ifelse(nonadult_percent >= 0.4,"large",
                                              ifelse(nonadult_percent >=0.3,"middle","small" )) )

table(midwest$grade)

#Q4
midwest$asian_percent <- midwest$popasian/midwest$poptotal
midwest %>% arrange(asian_percent) %>% select(state, county, asian_percent) %>% head(10)
