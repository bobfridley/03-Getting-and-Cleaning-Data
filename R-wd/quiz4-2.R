wd <- getwd()
setwd("/Users/bobfridley/Documents/Coursera/03 - Getting and Cleaning Data/R-wd")

# load packages using sapply
# non-verbose (no package messages)
packages <- c("dplyr", "data.table")
loadp <- sapply(packages, library, character.only=TRUE, quietly=TRUE,
        logical.return=TRUE)

if (!all(loadp)) {
        stop("unable to load required packages")
}

# set filepath
dataDirectory <- "./data"
destFile <- "FGDP.csv"
destFilePath <- paste(dataDirectory, destFile, sep="/")

# create data directory if not exists
if (!file.exists(dataDirectory)) {
        dir.create(dataDirectory)
}

# download files if not exists
if (!file.exists(destFilePath)) {
        fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
        download.file(fileUrl, destfile=destFilePath, method="curl")
}

# Read GDP file into data table, skip 1st 5 rows
FGDP <- data.table(read.csv(destFilePath, skip=4, nrows=215))
#print(head(FGDP, 190))

# Remove missing country codes
FGDP <- FGDP[X != '']
# subset data table with valid columns
FGDP <- subset(FGDP, select=c("X", "X.1", "X.3", "X.4"))

# rename columns
setnames(FGDP, c("X", "X.1", "X.3", "X.4"),
        c("countrycode", "rank", "countryname", "gdp"))

gdp <- as.numeric(gsub(",", "", FGDP$gdp))
gdpmean <- mean(gdp, na.rm=TRUE)
print(gdpmean)

# restore working directory
setwd(wd)