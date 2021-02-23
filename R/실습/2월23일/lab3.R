# 문제 1
str(iris)

# 문제 2
df1 <- data.frame(
  x = c(1, 2, 3, 4, 5),
  y = c(2, 4, 6, 8, 10)
)
print(df1)

# 문제 3
df2 <- data.frame(
  col1 = 1:5,
  col2 = letters[1:5],
  col3 = 6:10
)
print(df2)

# 문제 4
a <- c('사과', '딸기', '수박')
b <- c(1800, 1500, 3000)
c <- c(24, 38, 13)
df3 <- data.frame(a, b, c)
colnames(df3) <- c('제품명', '가격', '판매량')
print(df3)

# 문제 5
d <- mean(df3$가격)
e <- mean(df3$판매량)
cat("가격 평균 :", d, '\n판매량 평균 : ',e)

# 문제 6
name <- c('Potter', 'Elsa', 'Gates', 'Wendy', 'Ben')
gender <- factor(c('M', 'F', 'M', 'F', 'M'))
math <- c(85, 76, 99, 88, 40)
df4 <- data.frame(name, gender, math)
summary(df4)
head(df4)
#a
stat <- c(76, 73, 95, 82, 35)
df4$stat <- stat
#b
df4$score <- df4$math + df4$stat 
print(df4)
#c
df4$grade <- ifelse(df4$score>=150,'A',
                    ifelse(df4$score>100, 'B',
                           ifelse(df4$score>70, 'C', 'D')))
(df4)

setwd('C:/Users/haram/rexam')
myemp <- read.csv('data/emp.csv')

# 문제 7
str(myemp)

# 문제 8
myemp[c(3, 4, 5),]

# 문제 9
subset(myemp, select=-mgr)

# 문제 10
myemp["ename"]

# 문제 11
myemp[c('ename', 'sal')]

# 문제 12
subset(myemp, job=='SALESMAN', select=c(ename, sal, job))

# 문제 13
subset(myemp, sal>=1000 & sal<=3000, select=c(ename, sal, deptno))       

# 문제 14
subset(myemp, job != 'ANALYST', select = c(ename, job, sal))

# 문제 15
subset(myemp, job == 'SALESMAN' | job == 'ANALYST', select=c(ename, job))

# 문제 16
subset(myemp, is.na(comm), select=c(ename, sal))

# 문제 17
myemp[order(myemp$sal), ]

# 문제 18
dim(myemp)

# 문제 19
table(myemp$deptno)

# 문제 20
table(myemp$job)