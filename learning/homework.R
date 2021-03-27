#descriptive statistics 
library(dplyr)

data = read.csv(file.choose(), sep=";")
data

attach(data)

summary(data)

names(data)

#mean
mean(age)
mean(balance)
mean(duration)
mean(data$duration)

#median
median(age)

#variance
variance = var(balance)

#standard deviation
stDev = sd(balance)

variance
stDev

stDev^2

#min max
min(balance)
max(balance)

#range
range(balance)

#percentile
quantile(balance)
quantile(balance, .56)

#covariance
cov(age, balance)

#corelation
cor(age, balance)

#table
var1 = table(loan)
var1

var2 = table(loan, job )
var2
