wd <- getwd()
setwd("/Users/bobfridley/Documents/Coursera/03 - Getting and Cleaning Data/R-wd")

library(XML)

simplexml <- function() {
        fileUrl <- "http://www.w3schools.com/xml/simple.xml"
        doc <- xmlTreeParse(fileUrl, useInternal = TRUE)

        # get root node (entire document)
        rootNode <- xmlRoot(doc)

        # display xml names of all occurances of rootNode
        xmlName(rootNode)

        # display names of all occurances of rootNode
        names(rootNode)

        # display 1st element of root node
        rootNode[[1]]

        # display 1st sub-element of root node
        rootNode[[1]][[1]]

        # apply function (xmlValue) against all root nodes
        # xmlValue returns text value of node
        xmlSApply(rootNode, xmlValue)

        # get items on the menu name using XPath
        xpathSApply(rootNode, "//name", xmlValue)

        # get items on the prices using XPath
        xpathSApply(rootNode, "//price", xmlValue)
}

ravensdata <- function() {
        fileUrl <- "http://espn.go.com/nfl/team/_/name/bal/baltimore-ravens"
        # read url source
        doc <- htmlTreeParse(fileUrl, useInternal = TRUE)

        # get text values from <li class="score">value</li>
        scores <- xpathSApply(doc, "//li[@class='score']", xmlValue)
        teams <- xpathSApply(doc," //li[@class='team-name']", xmlValue)

        scores
        teams
}

setwd(wd)