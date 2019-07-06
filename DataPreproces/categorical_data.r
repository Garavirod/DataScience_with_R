#DIviding data in traing set and testing set
install.packages('caTools')
library(caTools)

#Reading dtaset
dataset = read.csv("Data.csv")


#Coding the categorical data
dataset$Country = factor(dataset$Country,
                         levels=c("France","Spain","Germany"),
                         labels = c(1,2,3))

dataset$Purchased = factor(dataset$Purchased,
                            levels = c("No","Yes"),
                            labels = c(0,1))


