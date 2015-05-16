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
acragr <- read.csv(destFilePath, colClasses="character")
# split on wgtp
fx <- strsplit(names(acragr), "wgtp", fixed=TRUE)
print(fx[[123]])

# split using regexp
x <- names(acragr)[123]
print(strsplit(x, "^[wgtpWGTP][0-9]$"))
print(strsplit(x, "[0-9].$"))

# restore working directory
setwd(wd)