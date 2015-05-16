wd <- getwd()
setwd("/Users/bobfridley/Documents/Coursera/03 - Getting and Cleaning Data/R-wd")

library(XML)

restaurantdata <- function() {
        dataDirectory <- "./data"
        destFile <- "restaurants.xml"
        destFilePath <- paste(dataDirectory, destFile, sep = "/")

        if (!file.exists(dataDirectory)) {
                dir.create(dataDirectory)
        }

        fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
        download.file(fileUrl, destfile = destFilePath, method = "curl")

        doc <- xmlTreeParse(destFilePath, useInternalNodes=TRUE)
        top <- xmlRoot(doc)
        print(xmlName(top))
        print(names(top))
        names <- top[[1]] [["name"]]
        zips <- top[[1]] [[ "zipcode" ]] 

        print(names)
        print(zips)
#         time_path <- "//row/name"
#         temp_path <- "//row/zipcode"
#         
#         df <- data.frame(
#                 latitude=doc[["number(//point/@latitude)"]],
#                 longitude=doc[["number(//point/@longitude)"]],
#                 start_valid_time=sapply(doc[time_path], xmlValue),
#                 hourly_temperature=as.integer(sapply(doc[temp_path], as, "integer"))
#         )
#         
#         print(head(df, 2))
}

setwd(wd)