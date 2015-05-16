wd <- getwd()
setwd("/Users/bobfridley/Documents/Coursera/03 - Getting and Cleaning Data/R-wd")

library("jpeg")

# set filepath
dataDirectory <- "./data"
destFile <- "jeff.jpg"
destFilePath <- paste(dataDirectory, destFile, sep = "/")

# create data directory if not exists
if (!file.exists(dataDirectory)) {
        dir.create(dataDirectory)
}

# download file if not exists
if (!file.exists(destFilePath)) {
        fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg"
        download.file(fileUrl, destfile=destFilePath, mode="wb", method="curl")
}

img <- readJPEG(destFilePath, native=TRUE)

quantile(img, probs=c(0.3, 0.8))
# result
#       30%       80% 
# -15259150 -10575416 

# restore working directory
setwd(wd)