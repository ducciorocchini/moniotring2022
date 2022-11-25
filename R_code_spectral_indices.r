# Calculating vegetation indices from remote sensing

library(raster)
library(RStoolbox) # for classification
library(ggplot2) # for the final histogram plot
# install.packages("patchwork")
library(patchwork)
# install.packages("viridis")
library(viridis)

setwd("~/lab/") # Linux

l1992 <- brick("defor1.png")

# bands: 1 NIR, 2 red, 3 green

plotRGB(l1992, r=1, g=2, b=3, stretch="lin")

l2006 <- brick("defor2.png")
plotRGB(l2006, r=1, g=2, b=3, stretch="lin")

par(mfrow=c(2,1))
plotRGB(l1992, r=1, g=2, b=3, stretch="lin")
plotRGB(l2006, r=1, g=2, b=3, stretch="lin")

dvi1992 <- l1992[[1]] - l1992[[2]]

cl <- colorRampPalette(c('darkblue','yellow','red','black'))(100) # specifying a color scheme
plot(dvi1992, col=cl)

dvi2006 <- l2006[[1]] - l2006[[2]]

cl <- colorRampPalette(c('darkblue','yellow','red','black'))(100) # specifying a color scheme
plot(dvi2006, col=cl)

# threshold for trees

d1c <- unsuperClass(l1992, nClasses=2)
plot(d1c$map)

# 1992
# class 1: forest - 0.8976859
# class 2: human impact - 0.1023141

freq(d1c$map)
 value  count
[1,]     1 306373
[2,]     2  34919

#forest
f1992 <- 306373 / (306373+34919)
#human impact
h1992 <- 34919 / (306373+34919)

# classificaton of 2006
d2c <- unsuperClass(l2006, nClasses=2)
plot(d2c$map)

# 2006
# class 2: forest - 0.5199343
# class 1: human impact - 0.4800657

freq(d2c$map)
# value  count
# [1,]     1 164531
# [2,]     2 178195

# forest proprotion in 2006
f2006 <- 178195 / (164531+178195)
h2006 <- 164531 / (164531+178195)

# 1992 vs. 2006
# 1992
# forest: 0.8976859
# human impact: 0.1023141

# 2006
# forest: 0.5199343
# human impact: 0.4800657

landcover <- c("Forest", "Humans")
percent_1992 <- c(89.77, 10.23)
percent_2006 <- c(51.99, 48.01)

perc <- data.frame(landcover, percent_1992, percent_2006) +

# let's put it in a multiframe
# par(mfrow=c(2,1)) -> now you can destroy this in your  life!

p1 <- ggplot(perc, aes(x=landcover, y=percent_1992, color=landcover)) + 
geom_bar(stat="identity", fill="white")

p2 <- ggplot(perc, aes(x=landcover, y=percent_2006, color=landcover)) + 
geom_bar(stat="identity", fill="white")

p1 + p2

p1 / p2

## ggplot examples

#rgb # band 1 = NIR
plotRGB(l1992, r=1, g=2, b=3, stretch="lin")
ggRGB(l1992, 1, 2, 3)

dvi1992 <- l1992[[1]] - l1992[[2]]
plot(dvi1992)

ggplot() +
geom_raster(dvi1992, mapping=aes(x=x, y=y, fill=layer)) +
scale_fill_viridis(option="viridis")

ggplot() +
geom_raster(dvi1992, mapping=aes(x=x, y=y, fill=layer)) +
scale_fill_viridis(option="magma")

# Exercise: with the patchwork package
# put two graphs one beside the other
# with two different viridis color ramps





