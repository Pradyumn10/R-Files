library(selectr)
library(xml2)
library(rvest)
library(stringr)
library(dplyr)


url <- 'http://ipaidabribe.com/reports/paid'
bribes <- read_html(url) # reading the HTML code
amounts <- html_nodes(bribes, ".paid-amount span") # identify the CSS selector
amounts # content of CSS selector
html_text(amounts)

#We still need to do some cleaning before the data is usable:
amounts <- html_text(amounts)
amounts <- gsub("Paid INR | |\r|\n|,", "", amounts) # remove text, white space, and commas
amounts <- as.numeric(amounts) # convert to numeric
View(amounts)

#Let's do another one: transactions during which the bribe ocurred
transaction <- html_nodes(bribes, ".transaction a")
transaction <- html_text(transaction)
View(transaction)

#And one more: the department that is responsible for these transactions
# and one more
dept <- html_nodes(bribes, ".name a")
(dept <- html_text(dept))

#This was just for one page, but note that there are many pages. How do we scrape the rest? First, following the best practices on coding, we will write a function that takes the URL of each page, scrapes it, and returns the information we want.


scrape_bribe <- function(url){
  bribes <- read_html(url)
  # variables that we're interested in
  amounts <- html_text(html_nodes(bribes, ".paid-amount span"))
  amounts <- as.numeric(gsub("Paid INR | |\r|\n|,", "", amounts))
  transaction <- html_text(html_nodes(bribes, ".transaction a"))
  dept <- html_text(html_nodes(bribes, ".name a"))
  # putting together into a data frame
  df <- data.frame(
    amounts = amounts,
    transaction = transaction,
    dept = dept,
    stringsAsFactors=F)
  return(df)
}


#And we will start a list of data frames, and put the data frame for the initial page in the first position of that list.

bribes <- list()
bribes[[1]] <- scrape_bribe(url)
str(bribes)

#How should we go about the following pages? Note that the following urls had page=XX, where XX is 10, 20, 30. So we will create a base url and then add these additional numbers. # (Note that for this exercise we will only scrape the first 5 pages.)

base_url <- "http://ipaidabribe.com/reports/paid?page="
pages <- seq(0, 40, by=10)
#pages <- seq(0, 40) #for 40 pages 


#And now we just need to loop over pages, and use the function we created earlier to scrape the information, and add it to the list. Note that we're adding a couple of seconds between HTTP requests to avoid overloading the page, as well as a message that will informs us of the progress of the loop.


for (i in 2:length(pages)){
  # informative message about progress of loop
  message(i, '/', length(pages))
  # prepare URL
  url <- paste(base_url, pages[i], sep="")
  # scrape website
  bribes[[i]] <- scrape_bribe(url)
  # wait a couple of seconds between URL calls
  Sys.sleep(1)
}


#The final step is to convert the list of data frames into a single data frame that we can work with, using the function do.call(rbind, LIST) (where  LIST is a list of data frames).

bribes <- do.call(rbind, bribes)
head(bribes)
str(bribes)

#Let's get some quick descriptive statistics to check everything worked. First, what is the most common transaction during which a bribe was paid?

tab <- table(bribes$transaction) # frequency table
tab <- sort(tab, decreasing=TRUE)   # sorting the table from most to least common
head(tab)

#What was the average bribe payment?
summary(bribes$amount)
#And what was the average payment for each department?
agg <- aggregate(bribes$amount, by=list(dept=bribes$dept), FUN=mean)
a = agg[order(agg$x, decreasing = TRUE),] # ordering from highest to lowest



