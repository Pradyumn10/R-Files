# Libraries
library(dplyr)
library(ggplot2)
library(babynames)
library(ggrepel)
library(tidyr)
library(hrbrthemes)

data("mpg")
View(mpg)

mpg$year = as.Date.numeric(mpg$year)

ipl = read_csv(file.choose())
View(ipl)


ipl = as.data.frame(ipl)
class(ipl)

str(ipl)

date = ipl$date
total = ipl$total

total = as.numeric(total)

View(total)
str(total)

pi = data.frame(date,total)
View(pi)

#connected scatter plot
ggplot(pi, aes(date,total))+geom_line()+geom_point(size=6)
#pipeline
pi%>%tail(2000)%>%ggplot(aes(date,total))+geom_line(col='red')+geom_point(shape=21, col="yellow", fill="#2B2B68", size=6)

#direction chart

# data
data <- babynames %>% 
  filter(name %in% c("Ashley", "Amanda")) %>%
  filter(sex=="F") %>%
  filter(year>1970) %>%
  select(year, name, n) %>%
  spread(key = name, value=n, -1)

View(babynames)

# plot
data %>% 
  ggplot(aes(x=Amanda, y=Ashley, label=year)) +
  geom_point() +
  geom_segment(aes(
    xend=c(tail(Amanda, n=-1), NA), 
    yend=c(tail(Ashley, n=-1), NA)
  )
  )

# data
data <- babynames %>% 
  filter(name %in% c("Ashley", "Amanda")) %>%
  filter(sex=="F") %>%
  filter(year>1970) %>%
  select(year, name, n) %>%
  spread(key = name, value=n, -1)

# Select a few date to label the chart
tmp_date <- data %>% sample_frac(0.3)

#direction chart
# plot 
data %>% 
  ggplot(aes(x=Amanda, y=Ashley, label=year)) +
  geom_point(color="#69b3a2") +
  geom_text_repel(data=tmp_date) +
  geom_segment(color="#69b3a2", 
               aes(
                 xend=c(tail(Amanda, n=-1), NA), 
                 yend=c(tail(Ashley, n=-1), NA)
               ),
               arrow=arrow(length=unit(0.3,"cm"))
  ) +
  theme_ipsum()

#group bar
# create a dataset
specie <- c(rep("sorgho" , 3) , rep("poacee" , 3) , rep("banana" , 3) , rep("triticum" , 3) )
condition <- rep(c("normal" , "stress" , "Nitrogen") , 4)
value <- abs(rnorm(12 , 0 , 15))
data <- data.frame(specie,condition,value)

View(data)

# Grouped
ggplot(data, aes(fill=condition, y=value, x=specie)) + 
  geom_bar(position="dodge", stat="identity")



#circle bar chart
#neew file

#pie chart
# Create Data
data <- data.frame(
  group=LETTERS[1:5],
  value=c(13,7,9,21,2)
)

# Basic piechart
ggplot(data, aes(x="", y=value, fill=group)) +
  geom_bar(stat="identity", width=1) +
  coord_polar("y", start=0)

View(data)

percent = (data$value/sum(data$value))*100
data=cbind(data, round(percent))

# Basic piechart
ggplot(data, aes(x="", y=value, fill=group)) +
  geom_bar(stat="identity", width=1, color="white") +
  coord_polar("y", start=0) + 
  
  theme_void() # remove background, grid, numeric labels
  
#--------

# Compute the position of labels
data1 <- data %>% 
  arrange(desc(group)) %>%
  mutate(prop = value / sum(data$value) *100) %>%
  mutate(ypos = cumsum(prop)- 0.5*prop )

View(data1)
# Basic piechart
ggplot(data1, aes(x="", y=prop, fill=group)) +
  geom_bar(stat="identity", width=1, color="white") +
  coord_polar("y", start=0) +
  theme_void() + 
  theme() +
  
  geom_text(aes(y = ypos, label = c(prop,group) ), color = "white", size=6) +
  scale_fill_brewer(palette="Set1")

str(data1)

# Dummy data
x <- LETTERS[1:20]
y <- paste0("var", seq(1,20))
data <- expand.grid(X=x, Y=y)
data$Z <- runif(400, 0, 5)

# Heatmap 
ggplot(data, aes(X, Y, fill= Z)) + 
  geom_tile()

library(hrbrthemes)

# Dummy data
x <- LETTERS[1:20]
y <- paste0("var", seq(1,20))
data <- expand.grid(X=x, Y=y)
data$Z <- runif(400, 0, 5)

# Give extreme colors:
ggplot(data, aes(X, Y, fill= Z)) + 
  geom_tile() +
  scale_fill_gradient(low="white", high="blue") +
  theme_ipsum()

# Color Brewer palette
ggplot(data, aes(X, Y, fill= Z)) + 
  geom_tile() +
  scale_fill_distiller(palette = "RdPu") +
  theme_ipsum()

# Color Brewer palette
library(viridis)
ggplot(data, aes(X, Y, fill= Z)) + 
  geom_tile() +
  scale_fill_viridis(discrete=FALSE) +
  theme_ipsum()

library(tibble)

# Volcano dataset
#volcano

# Heatmap 
View(volcano)
volcano %>%
  
  # Data wrangling
  as_tibble() %>%
  rowid_to_column(var="X") %>%
  gather(key="Y", value="Z", -1) %>%
  
  # Change Y to numeric
  mutate(Y=as.numeric(gsub("V","",Y))) %>%
  
  # Viz
  ggplot(aes(X, Y, fill= Z)) + 
  geom_tile() +
  theme_ipsum() +
  theme(legend.position="none")

#####
#donut plot
data <- data.frame(
  category=c("A", "B", "C"),
  count=c(10, 60, 30)
)

# Compute percentages
data$fraction = data$count / sum(data$count)

# Compute the cumulative percentages (top of each rectangle)
data$ymax = cumsum(data$fraction)

# Compute the bottom of each rectangle
data$ymin = c(0, head(data$ymax, n=-1))

# Make the plot
ggplot(data, aes(ymax=ymax, ymin=ymin, xmax=4, xmin=3, fill=category)) +
  geom_rect() +
  coord_polar(theta="y") + # Try to remove that to understand how the chart is built initially
  xlim(c(2, 4)) # Try to remove that to see how to make a pie chart

#####

# Create test data.
data <- data.frame(
  category=c("A", "B", "C"),
  count=c(10, 60, 30)
)

# Compute percentages
data$fraction <- data$count / sum(data$count)

# Compute the cumulative percentages (top of each rectangle)
data$ymax <- cumsum(data$fraction)

# Compute the bottom of each rectangle
data$ymin <- c(0, head(data$ymax, n=-1))

# Compute label position
data$labelPosition <- (data$ymax + data$ymin) / 2

# Compute a good label
data$label <- paste0(data$category, "\n value: ", data$count)

# Make the plot
ggplot(data, aes(ymax=ymax, ymin=ymin, xmax=4, xmin=3, fill=category)) +
  geom_rect() +
  geom_text( x=2, aes(y=labelPosition, label=label, color=category), size=6) + # x here controls label position (inner / outer)
  scale_fill_brewer(palette=3) +
  scale_color_brewer(palette=3) +
  coord_polar(theta="y") +
  xlim(c(-1, 4)) +
  theme_void() +
  theme(legend.position = "none")
