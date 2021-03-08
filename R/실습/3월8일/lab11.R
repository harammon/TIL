library(RSelenium)
remDr <- remoteDriver(remoteServerAddr = "localhost", port = 4445, browserName = "chrome")
remDr$open()
Sys.sleep(2)
remDr$navigate("http://gs25.gsretail.com/gscvs/ko/products/event-goods")
Sys.sleep(2)

btn.node <- remDr$findElement(using='css selector', '#TWO_TO_ONE')
btn.node$clickElement()
Sys.sleep(1)
goodsname=NULL
goodsprice=NULL
while(T){
  goodsname.nodes <- remDr$findElements(using='css selector', '#contents > div.cnt > div.cnt_section.mt50 > div > div > div:nth-child(5) > ul > li > div > p.tit')
  goodsname.temp <- sapply(goodsname.nodes, function(x) {x$getElementText()})
  goodsname <- c(goodsname, goodsname.temp)
  goodsprice.nodes <- remDr$findElements(using='css selector', '#contents > div.cnt > div.cnt_section.mt50 > div > div > div:nth-child(5) > ul > li > div > p.price > span')
  goodsprice.temp <- sapply(goodsprice.nodes, function(x) {x$getElementText()})
  goodsprice <- c(goodsprice, goodsprice.temp)
  
  # print(goodsname)
  # print(goodsprice)
  # 현재 페이지 번호
  on.node <- remDr$findElement(using='css selector', '#contents > div.cnt > div.cnt_section.mt50 > div > div > div:nth-child(5) > div > span > a.on')
  on.node.text <- on.node$getElementText()
  print(on.node.text[[1]])
  # 다음 클릭
  next.node <- remDr$findElement(using='css selector', '#contents > div.cnt > div.cnt_section.mt50 > div > div > div:nth-child(5) > div > a.next')
  next.node$clickElement()
  Sys.sleep(1)
  # 다음 페이지 번호
  next.node <- remDr$findElement(using='css selector', '#contents > div.cnt > div.cnt_section.mt50 > div > div > div:nth-child(5) > div > span > a.on')
  next.node.text <- next.node$getElementText()
  print(next.node.text)
  if (on.node.text[[1]]==next.node.text[[1]])
    break
}
df <- data.frame(unlist(goodsname), unlist(goodsprice))
View(df)
colnames(df) <- c('goodsname', 'goodsprice')
getwd()
setwd("C:/Users/haram/rexam")
write.csv(df, 'output/gs25_twotoone.csv', row.names = F)
