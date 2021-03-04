# 문제 1
searchUrl<- "https://openapi.naver.com/v1/search/blog.xml"
Client_ID <- "izGsqP2exeThwwEUVU3x"
Client_Secret <- "WrwbQ1l6ZI"
query <- URLencode(iconv("맛집","euc-kr","UTF-8"))
url <- paste0(searchUrl, "?query=", query, "&display=100")
doc <- GET(url, add_headers("Content_Type" = "application/xml",
                            "X-Naver-client-Id" = Client_ID, "X-naver-Client-Secret" = Client_Secret))
doc2 <- htmlParse(doc, encoding="UTF-8")
text<- xpathSApply(doc2, "//item/description", xmlValue); 
text
text <- gsub("</?b>", "", text)
#text <- gsub("&.+t;", "", text)
text
write(text, 'output/naverblog.txt')


# 문제 2
result <- NULL
content <- NULL
library(rtweet) 
appname <- "edu_data_collection"
api_key <- "RvnZeIl8ra88reu8fm23m0bST"
api_secret <- "wTRylK94GK2KmhZUnqXonDaIszwAsS6VPvpSsIo6EX5GQLtzQo"
access_token <- "959614462004117506-dkWyZaO8Bz3ZXh73rspWfc1sQz0EnDU"
access_token_secret <- "rxDWfg7uz1yXMTDwijz0x90yWhDAnmOM15R6IgC8kmtTe"
twitter_token <- create_token(
  app = appname,
  consumer_key = api_key,
  consumer_secret = api_secret,
  access_token = access_token,
  access_secret = access_token_secret)

key <- "코로나"
key <- enc2utf8(key)
result <- search_tweets(key, n=100, token = twitter_token)
str(result)
content <- result$text
content
View(result)
content <- gsub("[[:lower:][:upper:][:punct:][:cntrl:]]", "", content)   
content <- na.omit(content)
write(content, 'output/twitter.txt')

# 문제 3
library(XML)
API_key  <- "%2BjzsSyNtwmcqxUsGnflvs3rW2oceFvhHR8AFkM3ao%2Fw50hwHXgGyPVutXw04uAXvrkoWgkoScvvhlH7jgD4%2FRQ%3D%3D"
bus_No <- "360"
url <- paste("http://ws.bus.go.kr/api/rest/busRouteInfo/getBusRouteList?ServiceKey=", API_key, "&strSrch=", bus_No, sep="")
doc <- xmlParse(url, encoding="UTF-8")
top <- xmlRoot(doc)
top
df <- xmlToDataFrame(getNodeSet(doc, "//itemList"))
df
df.360 <- 
str(df)
View(df)
df[df$busRouteNm==360, "busRouteId"]
my.print <- paste0('[360번 버스 정보]\n노선ID : ', df[df$busRouteNm==360, 'busRouteId'],
                   '\n노선길이 : ', df[df$busRouteNm==360, 'length'],
                   '\n기점 : ', df[df$busRouteNm==360, 'stStationNm'],
                   '\n종점 : ', df[df$busRouteNm==360, 'edStationNm'], 
                   '\n배차간격 : ', df[df$busRouteNm==360, 'term'])

write(my.print, 'output/bus.txt')

# 문제 4
library(jsonlite)
library(httr)
searchUrl<- "https://openapi.naver.com/v1/search/news.json"
Client_ID <- "izGsqP2exeThwwEUVU3x"
Client_Secret <- "WrwbQ1l6ZI"
query <- URLencode(iconv("빅데이터","euc-kr","UTF-8"))
url <- paste0(searchUrl, "?query=", query, "&display=100")
doc <- GET(url, add_headers("Content_Type" = "application/json",
                            "X-Naver-client-Id" = Client_ID, "X-naver-Client-Secret" = Client_Secret))
json_data <- content(doc, type = 'text', encoding = "UTF-8")
json_obj <- fromJSON(json_data)
df <- data.frame(json_obj)
df <- c(df[, 'items.title'])
View(df) 
df <- gsub("(</?b>)|&quot;|&gt;", "", df)
df <- data.frame(df)
View(df)
write(text, 'output/navernews.txt')

