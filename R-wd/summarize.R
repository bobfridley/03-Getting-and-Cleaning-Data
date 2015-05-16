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

# look at top 3 rows of dataset
message("top 3 rows of dataset")
print(head(restData, n=3))

# look at bottom 3 rows of dataset
message("bottom 3 rows of dataset")
print(tail(restData, n=3))

# summary of dataset
message("summary of dataset")
print(summary(restData))

# in depth information
message("more in depth information")
print(str(restData))

# quantiles - variability in quantitative variables
message("quantile - variability")
print(quantile(restData$councilDistrict, na.rm=TRUE))

# quantiles - probability
message("quantile - probability")
print(quantile(restData$councilDistrict, probs=c(0.5, 0.75, 0.9)))

# make table
# useNA - ifany - add column(s) to table if variable is NA
# and gives count
message("make table of 1 column")
print(table(restData$zipCode, useNA="ifany"))

# make table of 2 columns
# councilDistrict by zipCode
message("make table of 2 columns")
print(table(restData$councilDistrict, restData$zipCode))

# check for missing values
message("number of missing values")
print(sum(is.na(restData$councilDistrict)))
message("are any missing for councilDistrict?")
print(any(is.na(restData$councilDistrict)))
message("are all zipCodes > 0?")
print(all(restData$zipCode > 0))
message("do any columns have missing data?")
print(colSums(is.na(restData)))
message("any missing data in entire dataset?")
# 0=FALSE, 1=TRUE
print(all(colSums(is.na(restData))==0))

# column values with specific characteristics
message("zipCode = 21212")
print(table(restData$zipCode %in% c("21212")))
# or
print(table(restData$zipCode==c("21212")))
message("zipCode amount 21212 and 21213")
print(table(restData$zipCode %in% c("21212", "21213")))

# subset dataset with rows having specific characteristics
message("rows with zipCode amoung 21212 and 21213")
print(restData[restData$zipCode %in% c("21212","21213"),])

# summary or cross tabs
message("cross tabs using UCBAdmissions - builtin dataset")
data(UCBAdmissions)
DF <- as.data.frame(UCBAdmissions)
print(summary(DF))
message("")
xt <- xtabs(Freq ~ Gender + Admit,data=DF)
print(xt)

# cross tabs on large number of variables
# using warpbreaks data builtin data set
warpbreaks$replicate <- rep(1:9, len=54)
xt <- xtabs(breaks ~., data=warpbreaks)
message("cross tabs on large number of variables")
print(xt)

# flat tables
message("flat table from multi-dimensional table - xt")
print(ftable(xt))

# size of dataset
message("size of dataset in bytes")
fakeData <- rnorm(1e5)
print(object.size(fakeData))
message("size of dataset in megabytes")
print(object.size(fakeData), units="Mb")
message("size of dataset in gigabytes")
print(object.size(fakeData), units="Gb")


# restore working directory
setwd(wd)