lung = read.csv(file.choose())
lung

names(lung)
names(lung)

View(lung)
library(dplyr)

ab = group_by(lung, Gender)
summarize(ab, Lu = mean(LungCap,na.rm=T), ag = min(Age, na.rm=T))
