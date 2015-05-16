wd <- getwd()
setwd("/Users/bobfridley/Documents/Coursera/03 - Getting and Cleaning Data/R-wd")

dataFrame <- function() {
        library("data.table")
        
        # typical data frame
        DF = data.frame(x=rnorm(9), y=rep(c("a", "b", "c"), each=3), z=rnorm(9))
        head(DF, 3)

        # display row 2
        DF[2, ]
        # display row(s) where y = 'a'
        #DF[DF$y=="a", ]
        # display 2nd, 3rd rows
        DF[c(2, 3)]
}

dataTable <- function() {
        library("data.table")

        # using data table instead (same results)
        DT = data.table(x=rnorm(9), y=rep(c("a", "b", "c"), each=3), z=rnorm(9))
        head(DT, 3)

        tables()

        # display row 2
        DT[2, ]
        # display row(s) where y = 'a'
        DT[DT$y=="a", ]
        # display 2nd, 3rd rows
        DT[c(2, 3)]
}


setwd(wd)