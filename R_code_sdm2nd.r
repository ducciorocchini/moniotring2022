# SDM package at work!

# install.packages("rgdal")
# install.packages("sdm")

library(rgdal)
library(sdm)
library(raster)

file <- system.file("external/species.shp", package="sdm") 

species <- shapefile(file)

presences <- species[species$Occurrence == 1,]

# Exercise: select the absences
absences <- species[species$Occurrence == 0,]

plot(presences, col="blue", pch=19)
points(absences, col="red", pch=19)

# Predictors

path <- system.file("external", package="sdm")

lst <- list.files(path=path,pattern="asc$",full.names = T) #

preds <- stack(lst)



