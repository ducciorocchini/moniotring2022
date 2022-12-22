# R code for species distribution modelling related to the sadm package

library(sdm)
# install.packages("sdm")
library(rgdal)
# install.packages("rgdal")
library(raster)

file <- system.file("external/species.shp", package="sdm") 

species <- shapefile(file)
plot(species)

sat[[1]]

presences <- species[species$Occurrence == 1,]

# Exercise: select the absences
absences <- species[species$Occurrence == 0,]

plot(presences, col="blue", pch=19)
points(absences, col="red", pch=19)

# predictors
path <- system.file("external", package="sdm") 

lst <- list.files(path=path,pattern='asc$',full.names = T) #
lst

preds <- stack(lst)

# model
datasdm <- sdmData(train=species, predictors=preds)

m1 <- sdm(Occurrence ~ elevation + precipitation + temperature + vegetation, data=datasdm, methods="glm")

p1 <- predict(m1, newdata=preds) 

# final stack
s1 <- stack(preds, p1)



