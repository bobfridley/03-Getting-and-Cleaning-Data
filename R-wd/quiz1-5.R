wd <- getwd()
setwd("/Users/bobfridley/Documents/Coursera/03 - Getting and Cleaning Data/R-wd")

library(data.table)
library(microbenchmark)

# plot = TRUE or FALSE
timer <- function(plot=FALSE) {
        dataDirectory <- "./data"
        destFile <- "ss06pid.csv"
        destFilePath <- paste(dataDirectory, destFile, sep = "/")

        if (!file.exists(dataDirectory)) {
                dir.create(dataDirectory)
        }

        fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
        download.file(fileUrl, destfile=destFilePath, method="curl")

        DT <- fread(destFilePath, sep=",", header=TRUE)

        # run expressions
        a <- tapply(DT$pwgtp15, DT$SEX, mean)
        b <- {
                mean(DT[DT$SEX==1,]$pwgtp15);
                mean(DT[DT$SEX==2,]$pwgtp15)
        }
        c <- sapply(split(DT$pwgtp15, DT$SEX), mean)
        d <- mean(DT$pwgtp15, by=DT$SEX)
        e <- DT[,mean(pwgtp15), by=SEX]

        # expression results
        message("expression results")
        exp <- data.table(a=a, b=b, c=c, d=d, e=e)
        print(exp)

        # time expressions
        tm <- microbenchmark(
                a <- tapply(DT$pwgtp15, DT$SEX, mean),
                b <- {
                        mean(DT[DT$SEX==1,]$pwgtp15);
                        mean(DT[DT$SEX==2,]$pwgtp15)
                },
                c <- sapply(split(DT$pwgtp15, DT$SEX), mean),
                d <- mean(DT$pwgtp15, by=DT$SEX),
                e <- DT[,mean(pwgtp15), by=SEX],
                times = 100L
        )

        if (!plot) {
                message("microbenchmark results")
                print(tm)
        } else {
                library(ggplot2)
                autoplot(tm)
                
                # boxplot does not use ggplot2
                #boxplot(tm, unit="ms")
        }
}

setwd(wd)