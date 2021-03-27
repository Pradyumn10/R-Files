library(ggplot2)
library(tidyverse)

#importing data
data("mpg")
View(mpg)

str(mpg)
summary(mpg)

names(mpg)

data("iris")
View(iris)

a = table(mpg$manufacturer, mpg$class)
View(a)

#scatter plot
ggplot(mpg, aes(mpg$displ, mpg$hwy)) + geom_point(shape=1)
ggplot(mpg, aes(mpg$displ, mpg$hwy, colour=mpg$fl)) + geom_point()+ geom_smooth(method='lm', se=FALSE)

ggplot(iris, aes(iris$Sepal.Length, iris$Petal.Length, colour=iris$Species)) + geom_point(shape=1) + geom_smooth(method=lm, se=FALSE)

#connected scatter
library(dplyr)


#jitter plot
ggplot(mpg, aes(mpg$cyl, mpg$hwy)) + geom_point() + geom_jitter(aes(colour = mpg$class))

#bar
ggplot(mpg, aes(mpg$cyl)) + geom_bar(fill="blue")

help('geom_line')
#hist
ggplot(mpg, aes(mpg$hwy, colour=mpg$class)) + geom_histogram()
ggplot(data=mpg, aes(x=mpg$hwy))+geom_histogram( col="red",fill="yellow",alpha =0.2,binwidth = 5)

#box 
p <- ggplot(mpg, aes(x=factor(cyl), colour=mpg$manufacturer))+ geom_bar(stat="count")
p

ggplot(iris, aes(x=factor(iris$Species), colour=iris$Species))+ geom_bar(stat="count")

#straked
p <- ggplot(mpg, aes(mpg$drv, fill=mpg$class))  + geom_bar()+labs(title="stracked bar chart", x="DRV", y="count") +coord_flip()
p

#data
x=seq(1:10)
y=cumsum(rnorm(10))
ad = data_frame(x,y)
ad

#line
ggplot(mpg, aes(x=mpg$year, y=mpg$hwy, colour=mpg$year))+geom_count() +geom_line()+labs(title="Line Chart", x="Year",y="Highway Mileage")
ggplot(mpg, aes(x = mpg$year, y = mpg$hwy)) + geom_line() + geom_smooth(method = 'lm') +labs(x = "Year", y = "highway mileage")

library("hrbrthemes")
ggplot(ad, aes(x=x, y=y))+geom_line(col="red", linetype=4, size=2)+labs(title="Line Chart", x="Year",y="Highway Mileage")+theme_ipsum()

#pie

# include legend