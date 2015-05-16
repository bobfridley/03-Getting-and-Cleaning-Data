wd <- getwd()
setwd("/Users/bobfridley/Documents/Coursera/03 - Getting and Cleaning Data/R-wd")

library(XML)

pubmed <- function() {
        dataDirectory <- "./data"
        destFile <- "pubmed.xml"
        destFilePath <- paste(dataDirectory, destFile, sep = "/")
        
        if (!file.exists(dataDirectory)) {
                dir.create(dataDirectory)
        }
        
        #fileUrl <- "http://www.ncbi.nlm.nih.gov/books/NBK3828/#publisherhelp.Example_of_a_Standar"
        #download.file(fileUrl, destfile = destFilePath, method = "auto")

        doc = xmlTreeParse(destFilePath, useInternal = TRUE)

        top = xmlRoot(doc)

        xmlName(top)

        # child nodes of this root
        message("names top")
        print(names(top))

        # Let's fetch the author list for each article.
        # Do it first for just one and then use "apply" to iterate
        print(names( top[[ 1 ]] ))
        
        # what we want
        art = top[[ 1 ]] [[ "AuthorList" ]]
        names(art)
        names(art[[1]])

        # So how do we get these values, e.g. to put in a data frame.
        # Each element is a node with text content.
        # So loop over the nodes and get the content as a string
        xmlSApply(art[[1]], xmlValue)

        # To do this for all authors of the article
        xmlSApply(art, function(x) xmlSApply(x, xmlValue))

        # How do we deal with the different types of fields in the names?
        # e.g. First, Middle, Last, Affiliation
        # CollectiveName
        # data representation/analysis question from here.

        # Let's find the date when the articles were received
        nodes = getNodeSet(top, "//History/PubDate[@PubStatus='received']")
        print(nodes)
        
        # 2 nodes - 1 per article
        # Extract year, month, day
        lapply(nodes, function(x) xmlSApply(x, xmlValue))
        
        # Easy to get date "accepted" and "aheadofprint"
        # Content of abstract as words
        abstracts = xpathApply(top, "//Abstract", xmlValue)
        print(abstracts)
                
        # Now, break up into words, stem the words, remove the stop-words,
        abstractWords = lapply(abstracts, strsplit, "[[:space:]]")
        print(abstractWords)
}