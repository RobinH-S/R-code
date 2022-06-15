#-------One-way Anova--------

plants<-PlantGrowth 
View(plants) #plant growth affected by two different treatments (and also control)
summary(plants)

boxplot(weight~group, data=plants)  


#let's calculate the different sums of squares

attach(plants)

total<-sum((weight-mean(weight))^2) #total SST
within<-sum( (weight[group=="ctrl"]-mean(weight[group=="ctrl"]))^2 +
               (weight[group=="trt1"]-mean(weight[group=="trt1"]))^2 +
               (weight[group=="trt2"]-mean(weight[group=="trt2"]))^2) #variance withing groups
between<-total-within


#Degrees of freedom
Fstat<-(between/2)/(within/27)

Fstat


#now let's do it automatically
model<-aov(weight~group, data=plants)


summary(model)



#---------Pairwise comparison-----

#Where are the significant differences in the plants data?

pairwise.t.test(weight, group) #how do we interpret it?

detach(plants)


#-----Reporting the results

#What was the hypothesis? 
#Two treamtments applied would affect the growth in different ways

#What was the null hypothesis? 
#There is no effect of treatments.
#There is no difference between ctrl and trt1. 
#There is no difference between ctrl and trt2. 
#There is no difference between trt1 and trt2. 

#What were the findings?

#ANOVA showed that there are significant differences between the three
#groups (F(2,27)=4.846, p-value=0.0159). A pairwise t-test comparison showed
#that only treatment 2 is significantly different from treatment 1 
#(p-value=0.013, adjusted for multiple comparison). We conclude that 
#treatment 1 and treatment 2 affect growth differently from each other. 


#-------Interactions---------

data <- read.delim(file.choose(), sep=' ') #Pitt_Shoaf2.txt from MittUiB
View(data)
#phonological priming experiment. Dependent variable: reaction time. 
#Predictors: overlap with the prime (three syllables or no) 
#and position in the experiment (early vs. middle vs. late)


attach(data)
boxplot(rt~overlap*position)


interaction.plot(overlap, position, rt)




model<-aov(rt~position) #only position as the predictor
summary(model) #are the results correct?


model<-aov(rt~overlap+position) #simple model without interaction
summary(model) #are the results correct?

model<-aov(rt~overlap*position)
#model<-aov(rt~overlap+position+overlap:position) #another way of writing it 
summary(model)


#Does the model tell us anything about the specific effects 
#of the factors and their interaction?

detach(data)


#------------Exercise--------

#import the file ad.data.txt from MittUiB

#that's data on the number of reactions to advertisements depending on the day of the week
#and the directory of the newspaper 


#investigate whether the day of the week and the directory influence the number of reactions
#first graphically, then with ANOVA


#How can you report the results? 



ad.data <- read.delim(file.choose(), sep= ' ')
View(ad.data)

boxplot(Value~Day, data=ad.data)
boxplot(Value~Directory, data=ad.data)
boxplot(Value~Day*Directory, data=ad.data)
interaction.plot(ad.data$Day, ad.data$Directory, ad.data$Value)

model<-aov(Value~Day*Directory, data=ad.data)
summary(model)


