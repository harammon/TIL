install.packages("geosphere")
library("geosphere")
library('dplyr')

getwd()
setwd("C:/Users/haram/rexam/")
main <- read.csv('공모전/SBJ_2102_002/1.수원시_버스정류장.csv', header = TRUE)
View(main)

metro <- read.csv('공모전/SBJ_2102_002/8.수원시_지하철역_위치정보.csv', header = TRUE)
View(metro)
nrow(unique(data.frame(main$정류장ID)))

air <- read.csv('공모전/SBJ_2102_002/11.수원시_대기오염도_측정현황.csv', header = TRUE)
View(air)
temp <- apply(air[,4:9], 2, as.numeric)
View(temp)
air[,4:9] <- temp

air_nomiss <- na.omit(air)
View(air_nomiss)

air_미세먼지 <- aggregate(air_nomiss[,4], by=list(air_nomiss$측정소), FUN=mean)
air_초미세먼지 <- aggregate(air_nomiss[,5], by=list(air_nomiss$측정소), FUN=mean)
air_오존 <- aggregate(air_nomiss[,6], by=list(air_nomiss$측정소), FUN=mean)
air_이산화질소 <- aggregate(air_nomiss[,7], by=list(air_nomiss$측정소), FUN=mean)
air_아황산가스 <- aggregate(air_nomiss[,8], by=list(air_nomiss$측정소), FUN=mean)
air_일산화탄소 <- aggregate(air_nomiss[,9], by=list(air_nomiss$측정소), FUN=mean)

temp2 <- data.frame(air_미세먼지[,1], air_미세먼지[,2], air_초미세먼지[,2], air_오존[,2], 
                    air_이산화질소[,2], air_아황산가스[,2], air_일산화탄소[,2],
                    air$lon, air$lat)
temp3 <- temp2[1:8,]
names(temp2) = c('측정소', '미세먼지', '초미세먼지', '오존', '이산화질소', '아황산가스', '일산화탄소', 'lon', 'lat')
View(temp3)

distGeo(c(128.1, 38.1),
        c(128.2, 38.2))
print(main[1,'lon'])
t <- c()
nrow(metro)
for(i in 1:nrow(main)){
  nearest <- 10000
  for(j in 1:nrow(metro)){
    a <- distGeo(c(main[i, 'lon'], main[i, 'lat']), c(metro[j,'lon'], metro[j, 'lat']))
    if(a<nearest){
      nearest <- a 
    }
  }
  t <- append(t, nearest)
}
main$dist_station = t
main <- main %>% mutate('근처 역 여부' = ifelse(main$dist_station<=100, 'YES', 'NO'))
View(main)


t1 <- c();t2 <- c();t3 <- c();t4 <- c();t5 <- c();t6 <- c();t7 <- c();t8 <- c();t9 <- c();
for(i in 1:nrow(main)){
  nearest <- 10000
  for(j in 1:nrow(temp3)){
    a <- distGeo(c(main[i, 'lon'], main[i, 'lat']), c(temp3[j,'lon'], temp3[j, 'lat']))
    if(a<nearest){
      nearest <- a
      측정소 <- temp3[j, '측정소']
      미세먼지 <- temp3[j, '미세먼지']
      초미세먼지 <- temp3[j, '초미세먼지']
      오존 <- temp3[j, '오존']
      이산화질소 <- temp3[j, '이산화질소']
      아황산가스 <- temp3[j, '아황산가스']
      일산화탄소 <- temp3[j, '일산화탄소']
      lon <- temp3[j, 'lon']
      lat <- temp3[j, 'lat']
    }
  }
  t1 <- append(t1, 측정소)
  t2 <- append(t2, 미세먼지)
  t3 <- append(t3, 초미세먼지)
  t4 <- append(t4, 오존)
  t5 <- append(t5, 이산화질소)
  t6 <- append(t6, 아황산가스)
  t7 <- append(t7, 일산화탄소)
  t8 <- append(t8, lon)
  t9 <- append(t9, lat)
}

main$측정소 = t1
main$미세먼지 = t2
main$초미세먼지 = t3
main$오존 = t4
main$이산화질소 = t5
main$아황산가스 = t6
main$일산화탄소 = t7
main$측정소경도 = t8
main$측정소위도 = t9
View(main)





write.csv(main, '하람.csv', row.names=FALSE)



