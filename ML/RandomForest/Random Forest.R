library(faraway)
library(nnet)
library(randomForest)
library(caret)
library(e1071)

View(lung)
lung = lung
names(lung)
str(lung)

#creating logistic model
model = lm(LungCap ~ . , data=lung)
model

#checking multi-colinearity
vif(model)
#check accuracy by removing afe or height

cardio = read.csv(file.choose())
View(cardio)

nsf = as.factor(cardio$NSP)
cardio = cbind(cardio, nsf)
#other method
#mutate(cardio, nsf=as.factor(cardio$NSP))

cardio$out<-relevel(cardio$nsf, ref="1")

cardio$out<-relevel(cardio$nsf, ref="1")

mymodel = multinom(out~LB+FM+AC, data=cardio)
mymodel

names(cardio)
#taking 3, 100 and 400th row for prediction
predict(mymodel, cardio[ c(3,100,400), ] , type="prob")

#misclassification error
ab = table(predict(mymodel), cardio$nsf)
print(ab)
#error %
(1-sum(diag(ab))/sum(ab))*100

