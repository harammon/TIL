library(tm)
v <- c('사과 포도 망고', '포도 자몽 자두', '복숭아 사과 포도',
        '오렌지 바나나 복숭아','포도 바나나 망고',
        '포도 귤 오렌지')

#듀크 <- c('사과 포도 망고')
#둘리 <- c('포도 자몽 자두')
#또치 <- c('복숭아 사과 포도')
#도우너 <- c('오렌지 바나나 복숭아')
#길동 <- c('포도 바나나 망고')
#희동 <- c('포도 귤 오렌지')
#fruit <- c(듀크, 둘리, 또치, 도우너, 길동, 희동)

# 벡터끼리 c()를 하면 그래도 벡터 유지? yes

cps <- VCorpus(VectorSource(v))
names(cps) <- c('듀크', '둘리','또치','도우너','길동','희동')
# tdm <- TermDocumentMatrix(cps)
# inspect(tdm)
dtm <- DocumentTermMatrix(cps, 
                          control=list(wordLengths = c(1, Inf)))
inspect(dtm)
dtm.mat <- as.matrix(dtm)

# 방법 1
termFreq <- colSums(dtm.mat)
a <- rbind(dtm.mat,termFreq)
# a[7,which.max(a[7,])] # 5개
most <- which(a[7,] == max(a[7,]))
# most
# a[7,most]

min <- which(a[7,] == min(a[7,]))
a[7,min]


# 방법 2
a2 <- termFreq[order(termFreq, decreasing=T)]
names(a2[1])


library(proxy)
com <- dtm.mat %*% t(dtm.mat)
print(com)
qqq <- dist(com, method = "cosine")  # 값이 0에 가까울수록 유사도 높음
dist(com, method = "Euclidean") # 값이 작을수록 유사도 높음(거리가 가까움)
c <- dist(com, method = "cosine")  # 값이 0에 가까울수록 유사도 높음

cat("좋아하는 과일이 가장 유사한 친구들 :", '듀크-또치, 듀크-길동', '\n')
cat("학생들에게 가장 많이 선택된 과일 :", names(most), a[7,most[1]],'개 \n')
cat("학생들에게 가장 적게 선택된 과일 :", names(min), a[7,min[1]],'개 \n')
