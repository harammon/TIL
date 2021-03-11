library(dplyr)

emp <- read.csv('data/emp.csv')
# empno,ename,job,mgr,hiredate,sal,comm,deptno

# 문제 1
str(emp)
emp %>% filter(job=='MANAGER')  

# 문제 2
emp %>% select(empno, ename, sal)

# 문제 3
emp %>% select(-empno)

# 문제 4
emp %>% select(ename, sal)

# 문제 5
emp %>% count(job)

# 문제 6
emp %>%
  filter(sal>=1000 , sal<=3000) %>% 
  select(ename, sal, empno)

emp %>%
  select(ename, sal, empno) %>% 
  filter(sal>=1000 & sal<=3000) 

# 문제 7
emp %>% 
  filter(job!='ANALYST') %>% 
  select(ename, job, sal)

# 문제 8
emp %>% 
  filter(job=='SALESMAN'| job=='ANALYST') %>% 
  select(ename, job)

# 문제 9 (안배우지 않았나??)
emp %>% 
  group_by(deptno) %>% 
  summarise(sum_sal=sum(sal))

# 문제 10
emp %>% 
  arrange(sal)

# 문제 11
emp %>% 
  arrange(desc(sal)) %>% 
  head(1)

# 문제 12
empnew <- emp %>% 
  rename(salary=sal, commrate=comm)
# 틀린 표현
emp %>% mutate(salary=sal, commrate=comm)

# 문제 13
# 어려웠음!
emp %>% count(deptno) %>% max()
emp %>% count(deptno) %>% max # 모두 가능

# 문제 14
emp %>% mutate(enamelength=nchar(ename)) %>% 
  arrange(enamelength)

# 문제 15 
# 어려웠음!
# is.na
emp %>% filter(!is.na(comm)) %>% count
emp %>% filter(comm != 'NA') %>% count