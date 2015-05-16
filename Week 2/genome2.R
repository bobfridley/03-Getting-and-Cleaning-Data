library(RMySQL)

# connect to server and hg19 db and set db handle
hg19 <- dbConnect(MySQL(), user="genome", db="hg19",
        host="genome-mysql.cse.ucsc.edu")

# get all tables in db (hg19)
allTables <- dbListTables(hg19)

# how many tables
l <- length(allTables)

print(l)

# tables 1 through 5
print(allTables[1:5])

db <- "affyU133Plus2"

# list all columns in table affyU133Plus2
print(dbListFields(hg19, db))

# set query string
query <- "select count(*) from affyU133Plus2"

# get number of rows in affyU133Plus2
n <- dbGetQuery(hg19, query)
print(n)

# create data.frame from db
affyData <- dbReadTable(hg19, "affyU133Plus2")
head(affyData)

# select a subset from table
# send query to server but don't run
query <- dbSendQuery(hg19, "select * from affyU133Plus2 where misMatches between 1 and 3")
# fetch rows (run query) and create data.frame
affyMis <- fetch(query); 
# run quantile against column misMatches
quantile(affyMis$misMatches)

# fetch 1st 10 rows and clear the result set
affyMisSmall <- fetch(query, n=10); dbClearResult(query);