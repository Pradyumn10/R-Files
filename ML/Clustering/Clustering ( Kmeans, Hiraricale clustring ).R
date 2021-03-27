#kmeans 
data = iris
data$Species = NULL
head(data)
k = kmeans(data, 4)
plot(data[c("Sepal.Length", "Sepal.Width")], col = k$cluster)
k


# hirarchical clustring
data("mtcars")
head(mtcars)
distance = dist(as.matrix(mtcars))
h.clustring = hclust(distance)
plot(h.clustring)

