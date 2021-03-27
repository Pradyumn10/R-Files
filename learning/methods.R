library(dplyr)

#select, filter, arrange, rename, mutate, summarizing , piping (%>%)

data = readRDS("chicago.rds")
View(data)

str(data)
class(data)
summary(data)

names(data)

#select = used to select column of dataframe that you want to focus on
names(chicago)[1:3]

attach(data)

file = select(data,-(1:3))
file

names(data)

var2 = select(data, c(date, tmpd))
var2

#match
v = match("city", names(data))
v

u = match("date" , names(data))
u

head(data[,-c(u,v)])

names(data)

q = select(data, ends_with('2'))
q

w = select(data,starts_with('pm'))
head(w)

#filter = used to extract subsets of rows from data frame
a = filter(data, pm25tmean2>=16.23 & dptp>23)
a
View(a)

b = filter(data, tmpd>=40 & (pm25tmean2>=19 | dptp>=23 ) & no2tmean2>20)
View(b)


c= select(b , tmpd,dptp,no2tmean2,pm25tmean2)
View(c)
#arrange = reorder rows of dataframe according to one variable
help("arrange")
d = arrange(data,date)
View(d)

head(select(data, date,pm25tmean2),10) #starting 10 rows
tail(select(data, date, pm25tmean2),20) #ending 20 rows

#rename
data = rename(data, Date=date, pm25=pm25tmean2)
head(data)

#mutate
data = mutate(data,pm25trend = pm25-mean(pm25,na.rm=T))
head(data)
View(data)

#random number
col = rnorm(6940)
col

data = mutate(data, newCol = col)
head(data)
View(data)

#transmute same as mutate but then drops all non transform variable
copyData = transmute(data,pm10trend = pm10tmean2-mean(pm10tmean2,na.rm=T),
               o3trend = o3tmean2-mean(o3tmean2, na.rm = T))
head(copyData)

#groupby
data = mutate(data, year=as.POSIXlt(Date)$year+1900)
View(data)
head(data)

years = group_by(data,year)
years

#summarize
summarize(years, pm25=mean(pm25,na.rm=T), o3 = max(o3tmean2), no2t = median(no2tmean2,na.rm=T))

qq = quantile(data$pm25, seq(0,1,0.2),na.rm=T)
View(qq)

data = mutate(data, pm25new = cut(pm25, qq))
View(data)

pm = group_by(data, pm25new)
summarize(pm, dp = mean(dptp, na.rm=T), no2tm = mean(no2tmean2, na.rm=T))

#piping
mutate(data, month = as.POSIXlt(Date)$mon)%>% group_by(month)%>%
  summarize(pm3 = mean(pm25, na.rm=T), d = median(dptp, na.rm = T))

mutate(data, days = as.POSIXlt(Date)$mday) %>% 
  group_by(days) %>% 
  summarize(pm3 = mean(pm25, na.rm=T), d = median(dptp, na.rm = T))

help("POSIXlt")

ungroup(years)
