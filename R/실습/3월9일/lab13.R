library(KoNLP)
getwd()
setwd("C:/Users/haram/rexam")
txt <- readLines('output/yes24.txt', encoding = 'UTF-8')
a <- gsub("[^가-힣[:space:]]", "", txt)
txt.noun <- extractNoun(a)
b <- unlist(txt.noun)
b2 <- Filter(function(x){nchar(x)>=2&nchar(x)<=4}, b)
b_table <- table(b2)
final <- sort(b_table, decreasing = T)
str(final)
df <- data.frame(final)

library(wordcloud2)
result <- wordcloud2(df, fontFamily = "휴먼옛체")

install.packages('htmlwidgets')
library(htmlwidgets)
htmltools::save_html(result,"output/yes24.html")


# 방법 2
yes1 <- readLines("output/yes24.txt", encoding="UTF-8")
yes2 <- unlist(extractNoun(yes1))
yes3 <- gsub("[^가-힣]","",yes2) 
yes4 <- Filter(function(x){nchar(x)>=2 & nchar(x)<=4}, yes3) 
yes5 <- table(yes4)
yes6 <- sort(yes5, decreasing = T) 
data <- data.frame(yes6) 

result <- wordcloud2(data = data, fontFamily = "휴먼옛체")
