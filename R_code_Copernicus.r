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




