# GET from the httr package
url <- "http://scholar.google.com/citations?user=HI-I6C0AAAAJ&hl=en"

library(httr); html2=GET(url)
# one long string (similar to readlines())
content2 = content(html2, as="text")

# returns similar to xmlParse
# allows use of xpathSApply
parsedHtml = htmlParse(content2, asText=TRUE)
print(parsedHtml)

# returns all <title
x <- xpathSApply(parsedHtml, "//title", xmlValue)
print(x)