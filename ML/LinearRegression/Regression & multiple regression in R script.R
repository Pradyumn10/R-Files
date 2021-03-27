# import the Lungcapdata
LungCapdata=read.csv(file.choose(), header = T)
#Attach the Data
attach(LungCapdata)
#Check names
names(LungCapdata)
class(Age)
class(LungCap)
plot(Age, LungCap, main= "scatterpot")

pairs(LungCapdata[1:3])



#linear model
model= lm(LungCap~Age)
summary(model)

# Multiple Regression 
dt = sort(sample(nrow(LungCapdata), nrow(LungCapdata)*.7))
train<-LungCapdata[dt,]
test<-LungCapdata[-dt,]

head(train)
head(test)

attach(train)
# Multiple Regression
Reg=lm(LungCap ~ Age + Height + Smoke + Gender + Caesarean)
#Reg=lm(LungCap ~., data = LungCapdata)#
summary(Reg)
# attach test set
attach(test)
test

newTest <- subset( test, select = -LungCap )
head(newTest)
# Prediction
prediction=predict(Reg, newTest, interval="predict")
head(prediction)
prediction = as.data.frame(prediction)

# Error Calculation
se=(test$LungCap)-(prediction$fit)
head(se)
se


# Writing data to csv file
write.csv(prediction, file = "LungCap_predict.csv")

#calculate Pearson Corelation between Age and Height
cor(Age,Height,method='pearson')
#ask for confidence intervals for the model coefficients 
confint(model,conf.level=0.95)
