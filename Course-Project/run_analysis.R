# set path for working directory
wd <- getwd()
setwd("/Users/bobfridley/Documents/git/Getting-and-Cleaning-Data/Course-Project")

# load packages using sapply
# non-verbose (no package messages)
packages <- c("knitr", "markdown")
loadp <- sapply(packages, library, character.only=TRUE, quietly=TRUE,
                warn.conflicts=FALSE, logical.return=TRUE, verbose=FALSE)

## stop script if any packages are not loaded

if (!any(loadp)) {
        stop("unable to load required packages")
}

knit("run_analysis.Rmd", encoding="UTF-8")

markdownToHTML("run_analysis.md", "run_analysis.html")

# restore working directory
setwd(wd)