#Visualization
library(ggplot2)
library(plotly)

data(mtcars)
cars = mtcars
cars

summary(cars)
names(cars)

View(cars)

attach(cars)
range(gear)

#bar chart
ab = table(gear)
barplot(ab, main = "BARPLOT", xlab = "Gears", ylab = "Frequency", legend = rownames(ab), col = rainbow(3))
barplot(ab, main = "BARPLOT", xlab = "Gears", ylab = "Frequency", legend = rownames(ab), col = c("blue","magenta","cyan"))

#Horizontal Plot
barplot(ab,horiz = T, main = "BARPLOT", xlab = "Frequency", ylab = "Gears", legend = rownames(ab), col = rainbow(3))

#Stracked bar chart
range(vs)

bb = table(vs,gear)
bb

barplot(bb, col=rainbow(2), legend = rownames(bb), xlab="Gears", ylab="Frequency", beside = T, horiz=T)


