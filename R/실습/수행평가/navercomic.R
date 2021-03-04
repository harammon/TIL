library(rvest)
# URL 읽기
comicName <- c()
comicSummary <- c()
comicGrade <- c()
comic.df <- data.frame()
site<- "https://comic.naver.com/genre/bestChallenge.nhn?&page="

for(i in 1:20){
  url <- paste0(site, i, sep="")
  text.url <- read_html(url)
  # 만화 제목
  comicName.nodes <- html_nodes(text.url, '.challengeTitle>a')
  print(comicName.nodes)
  comicName <- html_text(comicName.nodes, trim=T)
  
  # 만화 요약
  comicSummary.nodes <- html_nodes(text.url, '.summary')
  print(comicSummary.nodes)
  comicSummary <- html_text(comicSummary.nodes, trim=T)
  
  
  # 만화 평점
  comicGrade.nodes <- html_nodes(text.url, '.rating_type>strong')
  print(comicGrade.nodes)
  comicGrade <- html_text(comicGrade.nodes, trim=T)
  
  page <- data.frame(comicName, comicSummary, comicGrade)
  comic.df <- rbind(comic.df, page)
}
setwd("C:/Users/haram/rexam/")
write.csv(comic.df, 'output/navercomic.csv', row.names = FALSE)