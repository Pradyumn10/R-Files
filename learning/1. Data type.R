
# R has five data types which are
# 1.Numeric  
# 2.Integers 
# 3.Complex 
# 4.Logical 
# 5.Characters 

# 1.Numeric  
num <- 134
class(num)


g <- 53.5 #Assigning a decimal value to g
g #Printing the value of g
class(g) #Printing the class name of g
typeof(g)


# 2.Integers
x = as.integer(num)
class(x)
typeof(x)

a <- as.integer(4) #Using as.integer()
a #printing a
typeof(a) #checking data-type of a

b <- 4L #Appending L to 4 
b #printing b
typeof(b) #Checking data-type of b

x <- 1:100
typeof(x) # integer

y <- x+1
typeof(y) # double, twice the memory size
object.size(y) # 840 bytes (on win64) 

z <- x+1L
typeof(z) # still integer
object.size(z) # 440 bytes (on win64) 

# 3.Complex 
comp <- 22+6i
class(comp)
typeof(comp)

# 4.Logical 
logi <- FALSE
class(logi)
typeof(logi)   

a =3; b =6       #sample values
g = a>b         # is a larger than b?
g               #print the logical value



# 5.Characters
char <- "dataflair1234"
class(char)
typeof(char)

z = 42
z
y = as.character(42) 
y
typeof(y)


# Data Structures in R

# 1.Vector
# 2.Matrix
# 3.Array
# 4.Lists
# 5.Data Frames

# 1. Vector: 
# - Vector is the most basic data structure in R programming language.
# - They have three common properties:
# 1: Type function - what actually it is?
# 2: Length function - how many elements does it contain.
# 3: Attribute function - extra arbitrary metadata.


x = c(1,2,3,4)
y = c("m", "f")
class(y)

# 2. Matrix: 
mat1 <- matrix(1:9, nrow = 3, byrow = TRUE)
mat1
mat2 <- matrix(10:18, nrow = 3, ncol = 3)
mat2

mat1[c(1,3),c(1,3)]   
mat2[2,1]

mat1[2, ]  
mat1[, 2]  

# Adding Matrix
mat1 + mat2

# Subtracting
mat1 - mat2

# Multiply by a constant
4 * mat1

# Dividing
(mat1/mat2)

#Transposing
t(mat1)  

# Identity Matrix
diag(6)

# 3:Array
# Arrays in R are the data objects which can store data in more than -
# two dimensions. 
# An array is created using the array() function.
# Create two vectors of different lengths.

vec1 <- c(1,2,4)     
vec2 <- c(15,17,27,3,10,11)
output <- array(c(vec1,vec2),dim = c(3,3,2))
output

# Naming Columns And Rows

vec1 <- c(1,2,4)
vec2 <- c(15,17,27,3,10,11)
column_names <- c("col1","col2","col3")
row_names <- c("row1","row2","row3")
matrix_names <- c("Mat1","Mat2")
output <- array(c(vec1,vec2),dim = c(3,3,2),dimnames = list(row_names,column_names,
                                                            matrix_names))
output


# Accessing Array Elements. 
vec1 <- c(1,2,4)
vec2 <- c(15,17,27,3,10,11)
row_names <- c("row1","row2","row3")
col_names <- c("col1","col2","col3")
matrix_names <- c("Mat1","Mat2")
output <- array(c(vec1,vec2),dim = c(3,3,2),dimnames = list(row_names,col_names,matrix_names))
output

output[3,,1]
output[1,3,1] #Print the element in the 1st row and 3rd column of the 1st matrix
output[,,2] #Print the 2nd Matrix


# Manipulating Array Elements.
vec1 <- c(1,2,3)           
vec2 <- c(4,5,6,7,8,9)
arr1 <- array(c(vec1,vec2),dim = c(3,3,2))
arr1
vec3 <- c(3,2,1)
vec4 <- c(9,8,7,6,5,4)
arr2 <- array(c(vec3,vec4),dim = c(3,3,2))
arr2
mat1 <- arr1[,,2]  #Creating Matrix out array
mat1
mat2 <- arr2[,,2]
mat2
output <- mat1 + mat2
output

# Calculations across R Array Elements.
# We will be using the apply() function for calculations in an array in R.
# Syntax:  apply(x, margin, fun)

# Description of the parameters.
# 1. x is an array.
# 2. A margin is the name of the dataset used.
# 3. fun is the function to be applied to the elements of the array.

vec1 <- c(1,2,3)           
vec2 <- c(4,5,6,7,8,9)
array_new <- array(c(vec1,vec2),dim = c(3,3,2))
array_new
output <- apply(array_new,3, sum)
output

# List.
# A list is created using the list() function.

num_list = c(3,4,5)    
char_list = c("a", "b", "c", "d", "e")
logic_list = c(TRUE, TRUE, FALSE, TRUE)
out_list = list(num_list, char_list, logic_list, 3)
out_list
View(out_list)
class(out_list)
# Data Frame.
# It generally refers to tabular data: a data structure representing the cases (rows), 
# each of which consists of numbers of observation or measurement (columns).
# A data frame is used for storing data tables. It is a list of vectors of equal length.

num_list = c(3,4,5)    
char_list = c("a", "b", "c")
logic_list = c(TRUE, FALSE, TRUE)
data_frame = data.frame(num_list, char_list, logic_list)
data_frame
class(data_frame)
out1 = as.list(data_frame)
out1
typeof(out1)


# R Factor.
# The factor is stored as integers. They have labels associated with these unique integers.

directions <- c("North", "North", "West", "South")

# Convert vector into a factor using the factor() function.

factor(directions)

# In order to add this missing level to our factors, we use the "levels" attribute.
factor(directions, levels= c("North", "East", "South", "West"))

# Generate Factor Level in R.

# : Generating factor is gl(n, k, labels) where n is an integer specifying the number of levels.

# - k is an integer that gives out a number of replications.
# - And, labels are simply the vector of labels for our factor.

BigData <- gl(3, 3, labels = c("Hadoop", "Spark","Flink"))
print(BigData)


# Accessing Components of Factor in R.
compass <- c("East","West","East","North")
data <- factor(compass)
data

data[4] #Accessing the 4th element
data[c(2,3)] #Accessing the 2nd & 3rd element
data[-1] #Accessing everything except 1st element
data[c(TRUE, FALSE, TRUE, TRUE)] #Accessing using Logical Vector.


# How to Modify an R Factor?
print(data)
data[2] <- "North" #Modifying 2nd element
data[3] <- "South" #Cannot Modify Factor with an Element outside its scope
print(data) 
levels(data) <- c(levels(data), "South") 
data[3] <- "South" 
print(data)


# Factor Functions.
f_directions <- factor(directions)
is.factor(f_directions)                     
as.factor(directions)                     
is.ordered(f_directions)                    
as.ordered(f_directions) 

