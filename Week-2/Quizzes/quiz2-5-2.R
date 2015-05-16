wd <- getwd()
setwd("/Users/bobfridley/Documents/Coursera/03 - Getting and Cleaning Data/R-wd")

# set filepath
dataDirectory <- "./data"
destFile <- "getdata-wksst8110.for"
destFilePath <- paste(dataDirectory, destFile, sep = "/")

# create data directory if not exists
if (!file.exists(dataDirectory)) {
        dir.create(dataDirectory)
}

# download file if not exists
if (!file.exists(destFilePath)) {
        fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for"
        download.file(fileUrl, destfile=destFilePath, method="curl")
}

df <- read.fwf(destFilePath, c(10, 9, 4, 9, 4, 9, 4, 9, 4), skip=4)

print(nrow(df))
# [1] 1254

print(head(df))
#            V1  V2   V3   V4   V5   V6   V7   V8  V9
# 1  03JAN1990 23.4 -0.4 25.1 -0.3 26.6  0.0 28.6 0.3
# 2  10JAN1990 23.4 -0.8 25.2 -0.3 26.6  0.1 28.6 0.3
# 3  17JAN1990 24.2 -0.3 25.3 -0.3 26.5 -0.1 28.6 0.3
# 4  24JAN1990 24.4 -0.5 25.5 -0.4 26.5 -0.1 28.4 0.2
# 5  31JAN1990 25.1 -0.2 25.8 -0.2 26.7  0.1 28.4 0.2
# 6  07FEB1990 25.8  0.2 26.1 -0.1 26.8  0.1 28.4 0.3

print(sum(df$V4))
# correct answer
# [1] 32426.7

# restore working directory
setwd(wd)