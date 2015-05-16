# Week 3
wd <- getwd()
setwd("/Users/bobfridley/Documents/Coursera/03 - Getting and Cleaning Data/R-wd")

# set filepath
dataDirectory <- "./data"
destFile <- "restaurants.csv"
destFilePath <- paste(dataDirectory, destFile, sep="/")

# create data directory if not exists
if (!file.exists(dataDirectory)) {
        dir.create(dataDirectory)
}

# download file if not exists
if (!file.exists(destFilePath)) {
        fileUrl <- "https://data.baltimorecity.gov/api/views/k5ry-ef3g/rows.csv?accessType=DOWNLOAD"
        download.file(fileUrl, destfile=destFilePath, method="curl")
}

restData <- read.csv(destFilePath)

# creating sequences
s1 <- seq(1, 10, by=2); s1
s2 <- seq(1, 10, length=3); s2
x <- c(1, 3, 8, 25, 100); seq(along=x)

# subsetting variables - booleans
restData$nearMe = restData$neighborhood %in% c("Roland Park", "Homeland")
table(restData$nearMe)

# subsetting variables - binary
# ifelse(condition, meets condition, doesn't meet condition)
restData$zipWrong = ifelse(restData$zipCode < 0, TRUE, FALSE)
table(restData$zipWrong,restData$zipCode < 0)

# creating categorical variables
restData$zipGroups = cut(restData$zipCode, breaks=quantile(restData$zipCode))
table(restData$zipGroups)
table(restData$zipGroups, restData$zipCode)
# creating categorical variables - easier way
library(Hmisc)
restData$zipGroups = cut2(restData$zipCode, g=4)
table(restData$zipGroups)

# creating factor variables
restData$zcf <- factor(restData$zipCode)
restData$zcf[1:10]
class(restData$zcf)

# levels of factor variables
yesno <- sample(c("yes", "no"), size=10, replace=TRUE)
yesnofac = factor(yesno, levels=c("yes", "no"))
relevel(yesnofac, ref="yes")
as.numeric(yesnofac)

# cutting produces factor variables
library(Hmisc)
restData$zipGroups = cut2(restData$zipCode,g=4)
table(restData$zipGroups)

# using the mutate function
library(Hmisc); library(plyr)
restData2 = mutate(restData,zipGroups=cut2(zipCode,g=4))
table(restData2$zipGroups)






# restore working directory
setwd(wd)