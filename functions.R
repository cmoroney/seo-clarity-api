
library(httr)
library(XML)
library(jsonlite)  
library(tidyverse)

# Help files for API
# http://api.seoclarity.net/seoClarity/help 

token <- Sys.getenv('SEO_CLARITY_TOKEN') # Set token using Sys.setenv(SEO_CLARITY_TOKEN="")

################################
# Tag endpoint
# Type: 
#   0 = all
#   1 = URL tags
#   2 = Keyword tags

# tag <- paste("http://api.seoclarity.net/seoClarity/tag?access_token=", token, '&type=2&limit=100&offset=0', sep='')
# res <- GET(tag)
# df <- xmlToDataFrame(xmlParse(res))
################################


################################
# Keyword Endpoint
# sdate <- '&sdate=20220101'
# edate <- '&edate=20220201'
# kword <- '&kName=auto insurance'
# engine <- '&engine=google&market=en-us&limit=10'
  
# call <- paste('http://api.seoclarity.net/seoClarity/keyword?access_token=', token, sdate, edate, kword, engine, sep='')
# res <- GET(call)  

# xml <- xmlInternalTreeParse(content(res,type="text"))
# xmlParse(res)
# df <- xmlToDataFrame(xmlParse(res))
################################


################################
# Event endpoint - doesn't work
# event <- paste('http://api.seoclarity.net/seoClarity/event?access_token=', token, '&urlType=1&eventType=1&qDate=20220101&limit=100&offset=0', sep='')
# res <- GET(event)
# df <- xmlToDataFrame(xmlParse(res))
################################


################################
# Tagdetail endpoint
# tagid <- '7124958' # obtained from tag endpoint
# tagdetail <- paste('http://api.seoclarity.net/seoClarity/tagdetail?access_token=', token,'&tagid=', tagid, sep='')
# res <- GET(tagdetail)
# df <- xmlToDataFrame(xmlParse(res))
################################


############################################################################
# Functions for getting keyword data 
############################################################################

# Pull in all keywords of a given tag
getKeywords <- function(tagid){
  df <- data.frame(tagId = character(),
                   tagName = character(),
                   tagType = character())
  # for(i in seq(1:23)){
  
  i <- 0 
  iter <- TRUE
  
  while(iter){
    # tagid <- '7124958' # obtained from tag endpoint
    tagdetail <- paste('http://api.seoclarity.net/seoClarity/tagdetail?access_token=', token,
                       '&tagid=', tagid,
                       '&limit=100&offset=', 100*i, 
                       sep='')  
    res <- GET(tagdetail)
    if(length(res$conten) > 0){
      df_append <- xmlToDataFrame(xmlParse(res))
      df <- rbind(df, df_append)
      i <- i + 1 
    } else {
      iter <- FALSE
    }
  }
  return(df$elementName)
}

# Loop through keywords and pull data for the date range 
getKeywordData <- function(keywordlist, fromDate, toDate){
  # sdate <- '&sdate=20211201'
  sdate <- paste('&sdate=', fromDate, sep='')
  # edate <- '&edate=20220228'
  edate <- paste('&edate=', toDate, sep='')
  engine <- '&engine=google&market=en-us&limit=100'
  for(i in 1:length(keywordlist)){
    if(i %% 100 == 0){
      print(paste("Getting keyword ", i, " of ", length(keywordlist)))
    } 
    kword <- paste('&kName=', keywordlist[i], sep = '')
    call <- paste('http://api.seoclarity.net/seoClarity/keyword?access_token=', token, sdate, edate, kword, engine, sep='')
    res <- GET(call)
    if(i==1){
      df <- xmlToDataFrame(xmlParse(res))
    } else {
      df_append <- xmlToDataFrame(xmlParse(res))
      df <- rbind(df, df_append)
    }
  }
  return(df)
}

# Looping through ALL tags to retrieve keywords, then combine with tag details 
getAllKeywords <- function(){
  url <- paste("http://api.seoclarity.net/seoClarity/tag?access_token=", token, '&type=2&limit=100&offset=0', sep='')
  res <- GET(url)
  allTags<- xmlToDataFrame(xmlParse(res))
  allKeywords <- data.frame(tagId=character(), keyword=character())
  
  for(tag in allTags$tagId){
    print(paste(Sys.time(), 'Retrieving keywords for tagID', tag))
    keywords <- getKeywords(tag)
    if(!is.null(keywords)){
      keywordAppend <- data.frame(tagId = tag,
                                  keywords = keywords)
      allKeywords <- rbind(allKeywords, keywordAppend)  
    }
  }
  allKeywords <- allKeywords %>% 
    left_join(allTags, by='tagId')
  
  return(allKeywords)
}

# Get API Usage details 
getApiUsage <- function(){
  apiStatus <- GET(paste('http://api.seoclarity.net/seoClarity/usage?access_token=', token, '&sdate=20220101&edate=20220311&group=day', sep=''))
  statusDf <- xmlToDataFrame(xmlParse(apiStatus))
  return(statusDf)
}
