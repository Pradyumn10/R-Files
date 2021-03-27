install.packages("selectr")
install.packages("xml2")
install.packages("rvest")
install.packages("jsonlite")
install.packages("stringr")
install.packages("data.table")

installed.packages("data.table")

library(rvest)
library(selectr)
library(xml2)
library(data.table)
library(stringr)
library(jsonlite)
library(dplyr)
library(tidyr)

#Specifying the url for desired website to be scrapped
url <- 'https://www.amazon.in/OnePlus-Mirror-Black-64GB-Storage/dp/B0756Z43QS'

#Reading the html content from Amazon
webpage <- read_html(url)

#Scrape product details from Amazon
#Title: The title of the product.
#Price: The price of the product.
#Description: The description of the product.
#Rating: The user rating of the product.
#Size: The size of the product.
#Color: The color of the product.

# => go to chrome browser => go to this URL => right click => inspect element

#scrape title of the product
title_html <- html_nodes(webpage,"h1#title")
title <- html_text(title_html)
head(title)

# remove all space and new lines
str_replace_all(title, "[\r\n]", "")
title <- str_replace_all(title, "[\r\n]", "")
title
#Price of the product:
# scrape the price of the product
price_html <- html_nodes(webpage, "span#priceblock_ourprice")
#price_html = html_nodes(webpage,"span#a_size_medium_a_color_price")
price <- html_text(price_html)
# remove spaces and new line
price = str_replace_all(price, '[\r\n]',"")
# print price value
head(price)
price = price

# scrape product description
desc_html <- html_nodes(webpage, "div#productDescription")
# desc_html = html_nodes(webpage, "div#feature-bullets")
desc <- html_text(desc_html)
# replace new lines and spaces
desc <- str_replace_all(desc, "[\r\n\t]" , "")
desc <- str_trim(desc)
head(desc)
desc = desc
####Rating of the product####
# scrape product rating
rate_html <- html_nodes(webpage, "span#acrPopover")
rate <- html_text(rate_html)
# remove spaces and newlines and tabs 
rate <- str_replace_all(rate, "[\r\n\t]" , "")
rate <- str_trim(rate)
# print rating of the product
head(rate)
rate = rate

# Scrape size of the product
size_html <- html_nodes(webpage, "#variation_size_name .selection")
#size_html <- html_nodes(size_html, "span.selection")
size <- html_text(size_html)
# remove tab from text
size <- str_trim(size)
# Print product size
head(size)
size = size

# Scrape product color
color_html <- html_nodes(webpage, "div#variation_color_name .selection")
#color_html <- html_nodes(color_html, "span.selection")
color <- html_text(color_html)
# remove tabs from text
color <- str_trim(color)
color = color
# print product color
head(color)

#Combining all the lists to form a data frame
#product_data <- data.frame(Title = title, Price = price, Description = desc, Rating = rate, Size = size, Color = color)
product_data <- data.frame(Title = title, Description = desc, Rating = rate, Size = size, Color = color)
#Str(ucture of the data frame)
str(product_data)
View(product_data)
