# 문제 1
exam1 = function(){
  result <- paste(LETTERS[1:26], letters[1:26], sep="")
  return(result)
}
exam1()

# 문제 2
exam2 <- function(num){
  result=0
  for( i in 1:num){
    result = result + i
  }
  return(result)
}
print(exam2(5))

# 문제 3
exam3 <- function(a, b){
  if(a>=b){
    return (a-b)
  }else
    return(b-a)
}
print(exam3(20, 25))

# 문제 4
exam4 <- function(a, b, c){
  result = 0
  switch(c,
         '+'=result <- a+b,
         '-'=result <- a-b,
         '*'=result <- a*b,
         '%/%'=ifelse(a==0, result <- '오류1', ifelse(b==0, result <- '오류2', result <- a%/%b)),
         '%%'=ifelse(a==0, result <- '오류1', ifelse(b==0, result <- '오류2', result <- a%%b)),
         result <- '규격의 연산자만 전달하세요.')
  return (result)
}
print(exam4(10,0,'%%'))

# 문제 5
exam5 <- function(num, char='#'){
  if(num<0) return(NULL)
  for(i in 1:num){
    cat(char, sep="")
  }
}
exam5(10, '*')

#문제 6
exam6 <- function(v){
  for(i in v){
    if(is.na(i)){
      result=paste('NA는 처리 불가')
    }
    else if(100>=i & i>=85){
      result=paste(i, '점은 상등급입니다.')
    }else if(i>=70){
      result=paste(i, '점은 중등급입니다.')
    }else if(70>i & i>=0){
      result=paste(i, '점은 하등급입니다.')
    }
    print(result)
  }
}
exam6(c(80, NA, 50, 70, '123', 35, NA))
