wd <- getwd()
setwd("/Users/bobfridley/Documents/Coursera/03 - Getting and Cleaning Data/R-wd")

# Allows R code to listen for and interact with HTTP and WebSocket clients,
# so you can serve web traffic directly out of your R proces
library(httr)
library(httpuv)
library(RJSONIO)
library(jsonlite)

# 1. Find OAuth settings for github:
#    http://developer.github.com/v3/oauth/
oauth_endpoints("github")

# 2. Register an application at https://github.com/settings/applications;
#    Use any URL you would like for the homepage URL (http://github.com is fine)
#    and http://localhost:1410 as the callback url
#
#    Add GITHUB_CONSUMER_KEY and GITHUB_CONSUMER_SECRET
#    to system environmental variables
#    Sys.setenv(GITHUB_CONSUMER_KEY="b7e91ac85fd6e5b34588",
#        GITHUB_CONSUMER_SECRET="5431aaf5a627e865530f88a36e0de212711d992e")
#
#    Insert your client ID and secret below
#    a. if secret is omitted, it will
#       look it up in the GITHUB_CONSUMER_SECRET environmental variable.
#    b. if client ID is omitted, it will
#       look it up in the GITHUB_CONSUMER_KEY environmental variable.

myapp <- oauth_app("github", "b7e91ac85fd6e5b34588")

# 3. Get OAuth dcredentials
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)

# 4. Use API
gtoken <- config(token=github_token)
req <- GET("https://api.github.com/users/jtleek/repos", gtoken)
# response: http://localhost:1410/?code=8e07d309c126272c3364&state=lXmqFzkF4I

# check status of req
# TRUE = completed
status <- stop_for_status(req)
print(status)
# extract JSON
json1 <- content(req)

# reformat JSON for easier reading
# creates data.frame from json1
json2 <- jsonlite::fromJSON(toJSON(json1))

# subset json2 returning name=datasharing and created_at
ds <- subset(json2, json2$name == "datasharing",
                select = c("name", "created_at")
)

# OR:
req <- with_config(gtoken, GET("https://api.github.com/users/jtleek/repos"))

# check status of req
# TRUE = completed
status <- stop_for_status(req)
print(status)
# extract JSON
json1 <- content(req)

# reformat JSON for easier reading
# creates data.frame from json1
json2 <- jsonlite::fromJSON(toJSON(json1))

# subset json2 returning name=datasharing and created_at
ds <- subset(json2, json2$name == "datasharing",
             select = c("name", "created_at")
)

setwd(wd)