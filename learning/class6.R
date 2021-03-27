library(dplyr)
chicago = readRDS("chicago.rds")
chicago
View(chicago)
str(chicago)

#select , filter , arrange , rename , mutate, summarise, piping(%>%)
names(chicago)[1:3]
attach(chicago)

summary(chicago)

summary(city)

new = select(chicago,city:dptp)
new

select(chicago,-(city:dptp))

var1 = match("dptp",names(chicago))
var1

var2 = filter(chicago,dptp>=49.7)
var2

View(var2)

