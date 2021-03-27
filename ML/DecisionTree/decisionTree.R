#decision tree
heart = read.csv(file.choose())
View(heart)
names(heart)

#converting in factor
nspFactor = as.factor(heart$NSP)
heart=cbind(heart, nspFactor)

#method 2 for converting
#heart$nspFactor= as.factor(heart$NSP)

str(heart)
set.seed(1234)
df = sample(2, nrow(heart), replace = T, prob = c(0.8, 0.2))
train = heart[df==1,]
test = heart[df==2,]

View(test)

install.packages("party")

library(party)


model = ctree(nspFactor ~ LB+AC+FM, data=train)
print(model)
model

plot(model,type="simple")

#tree pruinig
model = ctree(nspFactor ~ LB+AC+FM, data=train, controls=ctree_control(mincriterion = 0.9,minsplit=500))

#misclassification error
tab = table(predict(model),train$nspFactor)
print(tab)
1-sum(diag(tab))/sum(tab)

predict(model,test, type="prob")

prediction = predict(model,newdata=test)
prediction

tab3 = table(prediction,test$nspFactor)
print(tab3)
1-sum(diag(tab3))/sum(tab3)

model1 = ctree(nspFactor ~ LB+AC+FM, data=test, controls=ctree_control(mincriterion = 0.9,minsplit=500))

#missclassification error
tab1 = table(predict(model1),test$nspFactor)
print(tab1)
1-sum(diag(tab1))/sum(tab1)

#there is overfitting in model
#increase more testing data
#tree pruining

install.packages("rpart.plot")

library(rpart)
library(rpart.plot)
names(heart)

modelRpart = rpart(nspFactor~LB+AC+FM, data=train)
modelRpart

rpart.plot(modelRpart, type=2, extra=4)

ab = predict(modelRpart,data=test)
View(ab)

#misclassification error
tab2 = table(ab,train$nspFactor)
print(tab2)
1-sum(diag(tab2))/sum(tab2)
