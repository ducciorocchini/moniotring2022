# I hate Duccio Rocchini
# Me too!

install.packages("raster")

library(raster)

setwd("~/lab")

p224r63_2011 <- brick("p224r63_2011_masked.grd")

plot(p224r63_2011)
# dev.off()


cl <- colorRampPalette(c('black','grey','light grey'))(100) # 
