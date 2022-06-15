#----Chi Square---------- 

#Donwload the data.txt file from MittUiB, and import it. 

data<-read.csv(file=file.choose(), sep="\t")

summary(data) #gives you an overview of the data and data types
View(data) #have a look at the table

#if in the summary you see that three columns are character and not factors, run this:
data$survived<-as.factor(data$survived)
data$sex<-as.factor(data$sex)
data$passengerClass<-as.factor(data$passengerClass)


tsex<-table(data$survived, data$sex) #create a table by counting 
tsex


tsex.prop<-prop.table(tsex, margin = 2) #proportions per column, for proportion per row use margin=1
tsex.prop


#How do we caclulate expected values? And also why?


# expected values
col1<-(sum(tsex[,1])) #column total
col2<-(sum(tsex[,2]))
row1<-(sum(tsex[1,])) #row total 
row2<-(sum(tsex[2,]))

r1c1<-(row1*col1)/sum(tsex) #expected value for first cell
r1c2<-(row1*col2)/sum(tsex)
r2c1<-(row2*col1)/sum(tsex)
r2c2<-(row2*col2)/sum(tsex)

tsex.expected<-matrix(c(r1c1, r2c1, r1c2, r2c2), 
        ncol=2, 
      dimnames = list(c("no", "yes"), c("female", "male")))
tsex.expected
prop.table(tsex.expected, margin=2)

#the test
chisq.test(tsex)
chisq.test(tsex.prop) #do not do that ever! But why?



tsex/10
chisq.test(tsex/10) #how does the number of observations affect Chi Square?
tsex/50
chisq.test(tsex/50) #how does the number of observations affect Chi Square?
chisq.test(tsex*10)




assocplot(tsex)
install.packages("vcd")
library(vcd)
assoc(tsex, shade=T)


chisq.test(tsex)$expected #expected values if sex and survival were independent
chisq.test(tsex)$residuals #contribution of each cell 


#Effect size
chisq.test(tsex)
chisq.test(tsex)$statistic
sqrt(chisq.test(tsex)$statistic/sum(tsex))

sqrt(chisq.test(X)$statistic/(sum(X)*(k-1))) #k the smallest number of the number of rows or columns, for tables at least 3 by 3


#Yates correction 
chisq.test(tsex, correct=F) #calculate without the correction

#NOW DO THE SAME FOR SURVIVAL AND CLASS

#1) table
#2) prop table
#3) chisq.test 
#4) effect size


tclass<-table(data$survived, data$passengerClass) 
tclass
prop.table(tclass, margin=2)

chisq.test(tclass, correct=F)

assocplot(tclass)

sqrt(chisq.test(tclass)$statistic/sum(tclass))
------


table(data$survived, data$sex, data$passengerClass)

#----Importing data----------

# Use this link to download the dataset: https://data.fivethirtyeight.com/, search for "avengers", 
#download and unpack the archive, and then import the avengers.csv file using Import Dataset





View(avengers)
summary(avengers)
table(avengers$Gender, avengers$Death1)

#Is there a relation between gender and dying (for the first time) among the avengers?




chisq.test(table(avengers$Gender, avengers$Death1))
