wd <- getwd()
setwd("/Users/bobfridley/Documents/Coursera/03 - Getting and Cleaning Data/R-wd")

# load packages using sapply
# non-verbose (no package messages)
packages <- c("quantmod", "lubridate")
#loadp <- sapply(packages, library, character.only=TRUE, quietly=TRUE,
#        logical.return=TRUE)
loadp <- sapply(packages, require, character.only=TRUE, quietly=TRUE,
                warn.conflicts=FALSE)

if (!all(loadp)) {
        stop("unable to load required packages")
}

# get data on Amazon's stock prices
amzn <- getSymbols("AMZN", auto.assign=FALSE)
# get times when data was sampled
sampleTimes <- index(amzn)
# how many values from 2012
y2012 <- ifelse(format(sampleTimes, "%Y")=="2012", TRUE, FALSE)
# how many values from Monday in 2012
yd2012 <- ifelse(format(sampleTimes, "%Y")=="2012" & format(sampleTimes, "%a")=="Mon", TRUE, FALSE)
# create vector
tv <- c(length(which(y2012)), length(which(yd2012)))

#x <- which(agricultureLogical)
#v2012 <- length(format(sampleTimes, "%Y"))
# restore working directory
setwd(wd)