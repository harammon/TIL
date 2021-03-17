library('dplyr')

getwd()
setwd('C:/Users/haram/rexam')
df <- read.csv('data/purifier.csv')

df <- df %>%
  mutate(new_purifier = purifier-old_purifier) 

model <-lm (as_time ~ new_purifier + old_purifier, data = df)
summary(model)
time.predict <- predict.lm(model, newdata = data.frame(old_purifier=70000, new_purifier=230000))

man.month <- 8*20
time.predict / man.month

print("234명 고용 필요")