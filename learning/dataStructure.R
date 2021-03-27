#repeation
rep(1,times=10)
rep("Good",times=10)
rep(1:3,times=10)
rep(seq(from=2, to=5, by=.75),times=10) #using sequence
rep(c("m","f"),times=4) #using vector


#Matrix
x=matrix(c(1,2,3,4,5,6,7,8,9), nrow=3,byrow=T) #Filling number using rows
y=matrix(c(1,2,3,4,5,6,7,8,9), nrow=3,byrow=F)

matrix(seq(1:20),nrow=5,byrow=F)

matrix(seq(1:12), nrow = 4, ncol = 3) #3*4

t(x)

diag(x)

x*y
x+y

ab =2
#Generating random number
runif(6)
runif(n=6,1,8)

round(runif(n=6,1,8),0)
round(runif(n=6,1,8),2)

round(runif(n=6,-8,-1),0)

rm(ab)


#Data Types

var1 <- .25
class(var1)
typeof(var1)

var2 <- as.integer(var1)
var2

var3 <- 4L+1
var3

var3 <- 4L*2
var3

var4 = 1:5 #using colon it will consider it as integer
var4

help("typeof")

object.size(var1) #Tell byte size



#data structure
vec1 <- c(1,2,4)
vec2 <- c(15,17,27,3,10,11)
output <- array(c(vec1,vec2),dim=c(3,3,2))
output

column_names = c("col1", "col2", "col3")
row_names = c("row1", "row2", "row3")

matrix_names = c("mat1","mat2")

output = array(c(vec1, vec2), dim=c(3,3,2),dimnames= list(row_names,column_names,matrix_names))
output


output[3,,1] #3rd row of 1 matrix
output[3,1,2] #3rd row, 1 column, 2 matrix

