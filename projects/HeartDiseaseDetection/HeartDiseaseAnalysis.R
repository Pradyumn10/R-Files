library(tidyverse)
library(ggplot2)
library(corrplot)

data <- read.csv(file.choose())
View(data)
str(data)
glimpse(data)
nrow(data)
ncol(data)
names(data)
summary(data)

#data transfomation
data2 <- data %>% 
  mutate(sex=if_else(sex==1, "Male","Female"),
  fbs<-if_else(fbs==1,">120","<=120"),
  exang=if_else(exang==1,"Yes","No"),
  cp = if_else(cp==1, "Atypica; Angina",
               if_else(cp==2,"Non-Anginal Pain","Asymptomatic")),
  restecg=if_else(restecg==0,"Normal",
                  if_else(restecg==1,"Abnormality","Probable or Definite")),
  slope=as.factor(slope),
  ca<-as.factor(ca),
  thal = as.factor(thal),
  target = if_else(target==1,"Yes","No")
  ) %>%
  mutate_if(is.character,as.factor) %>%
  dplyr::select(target,sex,fbs,exang,cp,restecg,slope,ca,thal,everything())

View(data2)

#Data Visualization
ggplot(data2, aes(x=data2$target,fill=data2$target))+geom_bar()+xlab("Heart Disease")+ylab("Count")+ggtitle("Presence & Absence of heart disease")+scale_fill_discrete(name="Heart Disease",labels=c("Absence","Presence"))

prop.table(table(data2$target))
#Data is almost balanced then too more towards yes

#count the frequency of the values of age
data2 %>% group_by(age) %>%
  count() %>% filter(n>10) %>% 
  ggplot()+geom_col(aes(age,n),fill='green')+ggtitle("Age Analysis")+xlab("Age")+ylab("AgeCount")

#compare blood pressure acrooss the chest pain
data2 %>% ggplot(aes(x=sex, y=trestbps))+geom_boxplot(fill="purple")+xlab('sex')+ylab('BP')+facet_grid(~cp)
data2 %>% ggplot(aes(x=sex, y=chol))+geom_boxplot(fill="orange")+xlab('sex')+ylab('Cholestrol')+facet_grid(~cp)

#correlation
cor_heart <- cor(data2[,10:14])
cor_heart

corrplot(cor_heart, method='square', type='upper')
