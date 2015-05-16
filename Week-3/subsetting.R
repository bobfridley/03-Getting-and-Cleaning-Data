# Week 3
wd <- getwd()
setwd("/Users/bobfridley/Documents/Coursera/03 - Getting and Cleaning Data/R-wd")

set.seed(13435)
X <- data.frame("var1"=sample(1:5),"var2"=sample(6:10),"var3"=sample(11:15))
X <- X[sample(1:5),]; X$var2[c(1,3)] = NA
print(X)






library(plyr)
X2 <- arrange(X,var1)
print(X2)

X2 <- arrange(X, var1, var2, na.last(TRUE))
print(X2)


# restore working directory
setwd(wd)