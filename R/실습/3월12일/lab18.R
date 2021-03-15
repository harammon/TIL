getwd()
setwd("C:/Users/haram/rexam")

library(ggplot2)
library(dplyr)

# 문제 1
str(mpg)
ggplot()
ggplot(data=mpg) + geom_point(aes(x=cty, y=hwy), color="blue")
ggsave("output/result1.png", width=3, height=3)

# 문제 2
ggplot(data=mpg, aes(x=class)) +
  geom_bar(aes(fill=drv), alpha=1.0)
ggsave("output/result2.png", width=3, height=3)

# 문제 3
a <- read.table('data/product_click.log')
length(unique(a$V2))
ggplot(data=a) +
  geom_bar(aes(x=V2, fill=V2))#  + 
  #scale_color_brewer(palette = 'Set3')
ggsave("output/result3.png", width=3, height=3)  

# 문제 4
b <- substr(a$V1, 1, 8)
b.date <- as.Date(b, "%Y%m%d")
b.day <- as.character(b.date, '%a요일')
b.day <- as.data.frame(b.day)
ggplot(data=b.day) +
  geom_bar(aes(x=b.day, fill=b.day)) +
  labs(fill='day', x="요일", y="클릭수") + theme_linedraw()
ggsave("output/result4.png", width=3, height=3)

# 문제 5
library(treemap)
library(showtext)
showtext_auto()
font_add(family = "maple", regular = "fonts/MaplestoryBold.ttf")
data(GNI2014)
str(GNI2014)
png(filename = "output/result5.png", height = 400, width = 600)
treemap(GNI2014, vSize="population", 
        index=c("continent", "iso3"),
        title="전세계 인구 정보",
        fontfamily.title="maple",
        fontsize.title = 20,
        fontfamily.labels="maple",
        border.col = "green")

dev.off()


