# Goodbelly analysis for Exam 2
library(car)
library(corrplot)
library(corrgram)

# "goodbelly.csv" has been saved with just the 12 columns we need. 
gb <- read.csv("https://raw.githubusercontent.com/IBSBigData/BUS256/master/Exam2%20data%20and%20r%20code/goodbelly.csv", header = TRUE)


# split into training and test sets before exploration

set.seed(1980) # set seed for repeatability of training-and-test split
temp <- sample(2,nrow(gb),replace=TRUE, prob=c(0.67,0.33)) # vector of random 1s & 2s

train <- gb[temp==1,]  # training subset uses rows where temp = 1
test <- gb[temp==2,]

# prepare to examine correlations
options(digits=2)
allcorr <- cor(train[,4:12],method="pearson")
allcorr
corrgram(train, order=NULL, lower.panel=panel.shade,
         upper.panel=NULL, text.panel=panel.txt,
         main="Good Belly Training")
#  ---------------------------------------------------------------------------
#  Model
#---------------------------------------------------------------------------

model <- (Units.Sold ~ Average.Retail.Price + Sales.Rep +
            Endcap + Demo + Demo1.3 + Demo4.5 + 
            Sales.Rep * Endcap +Sales.Rep * Demo + 
            Sales.Rep * Demo1.3 + Sales.Rep*Average.Retail.Price + Demo*Demo1.3
          )

fit <- lm(model, data=train)  # estimate the model
summary(fit)   # report regression results

# finally use the fitted model with the holdout data to judge performance
testfit <- predict(fit,newdata = test)
# adjust figure margins for graph
par(mar=c(1,1,1,1)) # set margin parameters

plot(fit$fitted.values, train$Units.Sold, 
     main="Actual vs. Fit, Training") # graph actual vs. fitted
cor(fit$fitted.values, train$Units.Sold, method="pearson")

plot(testfit, test$Units.Sold,
     main="Actual vs. Fit, Test") # graph actual vs. fitted
cor(testfit, test$Units.Sold, method="pearson")