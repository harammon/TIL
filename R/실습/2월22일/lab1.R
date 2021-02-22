# 문제1
v1 <- 1:10
v2 <- v1*2
max_v <- max(v2)
min_v <- min(v2)
avg_v <- mean(v2)
sum_v <- sum(v2)
v3 <- v2[-5]
cat("v1 : ", v1, "\nv2 :",v2, "\nv3 :", v3, "\nmax_v :", max_v, "\nmin_v :", min_v, "\navg_v :", avg_v, "\nsum_v :", sum_v)

# 문제2
v4 <- seq(1, 9, 2)
v5 <- rep(1, 5)
v6 <- rep(c(1:3), 3)
v7 <- rep(seq(1, 4, 1), each=2)
cat("v4 :", v4, "\nv5 :",v5, "\nv6 :", v6, "\nv7 :", v7 )

# 문제3
nums <- sample(x=1:100, size=10)
#print(nums)
print(sort(nums))
print(sort(nums, decreasing = T))
print(nums[nums>50])
print(nums[nums<=50])
print(index)
print(which(nums==max(nums)))
print(which(nums==min(nums)))

# 문제4
v8 <- seq(1, 10, 3)
names(v8) <- LETTERS[1:4]
print(v8)

# 문제 5
score <- sample(x=1:20, size=5)
myFriend <- c("둘리", "또치", "도우너", "희동", "듀크")
print(paste(score, myFriend, sep="-"))
names(score) <- myFriend
names(score[which.max(score)])
names(score[which.min(score)])
names(score[which(score>10)])

# 문제 6
count <- sample(x=1:100, size=7)
week.korname <- c("일요일", '월요일', '화요일', '수요일', '목요일', '금요일', '토요일')
#print(week.korname)
paste(week.korname, count, sep=" : ")
names(count) <- week.korname
names(count[which.max(count)])
names(count[which.min(count)])
names(count[which(count>50)])