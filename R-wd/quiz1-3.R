wd <- getwd()
setwd("/Users/bobfridley/Documents/Coursera/03 - Getting and Cleaning Data/R-wd")

library(rJava)
library(xlsxjars)
library(xlsx)

# c = numeric vector of columns
# r = numeric vector of rows
xlsx <- function(c, r) {
        dataDirectory <- "./data"
        destFile <- "gov_NGAP.xlsx"
        destFilePath <- paste(dataDirectory, destFile, sep = "/")
        
        if (!file.exists(dataDirectory)) {
                dir.create(dataDirectory)
        }
        
        fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
        download.file(fileUrl, destfile = destFilePath, method = "curl")
        
        # Read 2nd and 3rd columns
        colIndex <- c
        # Read rows 1 through 4
        rowIndex <- r
        
        ngap <- read.xlsx(destFilePath, sheetIndex = 1,
                colIndex = colIndex, rowIndex = rowIndex
        )

        result <- sum(ngap$Zip*ngap$Ext, na.rm=T)

        return(result)
}

setwd(wd)