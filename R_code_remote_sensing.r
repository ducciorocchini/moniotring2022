# I hate Duccio Rocchini
# Me too!

# install.packages("raster")

library(raster)

setwd("~/lab")

p224r63_2011 <- brick("p224r63_2011_masked.grd")

plot(p224r63_2011)
# dev.off()


cl <- colorRampPalette(c('black','grey','light grey'))(100) # 
plot(p224r63_2011, col=cl)

# Plotting one band
# solution 1
plot(p224r63_2011$B1_sre, col=cl)

plot(p224r63_2011[[1]], col=cl)

# Exercise: change the colour ramp palette with colours from dark to light blue
clb <- colorRampPalette(c('dark blue','blue','light blue'))(100) # 
plot(p224r63_2011[[1]], col=clb)

par(mfrow=c(1,2))
plot(p224r63_2011[[1]], col=cl)
plot(p224r63_2011[[2]], col=cl)

#plot(p224r63_2011$B1_sre[[1]], col=cl)
#error
plot(p224r63_2011$B1_sre, col=cl)
plot(p224r63_2011[[1]], col=cl)

# multiframe with 4 images (2x2)
par(mfrow=c(2,2))
plot(p224r63_2011[[1]], col=cl)
plot(p224r63_2011[[2]], col=cl)
plot(p224r63_2011[[3]], col=cl)
plot(p224r63_2011[[4]], col=cl)

#Exercise: plot the four bands with different legends (colour ramps)
par(mfrow=c(2,2))
clb <- colorRampPalette(c('dark blue','blue','light blue'))(100) # 



colorRampPalette(c('dark blue','blue','light blue'))(100) # 




