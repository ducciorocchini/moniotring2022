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

ordiellipse(multivar, type, col=c("black","red","green","blue"), kind = "ehull", lwd=3)
ordispider(multivar, type, col=c("black","red","green","blue"), label = T)

# let's save the graph out of R
pdf("myfirstoutput.pdf")
plot(multivar)
ordiellipse(multivar, type, col=c("black","red","green","blue"), kind = "ehull", lwd=3)
ordispider(multivar, type, col=c("black","red","green","blue"), label = T)
dev.off()

# Exercise: export a pdf
# with only the multivar plot
# 5 minutes
pdf("multivarperse.pdf")
plot(multivar)
dev.off()



