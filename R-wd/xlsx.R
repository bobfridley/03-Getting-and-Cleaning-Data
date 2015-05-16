wd <- getwd()
setwd("/Users/bobfridley/Documents/Coursera/03 - Getting and Cleaning Data/R-wd")

cameradata <- function() {
        dataDirectory <- "./data"
        destFile <- "cameras.xlsx"
        destFilePath <- paste(dataDirectory, destFile, sep = "/")

        if (!file.exists(dataDirectory)) {
                dir.create(dataDirectory)
        }

        fileUrl <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.xlsx?accessType=DOWNLOAD"
        download.file(fileUrl, destfile = destFilePath, method = "curl")
        dateDownloaded <- date()

        list.files(dataDirectory)

        library(xlsx)

        cameraData <- read.xlsx(destFilePath, sheetIndex = 1, header = TRUE)
        head(cameraData)

        # Read 2nd and 3rd columns
        colIndex <- 2:3
        # Read rows 1 through 4
        rowIndex <- 1:4

        cameraDataSubset <- read.xlsx(destFilePath, sheetIndex = 1,
                colIndex = colIndex, rowIndex = rowIndex
        )

        cameraDataSubset
        print(dateDownloaded)
}

setwd(wd)