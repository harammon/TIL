library(fmsb)

getwd()
setwd("C:/Users/haram/rexam")

a <- read.csv('data/picher_stats_2017.csv', encoding='UTF-8')
View(a)
max.삼진 <- max(a$삼진.9)
max.볼넷 <- max(a$볼넷.9)
max.홈런 <- max(a$홈런.9)
max.score <- c(max.삼진, max.볼넷, max.홈런)
min.score <- c(0, 0, 0)

b <- a[a$선수명=="임창용", c("삼진.9", "볼넷.9", "홈런.9")]
names(b) <- c("삼진", "볼넷", "홈런")
df <- rbind(max.score, min.score, b)
str(df)
radarchart(df)
radarchart(df,                         
           pcol='red',           
           pfcol=rgb(0.5,0.2,0.2,0.3),   
           plwd=3,                       
           cglcol='grey',                
           cglty=1,                      
           cglwd=0.8,                    
           axistype=1,                  
           seg=4,                                                 
           axislabcol='grey',           
           caxislabels=seq(0,100,25),    
           title="임창용 선수의 성적"
)
dev.copy(png, "output/lab19.png")
dev.off()