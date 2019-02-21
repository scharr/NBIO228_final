setwd("/Users/alex/Desktop/Analysis/MathToolsProject/data")

# read episode into workspace as 1000 element (frame) list
library(tiff)
epi <- readTIFF("SingleEpiCropped_AS.tif", all = TRUE)
#epi <- readTIFF("test.tif", all = TRUE)

library(polynom)
# create empty list to hold xy coordinates of bundles in each frame
framedata <- vector("list", length(epi))
# go through each frame
for(i in 1:length(epi)){
  # go through each column in each frame
  for(k in 1:length(epi[[i]][1,])){
    # fit polynomials of order 5 through 35 and plot
    #for (l in 5:35){
      #print(l)
      y <- epi[[i]][,k]
      x <- c(1:length(y))
      order <- 35
      plot(y)
      #fit a polynomial
      fit <- lm(y~poly(x,order,raw=TRUE))
      summary(fit)
      xx <- seq(0,730, length=730)
      lines(xx, predict(fit, data.frame(x=xx)), col="red")
      p0 <- polynomial(coef(fit)) 
      # first and second derivatives
      p1 <- deriv(p0)
      p2 <- deriv(p1) 
    #}
  }
}

#fit a fourier series
#       p <- 2*pi/73
#       fit <- lm(y ~ sin(p*x)+cos(p*x)
#                 +sin(2*p*x)+cos(2*pi*x)
#                 +sin(3*p*x)+cos(3*pi*x)
#                 +sin(4*p*x)+cos(4*pi*x)
#                 +sin(5*p*x)+cos(5*pi*x))

# find outliers and replace with median value
#     col <- epi[[i]][,k]
#     cmedian <- median(col)
#     cmean <- mean(col)
#     csd <- sd(col)
#     col <- replace(col, col>cmean+2*csd|col<cmean-2*csd, cmedian)

##polynomial fitting tests
y <- epi[[750]][,39]
x <- c(1:length(y))
plot(y)

#fit first degree polynomial equation:
fit  <- lm(y~x)
#second degree
fit2 <- lm(y~poly(x,2,raw=TRUE))
#third degree
fit3 <- lm(y~poly(x,3,raw=TRUE))
#fourth degree
fit4 <- lm(y~poly(x,4,raw=TRUE))
#fifth degree
fit5 <- lm(y~poly(x,5,raw=TRUE))
fit6 <- lm(y~poly(x,6,raw=TRUE))
fit7 <- lm(y~poly(x,7,raw=TRUE))
fit8 <- lm(y~poly(x,8,raw=TRUE))
fit9 <- lm(y~poly(x,9,raw=TRUE))
#10th degree
fit10 <- lm(y~poly(x,10,raw=TRUE))
#50th degree
fit35 <- lm(y~poly(x,35,raw=TRUE))
#generate range of 100 numbers starting from 0 and ending at 1
xx <- seq(0,73, length=73)
#plot(x,y,pch=19,ylim=c(0,1))
plot(x,y,pch=19)
lines(xx, predict(fit, data.frame(x=xx)), col="red")
lines(xx, predict(fit2, data.frame(x=xx)), col="green")
lines(xx, predict(fit3, data.frame(x=xx)), col="blue")
lines(xx, predict(fit4, data.frame(x=xx)), col="purple")
lines(xx, predict(fit5, data.frame(x=xx)), col="red")
lines(xx, predict(fit6, data.frame(x=xx)), col="green")
lines(xx, predict(fit7, data.frame(x=xx)), col="blue")
lines(xx, predict(fit8, data.frame(x=xx)), col="purple")
lines(xx, predict(fit9, data.frame(x=xx)), col="pink")
lines(xx, predict(fit10, data.frame(x=xx)), col="red")
lines(xx, predict(fit15, data.frame(x=xx)), col="green")
lines(xx, predict(fit50, data.frame(x=xx)), col="blue")
