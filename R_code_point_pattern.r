# Point pattern analysis for population ecology

# install.packages("spatstat")

library(spatstat)

# use of working directory
setwd("~/lab/")

covid <- read.table("covid_agg.csv", header=T)
head(covid)

attach(covid)
covid_planar <- ppp(x=lon, y=lat, c(-180,180), c(-90,90))

# WITHOUT ATTACHING:
covid_planar <- ppp(x=covid$lon, y=covid$lat, c(-180,180), c(-90,90))

density_map <- density(covid_planar)

plot(density_map)
points(covid_planar, pch=19)

# changing colours

cl <- colorRampPalette(c('yellow','orange','red'))(100) # 

cl <- colorRampPalette(c("cyan", "coral", "chartreuse"))(100)
plot(density_map, col=cl)
points(covid_planar, pch=17, col="blue")

# exercise
# change the colours
cln <- colorRampPalette(c("blue", "red", "yellow", "cyan", "coral", "chartreuse"))(100)
plot(density_map, col=cln)
points(covid_planar, pch=17, col="blue")
