# 문제 1
v1 <- sample(1:30, size = 10, replace=T)
names(v1) <- letters[26:17]
print(v1)

# 문제 2
v <- seq(10, 38, 2)
m1 <- matrix(v, nrow=3, byrow=T)
#print(m1)
m2 <- m1+100
m_max_v <- max(m1)
m_min_v <- min(m1)
row_max <- apply(m1, 1, max)
col_max <- apply(m1, 2, max)
cat('m1 : ',m1,'\nm2 : ',m2,'\nm_max_v : ',m_max_v,'\nm_min_v : ',m_min_v,'\nrow_max : ',row_max,'\ncol_max : ',col_max, sep = " ")

# 문제 3
(m2 <- matrix(1:9, nrow=3))

#문제 4
(m3 <- matrix(1:9, nrow=3, byrow=T))

#문제 5
m4 <- m3
rownames(m4) <- c('row1','row2','row3')
colnames(m4) <- c('col1','col2','col3')
(m4)

#문제 6
alpha <- matrix(letters[1:6], nrow=2)
(alpha2 <- rbind(alpha, c('x','y','z')))
(alpha3 <- cbind(alpha, c('s','p')))

#문제 7
a <- array(1:24, dim=c(2,3,4))
(a)
print(a[2,3,4])
print(a[2,,])
print(a[,1,])
print(a[,,3])
print(a[2,,])
print(a+100)
print(a[,,4]*100)
print(a[1,2:3,])
a[2,,2] <- a[2,,2]+100
print(a[,,2])
a[,,1] <- a[,,1]-2
print(a[,,1])
(a <- a*10)
rm(a)