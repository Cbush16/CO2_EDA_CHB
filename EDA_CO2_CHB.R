#getting the data
library(tidyverse)
data<-CO2

#looking at the data
head(data)
str(data)
summary(data)

#Checking for missing values
sapply(data, function(x) sum(is.na(x)))

#Univariate plots
ggplot(data,aes(x=uptake))+
  geom_histogram(fill="lightpink",color="black")+
  labs(title="Histogram of Uptake",x="Uptake",y="Count")
ggplot(data,aes(x=uptake))+
  geom_density(fill="lightgrey")+
  labs(title="Distribution of Uptake",x="Uptake",y="Count")
ggplot(data,aes(x=conc))+
  geom_density(fill="brown1")+
  labs(title="Distribution of CO2 Concentration")
ggplot(data,aes(x=conc))+
  geom_dotplot()+
  labs(title="Distributio of CO2 Concentration")
ggplot(data,aes(x=Plant))+
  geom_bar()

#Bivariate plots
ggplot(data,aes(x=Type,y=uptake))+
  geom_boxplot(fill="aquamarine1")+
  labs(title="Comparison Between Plant Type and CO2 Uptake",x="Plant Type",y="Uptake")
ggplot(data,aes(y=uptake,x=Plant))+
  geom_boxplot(fill="cornflowerblue")+
  labs(title="Uptake Per Each Plant",x="Plant",y="Uptake")
ggplot(data,aes(x=conc,y=uptake))+
  geom_point(color="darkslategrey")+
  geom_smooth(color = "tomato")+
  labs(title="Amount of CO2 v.s CO2 uptake",x="CO2 Concentration",y="Uptake")
ggplot(data,aes(x=uptake,fill=Treatment))+
  geom_density(alpha=0.5)+
  labs(title="CO2 Uptake by Treatment Type",x="CO2 Uptake")
#library so I can use 2 categorical
library(ggplot2)
ggplot(data,aes(x=Plant,fill=Treatment))+
  geom_bar(position = "stack")

#Multivariate
ggplot(data, aes(x = uptake, y = Treatment, color = Type)) +
  geom_point(size = 3, alpha = .6) 

cor_matrix<- cor(data %>% select_if(is.numeric))
print(cor_matrix)
ggplot(data=as.data.frame(as.table(cor_matrix)), aes(Var1,Var2,fill=Freq))+
  geom_tile(color="white")+
  scale_fill_gradient2(low="blue",high="red",mid="white",midpoint=0,limit=c(-1,1))+
  geom_text(aes(label=round(Freq,2)),color='black',size=3)+
  theme_minimal()

