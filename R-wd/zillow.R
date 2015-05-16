wd <- getwd()
setwd("/Users/bobfridley/Documents/Coursera/03 - Getting and Cleaning Data/R-wd")

library(XML)
library(RCurl)

reply = getForm("http://www.zillow.com/webservice/GetSearchResults.htm",
        'zws-id' = "X1-ZWz1az1zj3bz0r_7dhgw",
        address = "727 Sixth Ave",
        citystatezip = "Redwood, CA, 94063")

doc <- xmlTreeParse(reply, asText = TRUE, useInternal = TRUE)

print(xmlValue(doc[["//amount"]]))