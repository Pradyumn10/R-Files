library(caret)
library(randomForest)
library(e1071)

#importing data
heart = read.csv(file.choose())

View(heart)
names(heart)

heart$NSP = as.factor(heart$NSP)
str((heart))

#splitting the data
set.seed(1234)
df = sample(2, nrow(heart), replace = T, prob=c(0.7 , 0.3))
train =heart[df==1,]
test =heart[df==2,]

View(test)

#random forest
set.seed(222)
rf = randomForest(NSP~ . , data=train)
rf

rf1 = randomForest(NSP~ . , data=train, ntree=600, mtry=7, importance=T, proximity=TRUE)
rf1
attributes(rf1)

attributes(rf1)

View(rf1$votes)

#predictions
pred = predict(rf1, train)
head(pred)
head(train$NSP)

#confusion metrix
table(pred, train$NSP)

confusionMatrix(pred, train$NSP)

pred1 = predict(rf1,test)
head(pred1)
head(test$NSP)

confusionMatrix(pred1,test$NSP)

# Error rate of Random Forest
rf1
plot(rf1)

# Tune mtry
t <- tuneRF(train[,-22], train[,22],
            stepFactor = 0.5,
            plot = TRUE,
            ntreeTry = 600,
            trace = TRUE,
            improve = 0.05)

# No. of nodes for the trees
hist(treesize(rf1),
     main = "No. of Nodes for the Trees",
     col = "green")

# Variable Importance
varImpPlot(rf1,
           sort = T,
           n.var = 10,
           main = "Top 10 - Variable Importance")
importance(rf1)
varUsed(rf1)

# Partial Dependence Plot
partialPlot(rf1, train, ASTV, "2")

# Extract Single Tree
getTree(rf1, 1, labelVar = TRUE)

# Multi-dimensional Scaling Plot of Proximity Matrix
MDSplot(rf1, train$NSP)
