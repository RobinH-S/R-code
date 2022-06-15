##-----------This is an R script--------
# Start the line with # to make comments/notes (not for code that you will want to run)
# You can also comment inline after code by inserting #

#Structure of the R Studio screen

#Run a line from the script: Ctrl+Enter / Cmd+Enter
#or use the Run button above

#Arithmetic
4 + 5
4/5
4/0


#----Variables------

x<-4 #using = for variable assignment is also possible, but not good practice
y<-5

x+y
X+y

z<-x/y
z

class(x)
x<-TRUE
class(x)
x<-"apple"
class(x)

x
#-------Vectors-------

x<-c(1,2,3,5,1,2,3)
x

y<-c("v","a","d","i","m")
z<-c("vadim")

#slicing/selecting elements from a vector

x[5]
x[4:6]
x[c(1,2,5,6)]
y[5]
z[5]

#you can do a lot of operations on vectors
sum(x)
length(x)
mean(x)
sd(x)

#-----Logical operators-------

2==3
2==2
2<3
2!=3

y==z
y
z

a<-c(1:10)
b<-c(1:5, 20:24)
a==b

#Exercise
#Write code to check whether two plus two equals four
#Bonus question: Check whether TRUE equals 
#the result of checking the truth of a true arithmetical statement

#------Matrix--------

matrix(c(20,10,30,40), nrow=2)
?matrix
matrix(c(20,10,30,40), nrow=2, byrow=T)

tab<-matrix(c(20,10,30,40), nrow=2)
tab

#adding columns or rows to a matrix
cbind(tab, c(50,60))
tab
rbind(tab, c(50,60))
tab<-rbind(tab, c(50,60))
tab

#add names to the matrix
rownames(tab)<-c("first", "second", "third")
colnames(tab)<-c("col1", "col2")


#slicing a matrix
tab[1,1]
tab[1,2]
tab[1,]
tab[,1]

#Exercise
#Create a table with age and weight for three imaginary people
#Give appropriate names to columns and rows
#Calculate the sum of all ages, the sum of all weights,
#and the sum of all numbers in the table



ex<-matrix(c(18,55,12,55,77,63), nrow=3)
ex
rownames(ex)<-c("John", "Amber", "Mary")
colnames(ex)<-c("age", "weight")
ex
sum(ex[,1])
sum(ex[,2])
sum(ex)

tab2<-matrix(c(15, 60, 20, 73, 24, 63), nrow=2)
rownames(tab2)<-c("age", "weight")
colnames(tab2)<-c("Ola", "Lars", "Sofie")
tab2

sum(tab2[1,])
sum(tab2[2,])
sum(tab)

#-------Factors--------

#Factors are variables with a fixed number of levels

color<-c(rep("blue", 5), rep("red", 5))
color
class(color)
summary(color)

color<-factor(color) #we should make R recognize this vector as a factor
class(color)
summary(color)

#------Data frames-------

df<-data.frame(tab)
df

df$col1

#now we can add vectors of different types
df$charater<-c("one", "two", "three")
df

df2<-df[,-3] #remove a column from a dataframe
df2

#Exercise
#Turn the table you created in the previous exercise into a data frame
#Add a column with fictional dog names for the people in the table
#Make the column with names a factor
#Ask R for the summary of the data frame




ex
ex<-data.frame(ex)
ex$dognames<-c("Fido", "Elvis", "Fluffy")
ex

class(ex$dognames)
ex$dognames<-factor(ex$dognames)
class(ex$dognames)

summary(ex)

