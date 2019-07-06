install.packages('caTools')
library(caTools)

#Reading dtaset
dataset = read.csv("Data.csv")
#Subset of data
dataset = dataset[,2:3] #no rows, columns from 2 to 3

#Dividing data in set trining and set test
set.seed(123)
split = sample.split(dataset$Purchased, SplitRatio = 0.8)
training_set = subset(dataset,split ==TRUE)
testing_set = subset(dataset,split==FALSE) 
#Scaling data means defining data in range values
#Evitar que nas variables dominen sobre otras


training_set[,2:3] = scale(training_set[,2:3])
testing_set[,2:3] = scale(testing_set[,2:3])