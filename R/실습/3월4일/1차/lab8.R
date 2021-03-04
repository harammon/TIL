library(httr)
library(XML)
library(rvest)

newstitle.nodes <- html_nodes(read_html('http://media.daum.net/ranking/popular'), xpath = '//*[@id="mArticle"]/div[2]/ul[3]/li/div/strong/a')
print(newstitle.nodes)
newstitle <- html_text(newstitle.nodes)
print(newstitle)
newstitle

newspapaername.nodes <- html_nodes(read_html('http://media.daum.net/ranking/popular'), xpath = '//*[@id="mArticle"]/div[2]/ul[3]/li/div[2]/strong/span')
print(newspapaername.nodes)
newspapername <- html_text(newspapaername.nodes)
print(newspapername)

news.info <-data.frame(newstitle, newspapername) 