wd <- getwd()
setwd("/Users/bobfridley/Documents/Coursera/03 - Getting and Cleaning Data/R-wd")

jleekgit <- function() {
        library(jsonlite)

        jsonData <- fromJSON("https://api.github.com/users/jtleek/repos")

        ## Nested objects in JSON
        # display all top-level variables
        names(jsonData)

        # display all levels under $owner
        names(jsonData$owner)

        # drill down through all repos on corresponding github page
        # display login
        jsonData$owner$login
}

dataframetoJSON <- function () {
        ## Writing data frames to JSON format using 'iris' dataset
        myjson <- toJSON(iris, pretty = TRUE)
        # output JSON object as JSON data
        cat(myjson)

        # convert back to JSON
        iris2 <- fromJSON(myjson)
        head(iris2)
}
setwd(wd)