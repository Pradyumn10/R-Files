library(datasets)

data(iris)
View(iris)
attach(iris)

names(iris)
distinct(iris, Species)

library(dplyr)

gender = c('M','F', 'T', 'O')
age = c(20,45,75,100)
martial = c('M','M','U','M')

help("data.frame")
nm = data.frame(gender,age,martial)
nm

View(nm)
a=c('F',34,'U')
help("rbind")

#adding a new row
nm = rbind(nm,a)

#adding a new column
education=c('Btech','Mtech','PG','undergrad','high school')
nm= cbind(nm,education)
nm

library(tidyr)

help("gather")

#transpose
ar = gather(nm)
ar

#proper transpose
qr = t(nm)
qr

id = c(1,2,3,4,5)
nm = cbind(nm,id)
nm
View(nm)

nm

income=c(10000,20000,30000,40000,50000)
status=c('A','D',"A",'A','A')
mm=data.frame(id,income,status)
mm
View(mm)


#joints
#L join
left_join(nm,mm,by='id')

right_join(mm,nm,by='id')

r1=c(6,70000,'A')
r2=c('F',54,'M','Graduation',7)
mm = rbind(mm,r1)

nm=rbind(nm,r2)

names(nm)

str(nm$id)
str(mm$id)
str(mm$income)

mm$income = as.numeric(mm$income)
mm$id = as.numeric(mm$id)

inner_join(nm,mm,by='id')

#full join
full_join(nm,mm,by='id')

#combine table
bind_cols(nm,mm)

View(mm)

#left_join(nm,mm,by='id',suffix=c("",".mm"))

#union join
#union(nm,mm)
