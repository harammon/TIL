library(ggplot2)

# 문제 1
str(airquality)
View(airquality)
# 결측치 제거 - > na.omit()과 complete.cases는 같은 역할!!
a <- na.omit(airquality) 
View(a)
b <- airquality[complete.cases(airquality),]
View(b)

# 방법 1
air.cor <- airquality[, c('Ozone', 'Solar.R', 'Wind', 'Temp')]
cor(air.cor, use="complete.obs")

# 방법 2 -> 결측값 행 삭제 후 진행
air.cor2 <- a[, c('Ozone', 'Solar.R', 'Wind', 'Temp')]
c <- cor(air.cor2)

# 검정
library(psych)
corr.test(air.cor2)

# 상관행렬 출력하기
# result1
pairs(air.cor2)
dev.copy(png, "output/lab20-1.png")
dev.off()

# result2
library(psych)
pairs.panels(air.cor2, bg="red", pch=21, hist.col="gold", 
             main="Correlation Plot of airquality Data")
dev.copy(png, "output/lab20-2.png")
dev.off()

# result3
library(corrplot)
corrplot(c, method="pie", type="lower", order="hclust", tl.srt=45, diag=F, addCoef.col="black")
dev.copy(png, "output/lab20-3.png")
dev.off()


