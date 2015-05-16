wd <- getwd()
setwd("/Users/bobfridley/Documents/Coursera/03 - Getting and Cleaning Data/R-wd")

# require RMySQL library
library(RMySQL)

# set filepath
dataDirectory <- "./data"
destFile <- "ss06pid.csv"
destFilePath <- paste(dataDirectory, destFile, sep = "/")

db <- function() {
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
        df <- read.csv(destFilePath, colClasses="character")

        if (mysqlHasDefault()) {
                #mydb <- dbConnect(RMySQL::MySQL(), group='my-db', host='127.0.0.1')
                mydb <- dbConnect(RMySQL::MySQL(), username='root',
                        password='Clair1921', host='127.0.0.1')

                # list databases
                dbs <- dbGetQuery(mydb, "show databases;")

                # check if aes db exists
                if (!("ss06pid" %in% dbs$Database))
                        # create database
                        dbGetQuery(mydb, "create database ss06pid;")
                
                # select database
                dbGetQuery(mydb, "use ss06pid;")
                
                # check for table acs in database ss06pid
                tables <- dbGetQuery(mydb, "show tables;")
                if (!("acs" %in% tables$Tables_in_ss06pid))
                        # create table from data.frame
                        dbWriteTable(mydb, name='acs', value=df)
                
                print(length(unique(df$AGEP)))
                print(nrow(dbGetQuery(mydb, "select distinct AGEP from acs;")))
                print(dbGetQuery(mydb, "select pwgtp1 from acs where AGEP < 50;"))
                
                # disconnect MySql
                dbDisconnect(mydb)
        } else {
                message("No default database for MySQL")
        }
}

# restore working directory
setwd(wd)