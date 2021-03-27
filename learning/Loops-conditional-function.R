#Control Statements
value = 1:10
i=0
#for
for (i in value) {
  print(i)
  print(value)
}

while(i<10){
  print("Hello")
  i=i+1
}

mat = matrix((1:9),3,3)
mat

#nested loop
i=0
j=0
for(i in seq(nrow(mat))){
  for (j in seq(ncol(mat))) {
    #print(i,j)
    print(mat[i,j])
  }
}

#repeat
value1 <- 20
repeat{
  print(value1)
  value1 <- value1+1
  if(value1==32){
    break
  }
}

ab = 1:30

for (i in ab) {
  #print("Inside")
  if(i==15){
    break
  }
    print(i)
}

a =5
b=7
#conditional statement
if(a>b){
  print("False")
}else{
  print("True")}

#if else if
q=4 ; w=3
print(q)
print(w)
if(q<w){
  print("q is less than w")
}else if(q==w){
  print("w is less than q ")
}else{
  print("In else")
}

#next (same as continue)
ab = 1:30
for (i in ab) {
  #print("Inside")
  if(i==15){
    next
  }
  print(i)
}



#Fucntion
func1 = function(x){
  if(x>0){
    print(T)
  }else if(x<0){
    print(F)
  }else{
    print("0")
  }
}
func1(x)
x=0:1
#with argument
func2 = function(x){
  for (i in x) {
    y=i^2
    print(y)
  
    }}

func2(5)

#without argument
func3 =function(x){
  for(i in x){
    print(i^2)
  }
}

func3(8)

func4 = function(a=3){
  for(i in a){
    print(a)
  }
}
func4(6)

#blank function
func5 = function(){
  print("hello")
}
func5()

#multiple parameters
func6 = function(a,b,c){
  print(a)
  print(b)
  print(c)
  q=a+b
  print(q)
  print(c^2)
  print(c-b)
}

func6(4,7,9)

#descriptive statistics