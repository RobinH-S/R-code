# Anova with repeated measurements 

#download the file dataSem5.csv from MittUiB
mydata <- read.delim(file.choose(), sep=',')
View(mydata)

#memory of words was tested in two different set of conditions 


summary(mydata)


mydata$Subject<-as.factor(mydata$Subject) 
mydata$Within_Cond<-as.factor(mydata$Within_Cond) 
mydata$Within_Time<-as.factor(mydata$Within_Time) 



#this has to be done because Subject, Condition, and Time are not numbers
#but R would treat them as numbers if we do not correct it


boxplot(DV~Within_Cond * Within_Time, data=mydata) #what do we observe here?
boxplot(DV~Subject, data=mydata) #what do we observe here?


#let's also check whether the memory variable is normally distributed
#in general and for every combination of variables


hist(mydata$DV)
shapiro.test(mydata$DV)

hist(mydata$DV[mydata$Within_Cond==1&mydata$Within_Time==1])
shapiro.test(mydata$DV[mydata$Within_Cond==1&mydata$Within_Time==1])

hist(mydata$DV[mydata$Within_Cond==2&mydata$Within_Time==1])
shapiro.test(mydata$DV[mydata$Within_Cond==2&mydata$Within_Time==1])

hist(mydata$DV[mydata$Within_Cond==1&mydata$Within_Time==2])
shapiro.test(mydata$DV[mydata$Within_Cond==1&mydata$Within_Time==2])

hist(mydata$DV[mydata$Within_Cond==2&mydata$Within_Time==2])
shapiro.test(mydata$DV[mydata$Within_Cond==2&mydata$Within_Time==2])

?aov


#Try to come up with the correct formula to analyze the data





model<-aov(DV~Within_Cond * Within_Time 
           + Error(Subject/(Within_Cond * Within_Time)), data=mydata)
summary(model)



# Pairwise paired t-test


#import the file data.ex3.txt from MittUiB 
#it's a dataset with recall measurements depending on the Valence of words
#notice multiple measurements per participant

data.ex3 <- read.delim(file.choose(), sep = " ")
View(data.ex3)
summary(data.ex3)

data.ex3$Valence<-as.factor(data.ex3$Valence)
data.ex3$Valence<-as.factor(data.ex3$Valence)

attach(data.ex3)     


boxplot(Recall~Valence)
boxplot(Recall~Subject)

model<-aov(Recall~Valence+Error(Subject/Valence))
summary(model) #but which of the differences is significant?


?pairwise.t.test


pairwise.t.test(Recall, Valence, paired=T)#why is it paired=T?

detach(data.ex3)


#QUESTION TIME



#Standard Error vs. Standard Deviation 

population<-rnorm(10000, mean=0, sd=10) #we create a population of 10 000 measurements
mean(population) #this is it's true mean
sd(population) #this is it's true standard deviation

sample(population, 5) #sample 5 measurements from the population

for (i in 1:20) { cat(sample(population, 5), "\n") } #sample  5 measurements 20 times and print them

for (i in 1:20) { cat(mean(sample(population, 5)), "\n") } #sample 5 measurements 20 times and print the 20 means
for (i in 1:20) { cat(sd(sample(population, 5)), "\n") } #sample 5 measurements 20 times and print the 20 standard deviations

for (i in 1:20) { cat(mean(sample(population, 50)), "\n") }
for (i in 1:20) { cat(sd(sample(population, 50)), "\n") }

for (i in 1:20) { cat(mean(sample(population, 500)), "\n") }
for (i in 1:20) { cat(sd(sample(population, 500)), "\n") }



#-----Effect size----

## Chi squared 

library("MASS") #library with additional datasets, including Cars93
?Cars93

car.data <- data.frame(Cars93$AirBags, Cars93$Type)

tcar<-table(car.data) #is there a relation between car type and airbags
tcar
prop.table(tcar, margin=2)
assocplot(tcar)
chisq.test(tcar)

sqrt(chisq.test(tcar)$statistic/(sum(tcar)*(2))) #what is in this formula and why?
#is this a large effect? 



## T-test 

#let's compare price for cars with manual and automatic transmission
manual<-Cars93$Price[Cars93$Man.trans.avail=="Yes"]
automatic<-Cars93$Price[Cars93$Man.trans.avail!="Yes"]

mean(manual) #mean price for manual cars
mean(automatic) #mean price for automatic cars

sd(manual)
sd(automatic)

boxplot(manual, automatic)

?Cars93

#assumptions: similar standard deviation, similar number of measurements

t.test(manual, automatic)
t.test(automatic, manual)

(23.84062-17.23770)/sd(Cars93$Price)



