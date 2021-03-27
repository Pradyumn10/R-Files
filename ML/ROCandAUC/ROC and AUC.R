#Read data file
binary <- read.csv(file.choose(), header = T)
str(binary)

#Multinomial Logistic regression
library(nnet)
mymodel<-multinom(admit~., binary)
summary(mymodel)

# Misclassification Rate
p = predict(mymodel, binary)
tab = table(p, binary$admit)
tab
1-sum(diag(tab))/sum(tab)

table(binary$admit)

library(ROCR)
pred = predict(mymodel, binary, type = 'prob')
head(pred)
hist(pred)
# ROC
pred = prediction(pred, binary$admit)
eval = performance(pred, "acc")
plot(eval)
abline(h=0.71, v=0.45)

# Idetify best values
max = which.max(slot(eval, 'y.values')[[1]])
acc = slot(eval,'y.values')[[1]][max]
cut = slot(eval, 'x.values')[[1]][max]
print(c(Accuracy = acc , Cutoff = cut))


# ROC
pred = predict(mymodel, binary, type = 'prob')
pred = prediction(pred, binary$admit)
roc = performance(pred, "tpr", 'fpr')     

plot(roc,
     colorize = T,
     Main = 'ROC')
abline(a=0, b=1)


#AUC
auc = performance(pred, 'auc')
auc = unlist(slot(auc, 'y.values'))
auc

auc = round(auc, 3)
auc
legend(.6,.2, auc, title = 'AUC', cex = 1)
