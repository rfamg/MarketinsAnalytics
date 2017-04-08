# This is the r file to how to use R with the book Lear R in a Day
# Written by Rafael Guimar??es
# Date 13th February 2015
# Version 1.0


# 1.1 Assignment to objects
x<-10

a<-"y"

a<-x
#### A: It will not work, because is a invalid special character and they cannot be use to define names.

# 1.2 Simple Sums using Simple Objects

g<-5

x+g

abs(x)

# 1.3 Functions

divider <- function(x,y) {
  result <- x/y
  print(result)
}

divider(50,25)

divider(22,4.4)

divider(g,a)

divider(a+x,g)

# A1: the function created has to work with two variables
#divider(a)
#divider(1)
#divider(a,x,g)

# 1.4 Concatenation and Arrays
f <- c(1,2,3,4,5)
### Arrays - Collecion of values
f+4
d <- f/4
f+d
h<-c(1,2,3,4)
f+h
# A: longer object length is not a multiple of shorter object length

# 1.5 Listing and Deleting Objects
###How to create a list
ls()

### How to remove a item and everyting from your list
rm(a)
rm(list=ls())

# 1.6 Adding Comments

a <- 25 # the value '25' is assigned to object 'a'
b <- 75 # the value '75' is assigned to object 'b'
c <- a + b # 'a'and 'b' are summed and assigned to 'c'
c # display 'c'

#### Exercises

# a) 8 km

a <- 346
b <- 354
c <- b-a
c

# b) 1.02

d <- b/a
d

# c) 
multiplier <- function (x,y,z) {
  result <- x*y*z
  print(result)
}

multiplier(12.8,19.2,pi)

# d)
rm(list=ls())


#################################################################################

# 2. Sequence and Subscripting

# 2.1 Sequences

1:20 # creating sequences
12:28 # creating sequences
5:-5 # sequences with negatives numbers

2*1:10 # for the sequence the priority is always the expression

2*(1:10) # 2*(1:10) is the same as 2*1:10

# for more elabortes sequences use the seq() function

seq(from=1, to=21, by=6) # for more elaborated sequences

seq(from=-3, to=20, length=12) # an example using length

seq(from=100, length=4, by=-6.5) # an example omiting the parameter 'to'

x <- 11:20 # First sequence
x

seq(from=30, to=34.5, along=x) # this will create the same number of elemnets as we used above

# 2.2 Subscripting
## involves acessing or extracting elements of a multipart object

x[2] # square bractes are used to acess the particular elemnent of the aaray

x[-8] # the (-) extracts everything minus the selected object

x[c(5,7)] # concatenation can retrive the selected sequence

x[c(-5,-7)] # the same as before

x[x>15] # simple query 


# 2.3 Subscripting Data Frames

new_df <- data.frame(X=101:110, y=seq(from=51, by=2.5, length=10)) # Creating a data frame

new_df [4,2] # 58.5 To guet a value of a colunm

as.data.frame(new_df[,2]) # to see the result in a Colunm

new_df[7,] # to see the 7th value in each colunm

as.data.frame(new_df[6:10,2]) # to see the 6th to 10th value of colunm 2

new_df$X # use this whe you have a lot of colunms

new_df$X[4] #The square bracket can also be used

new_df$X[2:6]

new_df$X[c(2,6)]

# 2.4 Object Dimensions

ncol(new_df) # number of colunms

nrow(new_df) # number of rows

dim(new_df) # the dimension of the data frame

new_array <- seq(from=100, length=50, by=7.5)

length(new_array) #to see the number of objects in the data frame

new_array[length(new_array)] # to establish the final element

###### Exercises

# 1.
a <- seq(from=60, to=85, by=1)

# 2. 71

a[12]

# 3. 79

a[20]

# 4. 64 & 84

a[c(5,25)]

# 5. 63 67 71 75 79 83

a[c(4,8,12,16,20,24)]

# 6.

a[-18]

# 7.

a[c(-2, -15, -17)]

# 8. The colon(:) has the higher priority, so 1:n-1 generates a sequence from 1 to 10 from each value, in contrast 1:(n-1) allows the brackets to be calculated  separately and thus determines the sequence end to be 9

# 9 .

new_frame <- data.frame(x=33:47, y=seq(from=115, to=157, by=3), z=seq(from=10, length=15, by=8.5))

# 10.

new_frame$x

# 11. 130 133 136 139 142

new_frame[6:10,2]

# 12. 43 145 95

new_frame[11,]

# 13.

as.data.frame(new_frame[4:8,c(1,3)])

# 14. 15

nrow(new_frame)

# 15.

new_frame$x

new_frame[,1]

new_frame[,c(-2,-3,-4)]

new_frame$x[1:15]

################################################################################################

# 3. Data querying and simple estatistics

# 3.1 Data Querying

sunspot.year <- data.frame(Year=1700:1988,Sunspot.count=sunspot.year) # Creating a Data Frame 

head(sunspot.year) # to see the first six rows of a data frame

tail(sunspot.year) # to see the final rows of a data frame

sunspot.inter <- round(sunspot.year) # Transfomr the values in whole numbers

tail(sunspot.inter)

