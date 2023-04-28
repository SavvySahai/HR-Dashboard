#load the packages
library(ggplot2) 
library(dplyr) 
library(tidyr)

#loading the Dataset 
hrm<-read.csv("C:\\Users\\Savvy Sahai\\Downloads\\HR final.csv") 

#Structure of the Dataset 
str(hrm)

#Satisfaction level Histogram 
p1<-ggplot(aes(x=satisfaction_level),data=hrm) +  
  geom_histogram(color="black",fill="red",bins = 30) + 
  labs(title="Satisfaction level Histogram",x='Satisfaction Level of Employees', y="Frequency") 

p1 

#Analysis on number of Projects 
hrm$number_project<-factor(hrm$number_project) 
ggplot(aes(x=number_project),data = hrm) +    
  geom_bar(color='black',fill='#234338') + 
  xlab("Number of Projects") +    ylab("Frequency") +  
  labs(title="Barplot of Number of projects")


#Anslysis for variable Time spend at company 
table(hrm$time_spend_company) 
ggplot(aes(x = factor(time_spend_company)),data = hrm) +    
  geom_bar(fill = 'purple',color='black') +    
  xlab("Time spend at compnay in years") +    
  ylab("Frequency")+ 
  labs(title = "Barplot of Time spend at Company") 


#Analysis of Department of Work 
ggplot(aes(x =sales),data = hrm ) +   
  geom_bar()  +   xlab('Department') +    
  ylab('Counts') + 
  coord_flip()	  


#Department vs Work Accident 
ggplot(hrm, aes(x = sales, y = Work_accident)) +
  geom_point(position = position_jitter(width = 0.2)) +
  geom_smooth(method = "glm", method.args = list(family = "binomial"), se = FALSE) +
  labs(x = "Department", y = "Work Accident") +
  scale_y_continuous(breaks = c(0, 1), labels = c("No", "Yes")) +
  theme_classic()
