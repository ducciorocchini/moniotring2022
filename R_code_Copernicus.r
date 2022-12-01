# how to download and analyse Copernicus data

library(ncdf4) # reading .nc files
library(raster) # usual package
library(ggplot2) # beautiful plots
library(RStoolbox) # RS functions
library(viridis) # legends - colour gamut
library(patchwork) # multiframe for ggplot

setwd("~/lab/")

snow <- raster("c_gls_SCE_202012210000_NHEMI_VIIRS_V1.0.1.nc")

snow

# Exercise: bnase don your previous code, plot the snow cover 
# with ggplot and viridis


ggplot() +
geom_raster(snow, mapping=aes(x=x, y=y, fill=Snow.Cover.Extent)) +
scale_fill_viridis

ggplot() +
geom_raster(snow, mapping = aes(x=x, y=y, fill=Snow.Cover.Extent)) +
scale_fill_viridis(option="inferno")

ext <- c(-20, 70, 20, 75)
snow.europe <- crop(snow, ext)

ggplot() +
geom_raster(snow.europe, mapping = aes(x=x, y=y, fill=Snow.Cover.Extent)) +
scale_fill_viridis(option="inferno")

# plot the two sets with the patchwork package
p1 <- ggplot() +
geom_raster(snow, mapping = aes(x=x, y=y, fill=Snow.Cover.Extent)) +
scale_fill_viridis(option="inferno")

p2 <- ggplot() +
geom_raster(snow.europe, mapping = aes(x=x, y=y, fill=Snow.Cover.Extent)) +
scale_fill_viridis(option="inferno")

p1 + p2 


