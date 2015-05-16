wd <- getwd()
setwd("/Users/bobfridley/Documents/Coursera/03 - Getting and Cleaning Data/R-wd")

# set filepath
dataDirectory <- "./data"
destFile <- "ss06hid.csv"
destFilePath <- paste(dataDirectory, destFile, sep = "/")

# create data directory if not exists
if (!file.exists(dataDirectory)) {
        dir.create(dataDirectory)
}

# download file if not exists
if (!file.exists(destFilePath)) {
        fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
        download.file(fileUrl, destfile=destFilePath, method="curl")
}

# Read csv file into data frame
# acr - acreage - 3 = 10 or more acres
# agr - sales of agricultural products - 6 = sales > 10000
acragr <- read.csv(destFilePath, colClasses="character")
print(head(acragr, n=5))

agricultureLogical <- ifelse((acragr$ACR==3 & acragr$AGS==6), TRUE, FALSE)
x <- which(agricultureLogical)
x[1:3]
# result
#[1] 125 238 262

# restore working directory
setwd(wd)