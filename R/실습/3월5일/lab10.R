library(RSelenium)
remDr <- remoteDriver(remoteServerAddr = "localhost" , port = 4445, browserName = "chrome") # 기동 시켜놓은 셀레니움 서버에 접속하는 역할
remDr$open()# 크롬 브라우저 동작
remDr$navigate("https://hotel.naver.com/hotels/item?hotelId=hotel:Shilla_Stay_Yeoksam&destination_kor=%EC%8B%A0%EB%9D%BC%EC%8A%A4%ED%85%8C%EC%9D%B4%20%EC%97%AD%EC%82%BC&rooms=2") # 통제되는 브라우저에 의해 랜더링 수행 -> 자바스크립트도 수행
reply_v <- NULL
while(TRUE){
  reply<-remDr$findElements(using='css selector','div.review_ta.ng-scope > ul > li> div.review_desc')
  reply <- sapply(reply,function(x){x$getElementText()})
  reply_v <- c(reply_v, unlist(reply))
  next.btn<-remDr$findElement(using='css selector','div.review_ta.ng-scope > div.paginate > a.direction.next')
  if(next.btn$getElementAttribute('class')=='direction next disabled'){
    break
  }else{
    next.btn$clickElement()
  }
  Sys.sleep(1)
}
print(reply_v)
write(reply_v, 'output/naverhotel.txt')