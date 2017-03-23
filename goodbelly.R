#---------------------------------------------------------------------------
#---------------------------------------------------------------------------
#  GoodBelly
#  Written by Rafael Guimaraes
#  Date March 23th 2017
#  Version 1.0
#  ---------------------------------------------------------------------------
#  ---------------------------------------------------------------------------

# Goodbelly analysis
library(car)
library(corrplot)
library(corrgram)

gb <- read.csv("data/goodbelly.csv", header = TRUE)
str(gb)
dim(gb)
#gb <- read.csv("data/goodbelly.csv", header = TRUE)[,1:12]
gb <- gb[, 1:12] # Use only the first 12 variables
# split into training and test sets before exploration

set.seed(1980) # set seed for repeatability of training-and-test split
temp <- sample(2,nrow(gb),replace=TRUE, prob=c(0.67,0.33)) # vector of random 1s & 2s

train <- gb[temp==1,]  # training subset uses rows where temp = 1
test <- gb[temp==2,]
dim(train)
# prepare to examine correlations
options(digits=2)
allcorr <- cor(train[,4:12],method="pearson")
allcorr
corrgram(train, order=NULL, lower.panel=panel.shade,
         upper.panel=NULL, text.panel=panel.txt,
         main="Good Belly Training")

library(MASS)
model <- (Units.Sold ~ Average.Retail.Price + Sales.Rep +
            Endcap + Demo + Demo1.3 + Demo4.5 + Sales.Rep *
            Endcap +Sales.rep*Demo + Sales.rep*Demo1.3)
step <- stepAIC(fit, direction = "both")
step$anova
step$
fit <- lm(model, data=train)
options(digits=1)
summary(fit)



