library(dplyr)
library(e1071)
library(caret)
library(ROSE)
library(randomForest)
library(ggplot2)

#hw : analytics vidhya wala data or roc-auc(same)
#PCA, K-means
#hadnling imbalance
X = read.csv(file.choose())
X
str(X)
View(X)

X$admit = as.factor(X$admit)
barplot(prop.table(table(X$admit)), col=rainbow(2)) #probability table of admit

#Splitting the data
ind = sample(2,nrow(X),replace=T, prob=c(0.7,0.3))
train = X[ind==1,]
test = X[ind==2,]
View(train)
View(test)

prop.table(table(train$admit))
prop.table(table(test$admit))

summary(train)

rose <- ROSE(admit~., data = train, N = 500, seed=111)$data
table(rose$admit)
summary(rose)

model4 = randomForest(admit~. , rose)
#confusion matrix
confusionMatrix(predict(model4,test),test$admit, positive = "1")


both <- ovun.sample(admit~., data=train, method = "both", p = 0.5, seed = 222, N = 271)$data
table(both$admit)
summary(both)

model3 = randomForest(admit~. , both)
#confusion matrix
confusionMatrix(predict(model3,test),test$admit, positive = "1")


under = ovun.sample(admit~., data = train, method = "under", N = 166)$data
table(under$admit)
summary(under)

model2 = randomForest(admit~. , under)
#confusion matrix
confusionMatrix(predict(model2,test),test$admit, positive = "1")

#Predictive Modeling
over <- ovun.sample(admit~., data = train, method = "over", N = 376)$data
table(over$admit)
summary(over)

model1 = randomForest(admit~. , over)
summary(model1)

#confusion matrix
confusionMatrix(predict(model1,test),test$admit, positive = "1")

#creating Random Forest
model = randomForest(admit~., train)
summary(model)

#confusion matrix
confusionMatrix(predict(model,test),test$admit, positive = "1")

