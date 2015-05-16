wd <- getwd()
setwd("/Users/bobfridley/Documents/Coursera/03 - Getting and Cleaning Data/R-wd")

library(XML)

weatherdata <- function() {
        dataDirectory <- "./data"
        destFile <- "weather.xml"
        destFilePath <- paste(dataDirectory, destFile, sep = "/")
        
        if (!file.exists(dataDirectory)) {
                dir.create(dataDirectory)
        }
        
        fileUrl <- "http://forecast.weather.gov/MapClick.php?lat=29.803&lon=-82.411&FcstType=digitalDWML"
        download.file(fileUrl, destfile = destFilePath, method = "auto")
        
        data <- xmlTreeParse(destFilePath, useInternalNodes=TRUE)
        # get root node (entire document)
        rootNode <- xmlRoot(data)

        time_path <- "//start-valid-time"
        temp_path <- "//temperature[@type='hourly']/value"

        df <- data.frame(
                latitude=data[["number(//point/@latitude)"]],
                longitude=data[["number(//point/@longitude)"]],
                start_valid_time=sapply(data[time_path], xmlValue),
                hourly_temperature=as.integer(sapply(data[temp_path], as, "integer"))
        )

        print(head(df, 2))
}