library(ggplot2)
library(dplyr)

# 문제 1
# 1-1
str(mpg)
# 1-2
dim(mpg)
# 1-3
head(mpg, 10)
# 1-4
tail(mpg, 10)
# 1-5
View(mpg)
# 1-6
summary(mpg)
# 1-7
mpg %>% count(manufacturer)
# 1-8 (요구사항 무엇?)
View(mpg %>% group_by(manufacturer) %>% 
  count(model))


# 문제 2
# 2-1
mpg %>% rename(city=cty, highway=hwy)
# 2-2
head(mpg %>% rename(city=cty, highway=hwy))


# 문제 3
# 3-1 (?)
df <- data.frame(midwest)
str(df)
# 3-2
df <- df %>% rename(total=poptotal, asian=popasian)
# 3-3
df <- df %>% mutate(asian_ratio=(asian/total)*100) 
# 3-4  
avg <- mean(df[,'asian_ratio'])
df <- df %>% mutate(moreThanAvg=ifelse(asian_ratio>avg, "large", "small")) 


# 문제 4
# 4-1
mpg %>% filter(displ<=4) %>% summarise(mean(hwy))
mpg %>% filter(displ>=5) %>% summarise(mean(hwy))
cat("배기량 4이하인 자동차의 고속도로 연비가 평균적으로 더 좋다")

# 4-2
mpg %>% filter(manufacturer=="audi") %>% summarise(mean(cty))
mpg %>% filter(manufacturer=="toyota") %>% summarise(mean(cty))
cat("toyota 자동차의 도시 연비가 평균적으로 더 좋다")

# 4-3
chevrolet.hwy <- mpg %>% filter(manufacturer=="chevrolet") %>% summarise(mean(hwy))
ford.hwy <- mpg %>% filter(manufacturer=="ford") %>% summarise(mean(hwy))
honda.hwy <- mpg %>% filter(manufacturer=="honda") %>% summarise(mean(hwy))
as.numeric(ford.hwy)

total.hwy <- mean(as.numeric(chevrolet.hwy), as.numeric(ford.hwy), as.numeric(honda.hwy))
cat("전체 평균 :",total.hwy)


# 문제 5
# 5-1
mpg.new <- mpg %>% select(class, cty)
head(mpg.new)
View(mpg.new)

# 5-2
suv.cty <- mpg.new %>% filter(class=="suv") %>% summarise(mean(cty))
compact.cty <- mpg.new %>% filter(class=="compact") %>% summarise(mean(cty))
print("compact 자동차의 도시 연비가 더 좋다")


# 문제 6
mpg %>% filter(manufacturer=='audi') %>% arrange(desc(hwy)) %>% head(5)
