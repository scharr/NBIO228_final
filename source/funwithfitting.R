setwd("Z:/Alex/Analysis/MathToolsProject/data")

library(tiff)
# library(lhs)
library(lattice)
# library(GPfit)
library(mgcv)

epi <- readTIFF("SingleEpiCropped_AS.tif", all = TRUE)
m <- epi[[1]]
epi2 <- readTIFF("othercell.tif", all = TRUE)
m <- epi2[[51001]]
#51001-52000

# x is column
# y is row
# z is intensity value
df <- data.frame(x = rep(seq_len(ncol(m)), each = nrow(m)),
                 y = rep(seq_len(nrow(m)), times = ncol(m)),
                 z = c(m))
head(df)

mod <- gam(z ~ te(x,y), data = df)
mod1 <- loess(z ~ x*y, data = df, span = 0.025, degree = 2)
mod2 <- loess(z ~ x*y, data = df, span = 0.25, degree = 2)

for(i in 1:250){
  print(i)
  print(3034/i)
}
#146,94,73,47

cols <- max(df$x)*100
#m2 <- matrix(fitted(mod), ncol = 94)
m3 <- matrix(fitted(mod1), ncol = 74)
m4 <- matrix(fitted(mod2), ncol = 74)
m5 <- m3/m4
m6 <- m3-m4



#require("lattice")
wireframe(m)
wireframe(m2)
wireframe(m3)
wireframe(m4)
wireframe(m5)

# plot((1:length(M[,1])),M[,35])
# GPmodel = GP_fit((1:length(M[,1])),M[,35])
# plot.GP(GPmodel)

library(plot3D)
library(plot3Drgl)
persp3Drgl(z=m5, theta = 45, phi = 55, facets = FALSE)

persp3Drgl(z=diff(m6), theta = 45, phi = 55, facets = FALSE)
image3D(x=c(1:94), y=c(1:72), z = 0, add = TRUE, colkey = FALSE, facets = NA, plot = TRUE)
