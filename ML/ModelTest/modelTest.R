#data testParam
#importing libraries
library(dplyr)
library(ggplot2)
library(caret)
library(e1071)
library(randomForest)

#reading csv
testParam = read.csv(file.choose())
View(testParam)

#analyzing data
str(testParam)
View(summary(testParam))

testParam$label = as.factor(testParam$label)

barplot(table(testParam$label), col=rainbow(10))

#splitting the data
set.seed(123)
div = sample(2,nrow(testParam), replace = T, prob = c(0.7,0.3))
train = testParam[div==1,]
test = testParam[div==2,]

View(train)

#Random Forest
set.seed(123)
model1 = randomForest(label~. , data=train, ntree=600, mtry=7, importance=T, proximity=T)