any(sunspot.inter[,2]<0) # command to test the numbers of the Data Frame

any(sunspot.inter[,1] < 1700 | sunspot.inter[,1] > 1988) # use use 'or' to test more things

mean(sunspot.inter[,2]) # to get the mean

round(mean(sunspot.inter[,2]))

round(mean(sunspot.inter[,2]), digits=2) # to control the number of digits

max(sunspot.inter[,2]) # to get the maximum number

which(sunspot.inter[,2] ==190) # to get the row of the desired value

sunspot.inter[258,] # to se exact values of the row

which(sunspot.inter[,2] ==0) # se the rows with values equal to 0

sunspot.inter[c(12,13,111),]

length(which(sunspot.inter[,2]<=5)) # see the frequency of matching values

sunspot.inter[(which(sunspot.inter[,2]<=5)),] # to se the rows of the frequency values desired

summary(sunspot.inter[,2]) # to gain a rapid statistical information of your data

colSums(sunspot.inter[2]) # to get the total number in a specific colunm

# 3.2 Handing missing data

head(airquality)

air <- airquality

mean(air[,2]) # Not available because of the missing values

mean(air[,2], na.rm=TRUE) #Remove the NA (NOT AVAILABLE) from the data

any(is.na(air)) # to test if there is NA in the DATA

air.complete <- na.omit(air) # remove the rows containing NA

head(air.complete)

any(is.na(air.complete)) # see if all the NA were omited


# 3.3 Simple Statistics: Correlation

t.test(air[1:31,1], air[124:153,1]) # the means are not so different so the null hypothesis confirns

cor.test(ToothGrowth[,1], ToothGrowth[,3]) # See the correlation beetwen to colunms

# 3.4 Summary Statistics

summary(air$Solar.R) # The NA are automatically removed from the calculations. 

range(air.complete) # the range of the sample

var(air.complete) # Sample Variance

quantile(??) # Vector containing the minimum, mediam and maximum quantile

cumsum(air) # cumulative sum

cumprod(air.complete) # Cumulative product

colMeans(air.complete) # The Columns Means

rowMeans(air.complete) # The row means

colSums(air.complete) # The columns sums

rowSums(air.complete) # The row sums

#### Exercises

# 1. 42.0991

mean(air.complete$Ozone)

# 2. 42.1

round(mean(air.complete$Ozone), digits=2)

# 3. FALSE

any(is.na(air$Temp))

# 4. 

tc <- function(x) {
  celsius <- round((5/9) * (x - 32), digits=1)
  print(celsius)
  }

tc(air[,4])

# 5. 36.11 13.33

tc(max(air[,4]))

tc(min(air[,4]))

# 6. 4

length(which(air.complete$Wind <= 4))

# 7.

air.complete[which(air.complete$Solar.R > 300),]

# 8. 

median(air.complete$Ozone)

summary(air.complete$Ozone)

# 9.

cor.test(air.complete[,1], air.complete[, 2])

cor.test(air.complete[,1], air.complete[, 3])

cor.test(air.complete[,1], air.complete[, 4])

cor.test(air.complete[,1], air.complete[, 5])

cor.test(air.complete[,1], air.complete[, 6])

# 10

ToothGrowth

mean(ToothGrowth[which(ToothGrowth$supp=="OJ" & ToothGrowth$dose==2.0 ),1])

mean(ToothGrowth[which(ToothGrowth$supp=="VC" & ToothGrowth$dose==2.0 ),1])


########################################################################################################

# 4. Conditional and Iterative Execution

# 4.1 Conditional Execution

< # Less Than
> # Greater Than
== # equal to
& # And
! # Not
| # OR
  
# Example

a <- 10
b <- 11
if(b > a) {
print("b is greater than a")    
}
  
# Example 2

if(sum(1:3) >= sqrt(20)) {
  print("statement is true")
}

# Example 3

if(sum(1:3) >= sqrt(50)) {
  print("statement is true")
}

# Example 4 - Using "else" has to be as a addition to "if()"

if(sum(1:3) >= sqrt(50)) {
  print("statement is true")
} else {
  print("statement is false")
}  
  
# Example 5 -  more simple and concise sintax e.i. - ifelse(conditional text, result if True, Result is False)

ifelse(sum(1:3) >= sqrt(50), "statement is true", "statement is false")

# Example 6 - A conditional inside another

ifelse(sum(1:3) >= sqrt(50), "statement is true", ifelse(sum(1:3) >= sqrt(30),"statement is now true",
                                                         "statement is false"))

ifelse(sum(1:3) >= sqrt(50), "statement is true", ifelse(sum(1:3) >= sqrt(40),"statement is now true",
                                                         "statement is false"))

# 4.2 Restricting interactions - loops

# example 1
for(i in 1:5) {
  print((i+1)*3)
}

# example 2

j <- 0
k <- 0

for(i in 1:6) {
  j<- j+1
  k<- (k+i)*j
  print(i+j+k)
}

# example 3 - "i" can be formed prior to the construction of a loop

a <- c("x", "y", "z")
for(i in a) {
  print(i)
}

# 4.3 Unrestricted interaction - runnaways executions

