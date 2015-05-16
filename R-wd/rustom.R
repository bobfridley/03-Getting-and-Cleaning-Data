# step 1
# Load the Gross Domestic Product data for the 190 ranked countries in this data set: 
# https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv 

fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"

# on Mac, use method=CURL if using https
download.file(fileURL, destfile="FGDP.csv", method = "curl")

# read the data
df_FGDP <- read.table("./FGDP.csv", sep=",", skip=5, quote = "\"")

## It works until head rows upto 98. Average value is correct up to row 98.
## If I read more rows from head function, the average stays the same (i.e. as though there were only 98 rows)

GDP_rank190 <- head(df_FGDP, 190)
print(GDP_rank190)
colnames(GDP_rank190) <- c("GDPCountryCode", "Ranking","Empty","Economy", "dollars","NA1","NA2","NA3", "NA4", "NA5")

# step 2
# Remove the commas from the GDP numbers in millions of dollars and average them. 
GDP_rank190$dollars <- gsub(",", "", GDP_rank190$dollars)

# step 3
# What is the average? 
# Original data sources: http://data.worldbank.org/data-catalog/GDP-ranking-table
GDP_rank190$dollars <- as.numeric(GDP_rank190$dollars, na.rm=TRUE)
mean(GDP_rank190$dollars, na.rm= TRUE)