#Multiple Lienar regresion


#Reading dtaset
dataset = read.csv("50_Startups.csv")

#Coding the categorical data in State
dataset$State = factor(dataset$State,
                         levels=c("New York","Florida","California"),
                         labels = c(1,2,3))


#Dividing data in set trining and set test
library(caTools)
set.seed(123)
split = sample.split(dataset$Profit, SplitRatio = 0.8) 
training_set = subset(dataset,split == TRUE)
testing_set = subset(dataset,split == FALSE) 

#Adjust the multiple linear regresion model with the set training
regression = lm(formula = Profit ~ . , data = training_set) #Profit is the dependent variable and "." all the rest (idependientes)

#Perdict results with testing set
#Per each yaer of experience the employer gain 9365
y_pred = predict(regresor, newdata = testing_set)

#Representation of the least squares line
install.packages("ggplot2")
library(ggplot2)
ggplot() +
  geom_point(aes(x=training_set$YearsExperience, y=training_set$Salary), 
             color="red") +
  geom_line(aes(x = training_set$YearsExperience, 
                y = predict(regresor, newdata = training_set)),
            colour="yellow") +
  ggtitle("Salary VS Experience Years (Training Set)")+
  xlab("Experience years")+
  ylab("Salary (USD $)")

#Data Visualization of linear regresion
PrintLinearRegresion<-function(xp,yp,xl,yl,colorp,colorl,title,xlabel,ylabel){
  ggplot() +
    geom_point(aes(x=xp, y=yp), 
               color=colorp) +
    geom_line(aes(x = xl, 
                  y = yl),
              colour=colorl) +
    ggtitle(title)+
    xlab(xlabel)+
    ylab(ylabel)
}

#Print training set
PrintLinearRegresion(
  training_set$YearsExperience,
  training_set$Salary,
  training_set$YearsExperience,
  predict(regresor, newdata = training_set),
  "red",
  "yellow",
  "Salary VS Experience Years (Training Set)",
  "Experience years",
  "Salary (USD $)")

#Print testing set
PrintLinearRegresion(
  testing_set$YearsExperience,
  testing_set$Salary,
  testing_set$YearsExperience,
  predict(regresor, newdata = testing_set),
  "blue",
  "green",
  "Salary VS Experience Years (Training Set)",
  "Experience years",
  "Salary (USD $)")