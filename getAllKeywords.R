library(tidyverse)
library(httr)
library(XML)
library(jsonlite) 

rm(list=ls())

source('functions.R') 

d <- Sys.Date()
allKeyDf <- getAllKeywords() %>% mutate(lastUpdated = d)
exportFilename <- paste(getwd(), '/Exports/keyword_tag_mapping', d, '.csv', sep = '')

write.csv(allKeyDf, exportFilename, row.names=FALSE)
