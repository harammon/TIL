# 문제 1
countEvenOdd <- function(v){
  even <- 0
  odd <- 0
  for(i in v){
    if(!is.numeric(i)){
      return(NULL)
    }else if(i%%2==0){
      even <- even+1
    }else{
      odd <- odd+1 
    }
  }
  my.list <- list(even=even,
                  odd=odd)
  return(my.list)
}
countEvenOdd(c(2, 3, 4, 5))


# 문제 2
vmSum <- function(v){
  sum <- 0
  if(is.vector(v)){
    for(i in v){
      if(!is.numeric(i)){
        print("숫자 벡터를 전달하세요.")
        return(0)
      }else{
        sum <- sum+i
      }
    }
    return(sum)
  }else{
    print("벡터를 전달하세요.")
    return(0)
  }
}
vmSum(c(1, 2, 3))


# 문제 3
varSum2 <- function(v){
  sum <- 0
  if(is.vector(v)&!is.list(v)){
    for(i in v){
      if(!is.numeric(i)){
        warning('숫자 벡터를 전달하세요.')
        return(0)
      }else{
        sum <- sum+i
      }
    }
    return(sum)
  }else{
    stop("벡터만 전달하세요.")
  }
}
varSum2(list())


# 문제 4  na.rm=TRUE
mySum <- function(v){
  oddSum <- 0
  evenSum <- 0
  if(is.vector(v)&!is.list(v)){
    for (i in v){
      if(is.null(i)){
        return(NULL)
      }else if(is.na(i)){
        warning('NA를 최저값으로 변경하여 처리함!')
        i <- min(v, na.rm = TRUE)
      }
      if(is.numeric(i)){
        if(i%%2==0){
          evenSum <- evenSum+i
        }else{
          oddSum <- oddSum+i
        }
      }else{
        stop("숫자 벡터만 처리 가능")
      }
    }
    return (mylist <- list(evenSum=evenSum, oddSum=oddSum))
  }else{
    stop("벡터만 처리 가능")
  }
}
mySum(c(1, 2, 3, NA))


# 문제 5
my.func1 <- function(v){
  return(v)
}
myExpr<- function(f){
  if(!is.function(f)){
    stop("수행 거부")
  }else{
    temp <- sample(1:45, 6)
    result <- sum(f(temp))
    return (result)
  }
}
# my.func1(5)
myExpr(my.func1)
# is.function(my.func1(5))


# 문제 6
createVector1 <- function(...){
  result <- c(...)
  if(length(result)==0){
    return(NULL)
  } else{
    for (i in result){
      if (is.na(i)){
        return(NA)
      }
    }
    return(result)
  }
}
createVector1()


# 문제7
createVector2 <- function(...){
  result <- list(...)
  v.numeric <- c()
  v.character<- c()
  v.bool<- c()
  if(length(result)==0){
    return(NULL)
  }else{
    for(i in result){
      if(is.numeric(i)){
        v.numeric <- c(v.numeric, i)
        }else if(is.character(i)){
          v.character <-c(v.character, i)
      }else if (is.logical(i)){
        v.bool <-c(v.bool, i)
      }
    }
  }
  return (list(v.numeric, v.character, v.bool))
}
createVector2(1, 2, 3, 'a', T, F, 'B', 100)