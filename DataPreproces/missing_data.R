install.packages('caTools')
library(caTools)

#Reading dtaset
dataset = read.csv("Data.csv")

#Treatment of missing data NA
dataset$Age = ifelse(is.na(dataset$Age),
                      ave(dataset$Age, FUN=function(x) mean(x,na.rm = TRUE),dataset$Age)
                     )
dataset$Salary = ifelse(is.na(dataset$Salary),
                        ave(dataset$Salary, FUN=function(x) mean(x,na.rm = TRUE),dataset$Salary)
                        )