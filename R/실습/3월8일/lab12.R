install.packages('stringr')
library('stringr')

# 문제 1
v1 <- c('Happy', 'Birthday', 'to', 'You')
a <- str_count(v1)
cat('벡터의 길이 : ', length(v1), '\n')
cat('문자 개수의 합 :', sum(a), '\n')

# 문제 2
v1.text <- paste0(v1, collapse = " ")
print(v1.text)
cat('벡터의 길이 : ', length(v1.text), '\n')
cat('문자 개수의 합 :', str_length(v1.text), '\n')

# 문제 3
a <- LETTERS[1:10]
paste(a, seq(1:10))
paste0(a, seq(1:10))

# 문제 4 -> 리스트 출력 확인인
txt <- 'Good Morning'
a <- strsplit(txt, " ")
txt.list <- list(a[[1]][1], a[[1]][2])

b <- str_split_fixed(txt, " ", 2) # 다른 방법법

# 문제 5
a <- c("Yesterday is history, tommrrow is a mystery, today is a gift!",
  "That's why we call it the present - from kung fu Panda")
a <- gsub("[,-]", "", a)
a <- strsplit(a, " ")

# b <- c(a[[1]], a[[2]]) 하나의 벡터에 담으려면면

# 문제 6
s1 <- "@^^@Have a nice day!! 좋은 하루!! 오늘도 100점 하루...."
r1 <- gsub("[가-힣]", "", s1)
r2 <- gsub("[[:punct:]]", "", s1)
r3 <- gsub("[[:punct:]]|[가-힣]", "", s1)
r4 <- gsub("100", "백", s1)

# 문제 7
setwd("C:/Users/haram/rexam")
a <- readLines('data/hotel.txt',encoding="UTF-8")
class(a)
remotes::install_github('haven-jeon/KoNLP', upgrade = "never", INSTALL_opts=c("--no-multiarch"))
getwd()
library(KoNLP)
a <- sapply(a, extractNoun, USE.NAMES = F)
a <- table(unlist(a))
a <- sort(a, decreasing = T)
df <- data.frame(a[1:10])
colnames(df) <- c('wname', 'wcount')
View(df)

write.csv(df, 'output/hotel_top_word.csv', row.names = F)
