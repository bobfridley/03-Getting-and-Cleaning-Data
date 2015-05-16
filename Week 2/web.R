con = url("http://scholar.google.com/citations?user=HI-I6C0AAAAJ&hl=en")

htmlCode = readLines(con, warn=FALSE, encoding="UTF-8")

# always close the connection
close(con)

htmlCode

