install.packages("plotrix")
library(plotrix)

# Bar Chat
data(mtcars)
View(mtcars)
counts <-table(mtcars$gear)
counts1 <-table(mtcars$carb)
barplot(counts1)

#horizontal bar chart
barplot(counts1, horiz=TRUE)

#add titles, legends, and colors to a simple bar chart as shown below
barplot(counts1, main="Simple Bar Plot", xlab="Improvement", ylab="Frequency", legend=rownames(counts1), col=rainbow(6))

#create a stacked bar plot with colors and legends as shown below
counts <-table(mtcars$vs, mtcars$gear)
barplot(counts, main="Car Distribution by Gears and VS", xlab="Number of Gears", col=c("grey","cornflowerblue"), legend = rownames(counts))
#create a grouped bar plot as shown below
barplot(counts, main="Car Distribution by Gears and VS", xlab="Number of Gears", col=c("grey","cornflowerblue"), legend = rownames(counts), beside=TRUE)


# Pie Chat
slices <- c(10, 12,4, 16, 8)
lbls <-c("US", "UK", "Australia", "Germany", "France")
pie( slices, labels = lbls, main="Simple Pie Chart")

# percentage
pct <-round(slices/sum(slices)*100)
lbls <-paste(c("US", "UK", "Australia", "Germany", "France"), " ", pct, "%", sep="")
pie(slices, labels=lbls,  col=rainbow(5), main="Pie Chart with Percentages")

#3D Pie Chart
pie3D(slices, labels=lbls,  col=rainbow(5), main="3D Pie Chart with Percentages", explode = 0.0, radius=0.7)
pie3D(slices, labels=lbls,  col=rainbow(5), main="3D Pie Chart with Percentages", explode = 0.1)


#Histrogram Chat
mtcars$mpg #miles per gallon data
hist(mtcars$mpg)
# Colored Histogram with Different Number of Bins
hist(mtcars$mpg, breaks=8, col="darkgreen")
hist(mtcars$mpg, breaks=8, col="green")
hist(mtcars$mpg, col="green")




# kernel Density Plot
density_data <-density(mtcars$mpg)
plot(density_data)
# Filling density Plot with color
density_data <-density(mtcars$mpg)
plot(density_data, main="Kernel Density of Miles Per Gallon", col = 'red')
polygon(density_data, col="skyblue", border="green")


# Line Chart
weight <-c(2.5, 2.8, 3.2, 4.8, 5.1, 5.9, 6.8, 7.1, 7.8,8.1)
months <-c(0,1,2,3,4,5,6,7,8,9)
plot(months, weight, type = "l", main="Baby Weight Chart")


# Box Plot
vec <-c(3, 2, 5, 6, 4, 8, 1, 2, 3, 2, 4)
summary(vec)
boxplot(vec, varwidth = TRUE)

