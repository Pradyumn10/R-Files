#functions
#apply, lapply, tapply, sapply, vapply, mapply
help(apply)
mat1 = matrix(c(2,4,6,7,9,11,13,15,17) ,nrow = 3)
mat1

#apply (matrix, row 1/column 2, func)
apply(mat1, 2,sum)
      
vec1 = c(1,2,3,4)
vec2 = c(5,6,7,8)

arr = array(c(vec1, vec2), dim = c(2,4))
arr

apply(arr, 1, mean)
apply(arr, 2, mean)

#list appy
list1 = list(a=1:4 , b=rnorm(10), c=rnorm(20,1),d=rnorm(100,5))
list1

lapply(list1, sum)
lapply(list1, median)

#s apply
sapply(list1, mean)
sapply(list1, median)

sapply(list1, range)
lapply(list1, range)

#t apply
vec3 = c(23, 44, 67, 72)
vec4 = c("F", "M", "F", "M")
F=factor(vec4)
F
class(F)

tapply(vec3, F, var)
tapply(vec3, F, mean)

#v apply = works on list
list2 = list(c(1,1,1),c(2,2,2) )
list2

vapply(list2, mean, FUN.VALUE = double(1) )

#m apply
#multivariate version of s and l

list3 = list(rep(1,4),rep(2,3), rep(3,2))
#mapply(rep, number, repition)
mapply(rep , 1:3 , 4:2)

library(datasets)
head(airquality)

View(airquality)

data = airquality
names(data)

s = split(data, data$Month)
s

summary(data)

str(data)
str(s)

lapply(s, mean)

lapply(s, function(x){
  colMeans(x[c("Ozone", "Solar.R", "Wind")])
})

sapply(s, function(x){
  colMeans(x[c("Ozone", "Solar.R", "Wind")], na.rm = T)
})

attach(data)
mean(Ozone)
mean(Solar.R)
mean(Wind)

mean(Ozone,na.rm=T)

median(Ozone)
median(Ozone, na.rm=T)

var(Ozone, na.rm =T)

