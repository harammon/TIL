# 문제 1
L1 <- list(name = 'scott',
           sal = 3000)
result <- L1$sal*2
print(result)

# 문제 2
L2 <- list('scott',
           c(100, 200, 300))

print(L2)

# 문제 3
L3 <- list(
  c(3, 5, 7),
  c('A', 'B', 'C')
)
L3[[2]][1] <- 'C'
print(L3)

# 문제 4
L4 <- list(
  alpha=0:4,
  beta=sqrt(1:5),
  gamma=log(1:5))
print(L4)
print(L4$alpha+10)

print(emp)

# 문제 5
L5 <- list(
  data1=LETTERS[1:26],
  data2=emp[1:3,],
  data3=L4
)
print(L5)

# 문제 6
L6 <- list(
  math=list(95, 90), 
  writing=list(90, 85), 
  reading=list(85, 80))
score_sum <- sum(unlist(L6))
print(score_sum/6)

# 문제 7
grade <- sample(1:6, 1)
if(grade==1|grade==2){
  cat(grade,'학년은 저학년입니다.')
}else{
  cat(grade,"학년은 고학년입니다.")
}

# 문제 8
choice <- sample(1:5, 1)
if(choice==1){
  result <- 300+50
}else if(choice==2){
  result <- 300-50
}else if(choice==3){
  result <- 300*50
}else if(choice==4){
  result <- 300/50
}else{
  result <- 300%%50
}
cat("결과값 :", result)

choice <- as.character(sample(1:5, 1))
switch(choice, 
       '1'=result <- 300+50,
       '2'=result <- 300-5,
       '3'=result <- 300*50,
       '4'=result <- 300/50,
       '5'=result <- 300%%50
       )
cat("결과값 :", result)

# 문제 9
count <- sample(3:10, 1)
deco <- as.character(sample(1:3, 1))
switch(deco,
       '1'=a <- '*',
       '2'=a <- '$',
       '3'=a <- '#'
       )
for(i in 1:count){
  cat(a,sep="")
}

# 문제 10
score <- sample(0:100, 1)
level <- switch(as.character(score%/%10),
                '10' = ,'9' = 'A 등급', 
                '8' = 'B 등급', 
                '7' = 'C 등급', 
                '6' = 'D 등급', 
                'F 등급')
print(paste(score,"점은",level,"입니다."))

# 문제 11
alpha <- paste(LETTERS[1:26], letters[1:26], sep="")
print(alpha)