x <- 0

while(x<10) {
  print(x)
  x<-x+1
}

# example of a runaway execution

never.ending <- 1
while(never.ending<5) {
  print(never.ending)
}

##### Exercises

# 1.
x <- 10
y <- 25
z <- 50

# 2.
if(x < y) {
  print("statement is correct")
} else {
  print("statement is incorrect")
}

# 3.

if(x < y) {
  print("statement is correct")
} else {
  print("statement is incorrect")
}

ifelse(x < y, "statement is correct", "statement is incorrect")

# 4. 


ifelse(x > y, "statement is true", ifelse(x > z,"one true, on false",
                                                         "both false"))

# 5.

for(i in 1:20) {
print(i)
}

# 6. 


for(i in 5:10) {
  print(i^2)-i
}

# 7.

word <- c("p","i","r","a","t","e")

for(i in word) {
  print(i)
}

# 8. 

x <- -10
while(x >= -20) {
  print(x)
  x <- x-1

}

# 9.

h <- 10
j <- -5

if(h < j) {
  print("statement is true")
} else {
  while(h >= j) {
    print(h)
    h<-h-1
  }
}

# 10.

h <- 10
j <- -5

if(h < j) {
  print("statement is true")
} else {
  for(i in h:j) {
    print(h)
    h<-h-1
  }
}


################################################################################################################

# 5. Data

# 5.1 Reading in External Data

# Loading a local dataset

AirPassengers


# 5.2 Setting the Working Directory

setwd("/User/rafaelmg/Desktop/")
getwd() # to check the work station you are using

# 5.3 Using read.table()

AP <- read.table("air.txt", header=TRUE, sep="") # loading a file into R

AP

?read.table # to see all the arguments about this command

# 5.4 Data Processing

AP$Ann_Sum <- cbind(rowSums(AP)) # add anothes colunm with the sums of the rows

# 5.5 Outputting Data

write.table(AP,"air_sums.txt", col.names=NA, row.names=TRUE,quote=FALSE,sep="\t") # How the sabe the dataset in a file

###### Exercises

# 1.

nottem

# 4.
NT <- read.table("nott.castle.txt", header=TRUE, sep="", quote="")

# 5.
TC <- function(x) {
  celsius <- round((5/9) * (x - 32), digits=1)
  print(celsius)
}

nott.celsius <- round(TC(NT), digits=4)

# 6. 
nott.celsius$Annual.mean <- round(cbind(rowMeans(nott.celsius)), digits=1)

# 7.

write.table(nott.celsius,"nott.castle.celsius.txt", col.names=NA, row.names=TRUE,quote=FALSE,sep="\t")


################################################################################################################

# 6. Graphics

# 6.1 Standard Graph Types


barplot(VADeaths) # Bar Charts

boxplot(len ~ dose, ToothGrowth, subset = supp == "VC") # Box-and-Whisker Plots

hist(islands) # Histograms

pie(1:15, col = rainbow(15)) # Pie Charts

plot(cars) # scatter e line graphs


# 6.2 Scatter and Line Graphs

head(trees)

plot(trees$Girth, trees$Height, type="b") # ploting using x & Y

# 6.3 Formating Axes

plot(trees$Girth, trees$Height, type="b", xlab="Tree Girth (inches)", ylab="Tree Height (feet)") # Naming the Axes


plot(trees$Girth, trees$Height, type="b", xlab="Tree Girth (inches)", ylab="Tree Height (feet)", xlim=c(8,21)
     , ylim=c(60,90)) # control the ranges of the plot

plot(trees$Girth, trees$Height, type="b", xlab="Tree Girth (inches)", las=1) # control the ranges of the plot

# 6.4 Changing the plot Characters

plot(trees$Girth, trees$Height, type="b", xlab="Tree Girth (inches)", pch=16) # pch - change the plot. see "?pch

# 6.5 Changing the size of the plot Charecters

plot(trees$Girth, trees$Height, type="b", xlab="Tree Girth (inches)", pch=16, cex=0.5) # cex - charecter expasion

# 6.6 Changing the colours of the plotting Characters

plot(trees$Girth, trees$Height, type="b", xlab="Tree Girth (inches)", col="springgreen4") # controling the colours - col


colours() # the list of colours available

# 6.7 Changing the line types

plot(trees$Girth, trees$Height, type="b", xlab="Tree Girth (inches)", lwd=4) # Control the width of the line

# 6.8 Adding a line of best fit

plot(trees$Girth, trees$Height, type="b", xlab="Tree Girth (inches)", las=1)
abline(lm(trees$Height ~ trees$Girth)) # use the symbol tilde(~), which corresponds to variable x being a function of variable Y

# 6.9 Addind a secondary Y-axis
    
par(mar=c(5,4,4,4)) # for plot that have more than one variable
plot(trees$Girth, trees$Height, type="b", xlab="Tree Girth (inches)", las=1)
par(new=TRUE)
plot(trees$Girth, trees$Volume, axes=FALSE, xlab="", ylab="", col="blue")
axis(side=4, las=1)
mtext(side=4,line=2.5, "Timber Volume (cubic feet")

# 6.10 Adding a Legend




















































