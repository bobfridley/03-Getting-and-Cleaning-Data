library(RMySQL)

# connect to db and set db handle
ucscDb <- dbConnect(MySQL(), user="genome", 
        host="genome-mysql.cse.ucsc.edu")

# run db command and disconnect
result <- dbGetQuery(ucscDb, "show databases;"); dbDisconnect(ucscDb);