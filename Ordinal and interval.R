#Seminar 3: ordinal data and interval data

#download vot.txt from MittUiB
#read about it in the manuscript pages 68-69
data <- read.delim(file.choose()) 

data$stop<-as.factor(data$stop)
data$year<-as.factor(data$year)

View(data)

summary(data)

attach(data) #now all the variables in the data can be called directly
year

plot(vot~year)


# Treating the data as ordinal 

View(data) # sort by VOT, look at year

wilcox.test(vot~year) #is there a significant difference?

#should we use two-tailed or not? 
wilcox.test(vot~year, alternative=c("greater")) 

#Treating the data as interval

hist(vot) #does this look like a normal distribution?
ks.test(vot, pnorm, mean=mean(vot), sd=sd(vot))
shapiro.test(vot) # a shorter way

sd(vot[year=="early"])
sd(vot[year=="late"])


t.test(vot~year)
t.test(vot~year, alternative=c("greater")) 

#Effect size
d<-(61.5-46.6)/sd(vot)
d

#effect size can be compared across experiments
#never compare p-values between experiments! 

#Do the same but for the effect of consonant on VOT


plot(vot~stop)
wilcox.test(vot~stop)
t.test(vot~stop)




#Paired t-test

#What if the early and late measurements are paired: two measurements for the same person
vot[year=="early"]
vot[year=="late"]
t.test(vot[year=="early"], vot[year=="late"], paired=T)
t.test(vot~year, paired=T)

#Effect of consonant and year together

boxplot(vot~year*stop) 

#What do we see?
#How can we statistically analyze this?

detach(data)

#Simulation for the t-test

#we simulate two samples with different sizes
#with different or same mean
#and with different standard deviations

early<-rnorm(30, mean=0, sd=1)
hist(early)
mean(early)

late<-rnorm(30, mean=0, sd=1)
hist(late)
mean(late)

t.test(early, late)

early<-rnorm(30, mean=0, sd=1)
hist(early)
mean(early)

late<-rnorm(30, mean=2, sd=1)
hist(late)
mean(late)

t.test(early, late)

early<-rnorm(5, mean=0, sd=1)
hist(early)
mean(early)

late<-rnorm(5, mean=0, sd=1)
hist(late)
mean(late)

t.test(early, late)

early<-rnorm(5, mean=0, sd=1)
hist(early)
mean(early)

late<-rnorm(5, mean=2, sd=1)
hist(late)
mean(late)

t.test(early, late)


early<-rnorm(20, mean=0, sd=5)
hist(early)
mean(early)

late<-rnorm(20, mean=1, sd=5)
hist(late)
mean(late)

t.test(early, late)


early<-rnorm(100, mean=0, sd=5)
hist(early)
mean(early)

late<-rnorm(100, mean=1, sd=5)
hist(late)
mean(late)

t.test(early, late)

early<-rnorm(500, mean=0, sd=5)
hist(early)
mean(early)

late<-rnorm(500, mean=1, sd=5)
hist(late)
mean(late)

t.test(early, late)

