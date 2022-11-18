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
plot(p224r63_2011[[1]], col=clb)

clg <- colorRampPalette(c('dark green','green','light green'))(100) # 
plot(p224r63_2011[[2]], col=clg)

clr <- colorRampPalette(c('brown3','red','brown1'))(100) # 
plot(p224r63_2011[[3]], col=clr)

cln <- colorRampPalette(c('coral2','chartreuse3','yellow'))(100) # 
plot(p224r63_2011[[4]], col=cln)

#-----

# multilayered colours

dev.off()
plotRGB(p224r63_2011, r=3, g=2, b=1, stretch="lin")
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="lin")
plotRGB(p224r63_2011, r=3, g=4, b=2, stretch="lin")
plotRGB(p224r63_2011, r=3, g=2, b=4, stretch="lin")

# plot the previous 4 manners in a single multiframe
par(mfrow=c(2,2))
plotRGB(p224r63_2011, r=3, g=2, b=1, stretch="lin")
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="lin")
plotRGB(p224r63_2011, r=3, g=4, b=2, stretch="lin")
plotRGB(p224r63_2011, r=3, g=2, b=4, stretch="lin")

# dev.off()
# histogram stretching
par(mfrow=c(2,1))
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="lin")
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="hist")

par(mfrow=c(2,1))
plotRGB(p224r63_2011, r=3, g=4, b=2, stretch="lin")
plotRGB(p224r63_2011, r=3, g=4, b=2, stretch="hist")

### Back in time

p224r63_1988 <- brick("p224r63_1988_masked.grd")
p224r63_2011 <- brick("p224r63_2011_masked.grd")

plotRGB(p224r63_1988, r=3, g=2, b=1, stretch="lin")
plotRGB(p224r63_1988, r=4, g=3, b=2, stretch="lin")
plotRGB(p224r63_1988, r=3, g=4, b=2, stretch="lin")

# Exercise: make a multiframe with 2 rows and 1 column
# plotting the 1988 and the 2011 images
# 5 minutes
par(mfrow=c(2,1))
plotRGB(p224r63_1988, r=3, g=2, b=4, stretch="lin")
plotRGB(p224r63_2011, r=3, g=2, b=4, stretch="lin")

# calculating the difference between images
# multitemporal analysis
difnir <- p224r63_1988[[4]] - p224r63_2011[[4]]

cl <- colorRampPalette(c('orange','yellow','black'))(100) # 
plot(difnir, col=cl)

####### Difference Vegetation Index

# Recent DVI (2011)

dvi2011 <- p224r63_2011[[4]] - p224r63_2011[[3]]
dvi1988 <- p224r63_1988[[4]] - p224r63_1988[[3]]

difdvi <- dvi1988 - dvi2011
cl <- colorRampPalette(c('blue','white','red'))(100) #
plot(difdvi, col=cl)













