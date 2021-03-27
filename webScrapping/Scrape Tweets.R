library(twitteR)
library(RCurl)
library(dplyr)
library(tm)
api_key <- "8v8pty79D8jZ1wybXXypNF5Oc"
api_secret <- "muK8wQ4OiJLUXyKj0BL5LzQj0go4MlVVjEEqc79eH316lh0z1s"
access_token <- "1540059098-4jeT2XoeJ0S4Z9MQEg0NtegsXMcp3ShId6hmViz"
access_token_secret <- "VezZuz5ufpDpTCtc9cTEzsO4omSQZa3AvnERsDM8QJruj"

setup_twitter_oauth(api_key,api_secret,access_token,access_token_secret)

tweets <- searchTwitter("#Coronavirus", n=2500, lang = "en")

#convert the tweets into a df
tweets.df <-twListToDF(tweets)
dim(tweets.df)

write.csv(tweets.df, file = "tweets.csv", row.names = F)


# Trends
trend <- availableTrendLocations()
head(trend)
trend
world <- getTrends(1)
head(world)

delhi <- getTrends(20070458)
head(delhi)

India <- getTrends(23424848)
head(India)

t = getUser('GuptaPuneet43')
t
s= userTimeline(t, n=3)
s

# Read Tweets file.
tt <- read.csv(file.choose(), header = T)
tt <-read.csv("tweets.csv")
str(tt)
