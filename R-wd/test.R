
wd <- getwd()
setwd("/Users/bobfridley/Documents/Coursera/03 - Getting and Cleaning Data/R-wd")

library(httr)
library(httpuv)
library(RJSONIO)
library(jsonlite)

Sys.setenv(GITHUBQUIZ2_CONSUMER_KEY="b7e91ac85fd6e5b34588", GITHUBQUIZ2_CONSUMER_SECRET="5431aaf5a627e865530f88a36e0de212711d992e")
cliendId <- Sys.getenv("GITHUBQUIZ2_CONSUMER_KEY")
myapp <- oauth_app("githubquiz2", cliendId)
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)

# 4. Use API
gtoken <- config(token = github_token)
gtoken

req <- GET("https://api.github.com/users/jtleek/repos", gtoken)
req
stop_for_status(req)
content(req)
