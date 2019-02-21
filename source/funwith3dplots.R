  #fun with 3dplotting
setwd("Z:/Alex/Analysis/MathToolsProject/data")

# read episode into workspace as 1000 element (frame) list
library(tiff)
#epi <- readTIFF("testbandpasscrop.tif", all = TRUE)
epi <- readTIFF("SingleEpiCropped_AS.tif", all = TRUE)
#frame <- epi[[350]]
  
library(plot3D)
library(plot3Drgl)

# contour2D(frame, lwd = 2)
# persp3D(z=frame, facets=FALSE)
# plotrgl(smooth = TRUE, lighting = TRUE)


#for(i in c(1,seq(from=50, to=length(epi), by=25))){
for(i in 1:length(epi)){
  #persp3D(z=epi[[i]], theta = 45, phi = 55, facets = FALSE)
  
#   # creating a name for each plot file with leading zeros
#   if (i < 10) {name = paste('0000',i,'plot.png',sep='')}
#   if (i < 100 && i >= 10) {name = paste('000',i,'plot.png', sep='')}
#   if (i >= 100) {name = paste('00', i,'plot.png', sep='')}
#   if (i >= 1000) {name = paste('0', i,'plot.png', sep='')}
   
  #tiff(paste("Z:/Alex/Analysis/MathToolsProject/plots/",name))
  persp3Drgl(z=epi[[i]], theta = 45, phi = 55, facets = FALSE)
  #pp <- par3d(no.readonly=TRUE)
  par3d(pp)
  #rgl.snapshot(paste("Z:/Alex/Analysis/MathToolsProject/plots/",name))
  rgl.snapshot(paste0("Z:/Alex/Analysis/MathToolsProject/plots/raw1000/Frame",sprintf("%04d",i),".png"))
  #dev.off()
  rgl.close()
}

make.mov <- function(){
  unlink("plot.gif")
  system("convert *.png -delay 1 plot.gif")
}
