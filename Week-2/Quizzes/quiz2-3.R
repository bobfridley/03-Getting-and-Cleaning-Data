wd <- getwd()
setwd("/Users/bobfridley/Documents/Coursera/03 - Getting and Cleaning Data/R-wd")

con <- url("http://biostat.jhsph.edu/~jleek/contact.html")
htmlCode <- readLines(con)
close(con)
print(htmlCode)
print(nchar(htmlCode[[10]]))
print(nchar(htmlCode[[20]]))
print(nchar(htmlCode[[30]]))
print(nchar(htmlCode[[100]]))
print(nchar(htmlCode[[171]]))
# restore working directory
setwd(wd)