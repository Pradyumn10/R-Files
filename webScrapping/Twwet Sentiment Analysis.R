library(twitteR)
library(RCurl)
library(dplyr)
library(tm)
library(SnowballC)
api_key <- "8v8pty79D8jZ1wybXXypNF5Oc"
api_secret <- "muK8wQ4OiJLUXyKj0BL5LzQj0go4MlVVjEEqc79eH316lh0z1s"
access_token <- "1540059098-4jeT2XoeJ0S4Z9MQEg0NtegsXMcp3ShId6hmViz"
access_token_secret <- "VezZuz5ufpDpTCtc9cTEzsO4omSQZa3AvnERsDM8QJruj"
setup_twitter_oauth(api_key,api_secret,access_token,access_token_secret)

tweets <- searchTwitter("Coronavirus", n=1000, lang = "en")

#convert the tweets into a df
tweets.df <-twListToDF(tweets)
dim(tweets.df)

write.csv(tweets.df, file = "tweets.csv", row.names = F)

#Read Tweets file.
tt <- read.csv(file.choose(), header = T)
tt <- read.csv("tweets.csv")
str(tt)

tt <- as.character(tt$text)
tt <- sample(tt, (length(tt)))

# Bulid Corpus

# corpus <- Corpus(VectorSource(corpus))
corpus <- Corpus(VectorSource(tt))
inspect(corpus[1:5])

# Clean Text
corpus = tm_map(corpus, tolower)
inspect(corpus[1:5])

corpus = tm_map(corpus, removePunctuation)
inspect(corpus[1:5])

corpus = tm_map(corpus, removeNumbers)
inspect(corpus[1:5])

cleanset = tm_map(corpus, removeWords, stopwords("english"))
inspect(cleanset[1:5])

require(stringr)
Textprocessing = function(x) {gsub("http[[:alnum:]]*",'', x)
  gsub('http\\S+\\s*', '', x) ## Remove URLs
  gsub("http.*","", x)
  gsub('\\b+rT', '', x) ## Remove RT
  gsub('#\\S+', '', x) ## Remove Hashtags
  gsub('@\\S+', '', x) ## Remove Mentions
  gsub('[[:cntrl:]]', '', x) ## Remove Controls and special characters
  gsub("\\d", '', x) ## Remove Controls and special characters
  gsub("</",'',x)
  gsub("\\u003c", '', x)
  gsub('[[:punct:]]', '', x) ## Remove Punctuations
  gsub("^[[:space:]]*","",x) ## Remove leading whitespaces
  gsub("[[:space:]]*$","",x) ## Remove trailing whitespaces
  gsub(' +',' ',x) ## Remove extra whitespaces
}

cleanset <- tm_map(cleanset,Textprocessing)

cleanset = tm_map(cleanset, content_transformer(Textprocessing))
inspect(cleanset[1:5])


cleanset = tm_map(corpus, removeWords,"rt")
cleanset = tm_map(cleanset, stripWhitespace)
inspect(cleanset[1:20])


# Term documents matrix
tdm = TermDocumentMatrix(cleanset)
tdm
tdm = as.matrix(tdm)
tdm[1:10, 1:20]

v1<- sort(rowSums(tdm), decreasing = T)
View(v1)
d1<- data.frame(word = names(v1), freq=v1)
View(d1)
library(wordcloud)
wordcloud(d1$word, d1$freq, min.freq = 5, random.order = F, max.words = 100, scale=c(5, 0.5), col = rainbow(21))
head(d1, 20)-> f
f
barplot(f$freq, las=2, names.arg = f$word, main = "Most frequent words", xlab = "", ylab = "word frequencies", col = rainbow(10))

library(syuzhet)
library(lubridate)
library(ggplot2)
library(scales)
library(reshape2)

tt2 <- read.csv(file.choose(), header = T)
tweets <- iconv(tt2$text)
s <- get_nrc_sentiment(tweets)
head(s)
tweets[1]
get_nrc_sentiment('pandemic')

#Bar Plot
barplot(colSums(s),
        las = 2,
        col =  rainbow(10),
        ylab = 'Count',
        main = 'Sentiment Scores for Corona Tweets')


cleanset2 <- as.character(cleanset)
word.df <- as.vector(cleanset2)
emotion.df <- get_nrc_sentiment(word.df)

emotion.df2 <- cbind(cleanset2, emotion.df) 

head(emotion.df2)


sent.value <- get_sentiment(word.df)

most.positive <- word.df[sent.value == max(sent.value)]
most.positive

most.negative <- word.df[sent.value <= min(sent.value)] 
most.negative 

sent.value

positive.tweets <- word.df[sent.value > 0]
head(positive.tweets)

negative.tweets <- word.df[sent.value < 0]
head(negative.tweets)

neutral.tweets <- word.df[sent.value == 0]
head(neutral.tweets)

# Alternate way to classify as Positive, Negative or Neutral tweets

category_senti <- ifelse(sent.value < 0, "Negative", ifelse(sent.value > 0, "Positive", "Neutral"))

head(category_senti)

category_senti2 <- cbind(tweets,category_senti,sent.value)
head(category_senti2)

table(category_senti)






