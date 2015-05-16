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
FGDPdestFile <- "FGDP.csv"
FGDPdestFilePath <- paste(dataDirectory, FGDPdestFile, sep="/")
FEDSTATSdestFile <- "FEDSTATS_Country.csv"
FEDSTATSdestFilePath <- paste(dataDirectory, FEDSTATSdestFile, sep="/")

# create data directory if not exists
if (!file.exists(dataDirectory)) {
        dir.create(dataDirectory)
}

# download files if not exists
if (!file.exists(FGDPdestFilePath)) {
        fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
        download.file(fileUrl, destfile=FGDPdestFilePath, method="curl")
}

if (!file.exists(FEDSTATSdestFilePath)) {
        fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
        download.file(fileUrl, destfile=FEDSTATSdestFilePath, method="curl")
}

# Read GDP file into data table, skip 1st 5 rows
FGDP <- data.table(read.csv(FGDPdestFilePath, skip=4, nrows=215, stringsAsFactors=FALSE))

# Remove missing country codes
FGDP <- FGDP[X != '']
# subset data table with valid columns
FGDP <- subset(FGDP, select=c("X", "X.1", "X.3", "X.4"))

# rename columns
setnames(FGDP, c("X", "X.1", "X.3", "X.4"),
        c("countrycode", "rank", "countryname", "gdp"))

# Read FEDSTATS file into data table
FEDSTATS <- data.table(read.csv(FEDSTATSdestFilePath, stringsAsFactors=FALSE))
# merge data tables
mergedData <- merge(FGDP, FEDSTATS, by="countrycode", all=TRUE)
# sort by Rank desc
md <- mergedData[order(mergedData$rank, decreasing=TRUE),]

qgroups <- quantile(md$rank, probs=seq(0, 1, by=0.2), na.rm=TRUE)
print(qgroups)
md$GDP <- cut(md$rank, breaks=qgroups)
print(md$GDP)
qg <- md[Income.Group=="Lower middle income", .N, by=c("Income.Group", "gdp")]
print(qg)

# restore working directory
setwd(wd)