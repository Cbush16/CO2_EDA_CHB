#getting the data
library(tidyverse)
data<-airquality

#looking at the data
head(data)
str(data)
summary(data)

#Checking for missing values
sapply(data, function(x) sum(is.na(x)))

#Filling missing values
data$Ozone[is.na(data$Ozone)] <- mean(data$Ozone, na.rm = TRUE)
data$Solar.R[is.na(data$Solar.R)] <- mean(data$Solar.R, na.rm = TRUE)

#Checking missing values and looking at data again
sapply(data, function(x) sum(is.na(x)))
head(data)
str(data)
summary(data)


#some univariate plots
ggplot(data,aes(x=Temp))+
  geom_histogram(fill="lightpink",color="black")+
  labs(title="Histogram of Temperature",x="Temperature",y="Count")
ggplot(data,aes(x=conc))+
  geom_bar(fill="lightgrey",color="darkgreen")+
  labs(title="Bar plot of CO2 Concentration",x="CO2 Concentration",y="Count")
