library(showtext)
library(stringr)
getwd()
setwd("C:/Users/haram/rexam")
# 문제 1
showtext_auto() 
font_add(family = "cat", regular = "fonts/HoonWhitecatR.ttf")
font_add(family = "dog", regular = "fonts/THEdog.ttf")
font_add(family = "maple", regular = "fonts/MaplestoryBold.ttf")
a <- readLines('data/product_click.log')
a.split <- strsplit(a, " ")
head(a.split)
b <- unlist(a.split)
head(b)
c <- b[seq(2, length(b), 2)]
c.table <- table(c)

barplot(c.table, main='세로바 그래프 실습', col=terrain.colors(10),
        xlab='상품ID', ylab="클릭수", family="dog", col.main='red')


# 문제 2
time.label=c()
d <- b[seq(1, length(b), 2)]
d.time <- str_sub(d, 9, 10)
d.table <- table(d.time)
time <- names(d.table)
for(i in 1:length(d.table)){
  time.str <- paste0(as.numeric(time[i]),'-',(as.numeric(time[i])+1))
  time.label <- append(time.label, time.str)
}
# print(time.label) 
pie(d.table, main="파이그래프 실습", col=terrain.colors(length(d.table)),
    radius=1,
    labels=time.label)


# 문제 3
score <- read.table("data/성적.txt", header=TRUE)
score2 <- score[,3:5]
boxplot(score2, main="과목별 성적 분포", col=rainbow(3), ylim=c(2,10))
score

# 문제 4
score3 <- as.matrix(score[,2:5])
score4 <- t(score3)
barplot(score4[2:4,], main="학생별 점수", names=score4[1,],
        col=rainbow(3),
        legend.text=rownames(score4[2:4,]),
        args.legend = list(x='topright', bty='y', inset=c(0,-0.1)))

