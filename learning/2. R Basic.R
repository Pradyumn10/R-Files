# create vector
x<-c(1,2,3,4,5,5,6,5,2,7,9)
x
gender<-c("male","female")
gender


#we should 2 to 7 numbers in sequence
2:7

#1 to 7
seq(from=1, to=7, by=1)
seq(from=1, to=7, by=1/3)
seq(from=1, to=7, by=.25)
seq(6)
seq_along(6)
seq_along(c(6,2,3,5))

seq_along(seq(from=2, to=5, by=0.25))
#seq_along will produce a vector with length

#repeation
rep(1, times=10)
rep("Good", times=5)
rep(1:3, times=5)
rep(seq(from=2, to=5, by=0.25), times=5)
rep(c("m","f"), times=5)

x=1:5
x
y=c(1,3,5,7,9)
y


#if two vectore are of the same length, we may add/subtract/mult/div crresponding elements

x+y
x-y
x*y
x/y

z=c(1,5,7)
x*z


#create matrix

matrix(c(1,2,3,4,5,6,7,8,9), nrow = 3, byrow = T)
matrix(seq(1:9), nrow = 3, byrow = T)
matrix(c(1,2,3,4,5,6,7,8,9), nrow = 3, byrow = F)

mat=matrix(c(1,2,3,4,5,6,7,8,9), nrow = 3, byrow = TRUE)
mat

mat[1,2]
mat[c(1,3),2]
mat[2,c(1,3)]
mat[2,]
mat[,1]

mat*10
mat^2
mat*mat

#random number genreat 
runif(6)
runif(n=6,1,8)
runif(n=6,5,3)

#remove data set
rm(z)

