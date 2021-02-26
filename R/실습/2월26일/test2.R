my.data <- scan('data/iotest2.txt', what='',encoding = 'UTF-8')
(my.data)
my.data.table <- table(my.data)
result1 <- names(result[which.max(my.data.table)])  # 방법 1
result2 <- names(which.max(my.data.table))  # 방법 2
cat("가장 많이 등장한 단어는 \'", result1, '\'입니다.', sep='')
