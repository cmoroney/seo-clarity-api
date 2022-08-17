rm(list=ls())
projectLocation <- '/Users/cmoroney/seoclarity/'
setwd(projectLocation)
source('functions.R') 

d <- Sys.Date()
# allKeyDf <- getAllKeywords() %>% mutate(lastUpdated = d)
keyList <- unique(allKeyDf$keywords)
# 
# sdate <- '20220301' 
# edate <-'20220302' 
# keyData <- getKeywordData(keyList, sdate, edate)
# keyData %>% write.csv()

# jan 2022
t1 <- Sys.time()
sdate <- '20220101'
edate <- '20220131'
keyDataJan22 <- getKeywordData(keyList, sdate, edate)
t2 <- Sys.time()
runTime <- t2-t1

keyDataJan22 %>% 
  mutate(date = lubridate::ymd(date),
          keyword__seo_clarity = name,
         ranking_url__seo_clarity = highestRankUrl,
         search_volume__seo_clarity = monthlySearchVolume,
         true_rank__seo_clarity = highestTrueRank, 
         url_type__seo_clarity = 'Web',
         web_rank__seo_clarity = highestWebRank
         ) %>%
  select(date, 
         keyword__seo_clarity, 
         ranking_url__seo_clarity,
         search_volume__seo_clarity,
         true_rank__seo_clarity,
         url_type__seo_clarity,
         web_rank__seo_clarity) %>%
  write.csv('/Users/cmoroney/seoclarity/backfill/jan2022.csv', row.names=FALSE)

# feb 2022
sdate <- '20220201'
edate <- '20220228'
keyDataFeb22 <- getKeywordData(keyList, sdate, edate)
keyDataFeb22 %>% 
  mutate(date = lubridate::ymd(date),
         keyword__seo_clarity = name,
         ranking_url__seo_clarity = highestRankUrl,
         search_volume__seo_clarity = monthlySearchVolume,
         true_rank__seo_clarity = highestTrueRank, 
         url_type__seo_clarity = 'Web',
         web_rank__seo_clarity = highestWebRank
  ) %>%
  select(date, 
         keyword__seo_clarity, 
         ranking_url__seo_clarity,
         search_volume__seo_clarity,
         true_rank__seo_clarity,
         url_type__seo_clarity,
         web_rank__seo_clarity) %>%
  write.csv('/Users/cmoroney/seoclarity/backfill/feb2022.csv', row.names=FALSE)

# March2022
sdate <- '20220301'
edate <- '20220315'
keyDataMar22 <- getKeywordData(keyList, sdate, edate)
keyDataMar22 %>% 
  mutate(date = lubridate::ymd(date),
         keyword__seo_clarity = name,
         ranking_url__seo_clarity = highestRankUrl,
         search_volume__seo_clarity = monthlySearchVolume,
         true_rank__seo_clarity = highestTrueRank, 
         url_type__seo_clarity = 'Web',
         web_rank__seo_clarity = highestWebRank
  ) %>%
  select(date, 
         keyword__seo_clarity, 
         ranking_url__seo_clarity,
         search_volume__seo_clarity,
         true_rank__seo_clarity,
         url_type__seo_clarity,
         web_rank__seo_clarity) %>%
  write.csv('/Users/cmoroney/seoclarity/backfill/march2022.csv', row.names=FALSE)


# Jan/Feb 2021
sdate <- '20210101'
edate <- '20210228'
keyDataJanFeb21 <- getKeywordData(keyList, sdate, edate)
keyDataJanFeb21 %>% 
  mutate(date = lubridate::ymd(date),
         keyword = name,
         ranking_url = highestRankUrl,
         search_volume = monthlySearchVolume,
         true_rank = highestTrueRank, 
         url_type = 'Web',
         web_rank = highestWebRank
  ) %>%
  select(date, 
         keyword, 
         ranking_url,
         search_volume,
         true_rank,
         url_type,
         web_rank) %>%
  write.csv('/Users/cmoroney/seoclarity/backfill/janfeb21', row.names=FALSE)



# march/april 2021
sdate <- '20210301'
edate <- '20210430'
keyDataMarApr21 <- getKeywordData(keyList, sdate, edate)
keyDataMarApr21 %>% 
  mutate(date = lubridate::ymd(date),
         keyword = name,
         ranking_url = highestRankUrl,
         search_volume = monthlySearchVolume,
         true_rank = highestTrueRank, 
         url_type = 'Web',
         web_rank = highestWebRank
  ) %>%
  select(date, 
         keyword, 
         ranking_url,
         search_volume,
         true_rank,
         url_type,
         web_rank) %>%
  write.csv('/Users/cmoroney/seoclarity/backfill/marapr21', row.names=FALSE)


# may/june 2021
sdate <- '20210501'
edate <- '20210630'
keyDataMayJune21 <- getKeywordData(keyList, sdate, edate)
keyDataMayJune21 %>% 
  mutate(date = lubridate::ymd(date),
         keyword = name,
         ranking_url = highestRankUrl,
         search_volume = monthlySearchVolume,
         true_rank = highestTrueRank, 
         url_type = 'Web',
         web_rank = highestWebRank
  ) %>%
  select(date, 
         keyword, 
         ranking_url,
         search_volume,
         true_rank,
         url_type,
         web_rank) %>%
  write.csv('/Users/cmoroney/seoclarity/backfill/mayjune21', row.names=FALSE)

# july/august 2021
sdate <- '20210701'
edate <- '20210831'
keyDataJulyAug21 <- getKeywordData(keyList, sdate, edate)
keyDataJulyAug21 %>% 
  mutate(date = lubridate::ymd(date),
         keyword = name,
         ranking_url = highestRankUrl,
         search_volume = monthlySearchVolume,
         true_rank = highestTrueRank, 
         url_type = 'Web',
         web_rank = highestWebRank
  ) %>%
  select(date, 
         keyword, 
         ranking_url,
         search_volume,
         true_rank,
         url_type,
         web_rank) %>%
  write.csv('/Users/cmoroney/seoclarity/backfill/julyaug21', row.names=FALSE)

# sep/oct 2021
sdate <- '20210901'
edate <- '20211031'
keyDataSepOct21 <- getKeywordData(keyList, sdate, edate)
keyDataSepOct21 %>% 
  mutate(date = lubridate::ymd(date),
         keyword = name,
         ranking_url = highestRankUrl,
         search_volume = monthlySearchVolume,
         true_rank = highestTrueRank, 
         url_type = 'Web',
         web_rank = highestWebRank
  ) %>%
  select(date, 
         keyword, 
         ranking_url,
         search_volume,
         true_rank,
         url_type,
         web_rank) %>%
  write.csv('/Users/cmoroney/seoclarity/backfill/sepoct21', row.names=FALSE)

# dec 2021
sdate <- '20211201'
edate <- '20211231'
keyDataNovDec21 <- getKeywordData(keyList, sdate, edate)
keyDataNovDec21 %>% 
  mutate(date = lubridate::ymd(date),
         keyword = name,
         ranking_url = highestRankUrl,
         search_volume = monthlySearchVolume,
         true_rank = highestTrueRank, 
         url_type = 'Web',
         web_rank = highestWebRank
  ) %>%
  select(date, 
         keyword, 
         ranking_url,
         search_volume,
         true_rank,
         url_type,
         web_rank) %>%
  write.csv('/Users/cmoroney/seoclarity/backfill/dec21', row.names=FALSE)





