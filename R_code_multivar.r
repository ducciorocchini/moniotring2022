# Community ecology example with R
# Multivariate analysis

# install.packages("vegan")

library(vegan)

setwd("~/lab/") 

# to upload an R project use the following function:
load("biomes_multivar.RData")

ls()

multivar <- decorana(biomes)

plot(multivar)

attach(biomes_types)

ordiellipse(multivar, type, c("black", "red", "green", "blue"), kind="ehull", lwd=3)

ordiellipse(multivar, type, col=c("black","red","green","blue"), kind = "ehull", lwd=3)
