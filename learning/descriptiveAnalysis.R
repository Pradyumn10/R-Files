#descriptive statistics
library(dplyr)

#opening csv file methods
data = read.csv(file.choose())
data

#Lung Capacity Data
data1 = read.csv("LungCapData.csv")
data1

#For opening xls file import this library
#viewing data
View(data)

#for viewing column names
names(data)

#viewing specific column
View(data$LungCap)
data$LungCap

#attaching specific column
attach(data)
LungCap

#unattaaching

#summary of the dataset (same as describe)
summary(data)

#mean
mean(data$LungCap)
mean(LungCap)
mean(data$Age)
#tapply(Age,Height, mean)

class(data)
class(Age)
class(Height)
class(LungCap)

#median
median(LungCap)
median(Age)

#variance
b=var(LungCap)

#standard deviation
a = sd(LungCap)

#variance = standard deviation ^2
a^2
sqrt(b)

#min max
min(LungCap)
max(LungCap)

#range
range(LungCap)

#percentile / qauntile
quantile(LungCap,probs = .91)

quantile(LungCap, probs = c(0.51 , 0.87 , 0.95))

sum(LungCap)/725

#covariance
cov(LungCap, Height)

var(LungCap, Height)

#correlation
cor(LungCap, Height, method = "spearman")         

cor(LungCap, Age, method = "spearman")
cor(LungCap, Age)

length(LungCap)

#count table
var1 = table(Gender)
var1

var2 = (table(Gender)/725)*100
var2

View(data)

var3 = table(Smoke,Gender)
var3


#do the same on another dataset
#functions = apply
#visualization = plotly, ggplot2
