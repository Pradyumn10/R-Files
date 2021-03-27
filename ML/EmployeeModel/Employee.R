#importing libraries
library(dplyr)
library(ggplot2)
library(tidyverse)

#reading data
df = read.csv(file.choose())
View(df)

#Analysis of Data
str(df)
is.null(df)
#There are no null values

#checking for duplicate values
duplicated(df$Name)
df = df[!duplicated(df$Name),]
df

dept = table(df$Dept)
table(df$Dept,df$Salary)

ab = df %>% group_by(Dept) %>% summarize(min=min(Salary), max = max(Salary))
ab
dept

answer=cbind(ab,dept)
final = answer[-4]
final