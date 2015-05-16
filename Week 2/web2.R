# parsing with XML
library(XML)
url <- "http://scholar.google.com/citations?user=HI-I6C0AAAAJ&hl=en"
html <- htmlTreeParse(url, useInternalNodes=T)

x <- xpathSApply(html, "//title", xmlValue)

print(x)

y <- xpathSApply(html, "//td[@id='col-citedby']", xmlValue)

print(y)