d
View(d)
names(d)

#checking missing values
is.na(d)
!is.na(d)

summary(d)

d[is.na(d)]

#removing missing values
one=complete.cases(d)
two=d[one,]
summary(two)
is.na(two)

#placing predefined value
d$tmpd = ifelse(is.na(d$tmpd), 2, d$tmpd)
is.na(d$tmpd)

d$tmpd


#by using a package
install.packages("Hmisc")

library(Hmisc)
x<-impute(d$dptp, fun=mean)
x
summary(x)
