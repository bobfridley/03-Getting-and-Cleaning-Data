wd <- getwd()
setwd("/Users/bobfridley/Documents/Coursera/03 - Getting and Cleaning Data/R-wd")

# require sqldf library
library(sqldf)

# set filepath
dataDirectory <- "./data"
destFile <- "ss06pid.csv"
destFilePath <- paste(dataDirectory, destFile, sep = "/")

df <- function() {
        # create data directory if not exists
        if (!file.exists(dataDirectory)) {
                dir.create(dataDirectory)
        }

        # download file if not exists
        if (!file.exists(destFilePath)) {
                fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
                download.file(fileUrl, destfile=destFilePath, method="curl")
        }

        # Read csv file into data frame
        acs <- read.csv(destFilePath, colClasses = "character")

        print(nrow(sqldf("select distinct AGEP from acs")))
        print(length(unique(acs$AGEP)))

        pwg <- sqldf("select pwgtp1, AGEP from acs where AGEP < 50")
        print(pwg)
}

# restore working directory
setwd(wd)