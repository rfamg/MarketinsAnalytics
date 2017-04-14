#---------------------------------------------------------------------------
#---------------------------------------------------------------------------
#  SVEDKA
#  Written by Rafael Guimaraes, Brian Kangogo and Nicholas Matthew
#  Date April 8th 2017
#  Version 1.0
#  ---------------------------------------------------------------------------
#  ---------------------------------------------------------------------------

# Goodbelly analysis
library(car)
library(corrplot)
library(fBasics) # Show basic aspect of the data
library(readr)  # provide additional data-reading functions
library(corrplot) # attractive correlation graphs
library(ggplot2) # for plots
library(data.table)
library(dplyr)
library(reshape2)
library(corrgram)

#  ---------------------------------------------------------------------------
#  Data cleaning and Understanding
#  ---------------------------------------------------------------------------

df <- read_csv("https://raw.githubusercontent.com/rfamg/MarketinsAnalytics/master/data/vodka.csv")

df[,68:75] <- NULL

head(df)

names(df)

str(df)

#  ---------------------------------------------------------------------------
#  1 - Create a simple histogram of our target variable, TotalSales.  Comment on the shape of the distribution that you see.
#  ---------------------------------------------------------------------------

summary(df$TotalSales)


qplot(df$TotalSales, 
 binwidth = 1000,  
main = "Histogram of total sales",
xlab = "value of sales",  
  fill=I("blue"), 
  col=I("blue"))
 

hist(df$TotalSales, breaks = 10, 
     main = "Histogram of Total sales",
     xlab = "Sales", col="Blue", border = "red")


#  ---------------------------------------------------------------------------
#  2 - Run a regression of the natural logarithm of total sales on the the following variables: 
#  price, print marketing expenditure, outdoor marketing expenditure, broadcast marketing expenditure, 
#  and previous year’s sales. Keeping in mind your answer to #1, explain why it makes sense to use ln(TotalSales) 
#  for the dependent variable. Comment on the relative influence of the five variables on sales.
#  --------------------------------------------------------------------------- 



fit1 <- lm(LnSales ~ PriceRerUnit+
                    Print +
                    Outdoor + 
                    Broad +
                    LagTotalSales, data = df)

summary(fit1)


#  ---------------------------------------------------------------------------
#  3 - Sometimes we can improve model fit by taking logs on independent variables. 
#  Run a second regression of the natural logarithm of change in sales on the the natural logarithm of 
#  previous period’s prices, and the natural log of marketing expenditures on print, outdoor, and broadcasting.  
#  Comment on the comparison of your two models at this point in the analysis..
#  --------------------------------------------------------------------------- 

  fit2 <- lm(LnSales - LnLSales~ LnPrice +
              LnPrint +
              LnOut + 
              LnBroad, data = df)
  
  summary(fit2)


#  ---------------------------------------------------------------------------
#  4 - To understand the influence of vodka quality, expand your regression model from 
#  question 2 by adding the tier 1 and tier 2 dummy variables (that indicate whether a vodka brand belongs 
#  to the first or second quality tiers) to the set of independent variables named in question 
#  2.  How does quality influence sales?
#  --------------------------------------------------------------------------- 

fit3 <- lm(LnSales ~ PriceRerUnit+
            Print +
            Outdoor + 
            Broad +
            LagTotalSales +
            Tier1 +
            Tier2, data = df)

summary(fit3)

#  ---------------------------------------------------------------------------
#  5 - To understand the influence of competition and brand power, expand your model again and run a 
#  regression by adding the sum of sales of all the competing brands in the previous year (“lagtotalminussales”) to 
#  the independent variables in question 3. What additional insight does this model provide?
#  --------------------------------------------------------------------------- 


fit4 <- lm(LnSales - LnLSales ~ LnPrice +
            LnPrint +
            LnOut + 
            LnBroad +
            LagTotalMinusSales, data = df)

summary(fit4)

#  ---------------------------------------------------------------------------
#  6 - To measure the sales growth of new brands compared to the existent ones, include the 
#  variable “firstintro” to the independent variable set in question 4. “Firstintro” is equal to 1 in the 
#  first three years after a brand is introduced, and equals 0 elsewhere.  
#  How does it help to include this variable in the model?
#  --------------------------------------------------------------------------- 

fit5 <- lm(LnSales ~ PriceRerUnit+
            Print +
            Outdoor + 
            Broad +
            LagTotalSales +
            Tier1 +
            Tier2 +
            Firstintro, data = df)

summary(fit5)


#  ---------------------------------------------------------------------------
#  Comparing Coefficients
#  ---------------------------------------------------------------------------

coef(fit2)
coef(fit3)
coef(fit4)
coef(fit5)

#  ---------------------------------------------------------------------------
#  8 -Create a time-series plot with two lines on it:  total industry sales units for Tier 1 brands 
#  and total industry sales units for Tier 2 brands. NOTE: This will require some aggregation and pre-processing 
#  of the data, and is more of a challenge than it might appear. 
#  --------------------------------------------------------------------------- 

ag1 <- aggregate(df$TotalSales ~ df$Year + df$Tier1, FUN = sum)
setnames(ag1, old = c("df$Tier1","df$Year",       "df$TotalSales"),
                     new = c("Tier",      "Year",       "TotalSales"))


ag2 <- aggregate(df$TotalSales ~ df$Year + df$Tier2, FUN = sum)
setnames(ag2, old = c("df$Tier2","df$Year",       "df$TotalSales"),
         new = c("Tier",      "Year",       "TotalSales"))



Tier1 <- ag1[which(ag1$Tier==1 & Tier$Year),]
Tier1$Tier <- NULL



Tier2 <- ag2[which(ag2$Tier==1 & Tier$Year),]
Tier2$Tier <- NULL


#fmt_dcimals <- function(decimals=0){
  # return a function responpsible for formatting the 
  # axis labels with a given number of decimals 
 # function(x) as.character(round(x,decimals))
#}



ggplot(Tier1,aes(Year,TotalSales)) + 
  geom_line(aes(color="Tier1")) +
  geom_line(data=Tier2,aes(color="Tier2")) +
  ylab("Total Sales") +
  xlab("Year") +
  ggtitle("Tier1 vs Tier2")

