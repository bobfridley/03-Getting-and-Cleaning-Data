wd <- getwd()
setwd("/Users/bobfridley/Documents/Coursera/03 - Getting and Cleaning Data/R-wd")

csv <- function(x) {
        dataDirectory <- "./data"
        destFile <- "ss06hid.csv"
        destFilePath <- paste(dataDirectory, destFile, sep = "/")
        
        if (!file.exists(dataDirectory)) {
                dir.create(dataDirectory)
        }
        
        fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
        download.file(fileUrl, destfile = destFilePath, method = "curl")
        
        # Read csv file
        data <- read.csv(destFilePath, colClasses = "character")

        # extract only needed columns
        n = nrow(subset(data, data$VAL == as.numeric(x)))

        # return number of rows where VAL=x
        return(n)
}

setwd(wd)