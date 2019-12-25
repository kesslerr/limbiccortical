#install.packages("BEST")

library(BEST)
library(R.matlab)
library(openxlsx)

# import posterior distribution
BMAdata <- readMat('E:/MACS/credible_intervals/BMS_values_for_credible_intervals_p9.mat')
SUBdata <- read.xlsx('E:/MACS/moebius/macs_dcm_R_table_new_analysis800.xlsx')

hdiinterval <- 0.95


## Comparison of two groups:
## =========================
#y1 <- c(5.77, 5.33, 4.59, 4.33, 3.66, 4.48)
#y2 <- c(3.88, 3.55, 3.29, 2.59, 2.33, 3.59)

# Analysis 1: HC vs. MDD
BESTout_ana1 <- BESTmcmc(SUBdata$y [SUBdata$x0 == 1] , SUBdata$y [SUBdata$x1 == 1], numSavedSteps = 500000)
summary(BESTout_ana1)
plotAll(BESTout_ana1, credMass=hdiinterval, ROPEm=c(-0.1,0.1), ROPEeff=c(-0.1,0.1), compValm=0.5, showCurve=TRUE, showMode = FALSE)
dev.copy(png,"E:/MACS/credible_intervals/R_proj/p9/best_analysis1_all.png", width = 600, height = 900)
dev.off()


# Analysis 1: HC vs. MDD unmedicated
BESTout_ana1nomed <- BESTmcmc(SUBdata$y [SUBdata$x0 == 1] , SUBdata$y [SUBdata$x1 == 1 & SUBdata$x20 == 1 & SUBdata$x3 == 0 & SUBdata$x4 == 0], numSavedSteps = 50000)
summary(BESTout_ana1nomed)
plotAll(BESTout_ana1nomed, credMass=hdiinterval, ROPEm=c(-0.1,0.1), ROPEeff=c(-0.1,0.1), compValm=0.5, showCurve=TRUE, showMode = FALSE)
dev.copy(png,"E:/MACS/credible_intervals/R_proj/p9/best_analysis1_all.png", width = 600, height = 900)
dev.off()



# Analysis 2: MDD unmed vs MDD SSRI
BESTout_ana2_12 <- BESTmcmc(SUBdata$y [SUBdata$x20 == 1 & SUBdata$x2 == 0 & SUBdata$x3 == 0 ] , SUBdata$y [SUBdata$x20 == 1 & SUBdata$x2 == 1 ] )
summary(BESTout_ana2_12)
plotAll(BESTout_ana2_12, credMass=hdiinterval, ROPEm=c(-0.1,0.1), ROPEeff=c(-0.1,0.1), compValm=0.5, showCurve=TRUE)
dev.copy(png,"E:/MACS/credible_intervals/R_proj/p9/best_analysis2_12_all.png", width = 600, height = 900)
dev.off()

# Analysis 2: MDD unmed vs MDD SSNRI
BESTout_ana2_13 <- BESTmcmc(SUBdata$y [SUBdata$x20 == 1 & SUBdata$x2 == 0 & SUBdata$x3 == 0 ] , SUBdata$y [SUBdata$x20 == 1 & SUBdata$x3 == 1 ] )
summary(BESTout_ana2_13)
plotAll(BESTout_ana2_13, credMass=hdiinterval, ROPEm=c(-0.1,0.1), ROPEeff=c(-0.1,0.1), compValm=0.5, showCurve=TRUE)
dev.copy(png,"E:/MACS/credible_intervals/R_proj/p9/best_analysis2_13_all.png", width = 600, height = 900)
dev.off()

# Analysis 2: MDD unmed vs MDD sero
BESTout_ana2_14 <- BESTmcmc(SUBdata$y [SUBdata$x20 == 1 & SUBdata$x2 == 0 & SUBdata$x3 == 0 ] , SUBdata$y [SUBdata$x20 == 1 & ( SUBdata$x2 == 1 | SUBdata$x3 == 1 ) ])
summary(BESTout_ana2_14)
plotAll(BESTout_ana2_14, credMass=hdiinterval, ROPEm=c(-0.1,0.1), ROPEeff=c(-0.1,0.1), compValm=0.5, showCurve=TRUE)
dev.copy(png,"E:/MACS/credible_intervals/R_proj/p9/best_analysis2_14_all.png", width = 600, height = 900)
dev.off()

# Analysis 3: HC no risk vs. HC genetic risk
BESTout_ana3_12 <- BESTmcmc(SUBdata$y [SUBdata$x0 == 1 & SUBdata$x4 == 0 & SUBdata$x5 == 0] , SUBdata$y [SUBdata$x0 == 1 & SUBdata$x4 == 1], numSavedSteps = 500000)
summary(BESTout_ana3_12)
plotAll(BESTout_ana3_12, credMass=hdiinterval, ROPEm=c(-0.1,0.1), ROPEeff=c(-0.1,0.1), compValm=0.5, showCurve=TRUE)
dev.copy(png,"E:/MACS/credible_intervals/R_proj/p9/best_analysis3_12_exclusive_all.png", width = 600, height = 900)
dev.off()

# Analysis 3: HC no risk vs. HC environmental risk
BESTout_ana3_13 <- BESTmcmc(SUBdata$y [SUBdata$x0 == 1 & SUBdata$x4 == 0 & SUBdata$x5 == 0] , SUBdata$y [SUBdata$x0 == 1 & SUBdata$x5 == 1], numSavedSteps = 500000)
summary(BESTout_ana3_13)
plotAll(BESTout_ana3_13, credMass=hdiinterval, ROPEm=c(-0.1,0.1), ROPEeff=c(-0.1,0.1), compValm=0.5, showCurve=TRUE)
dev.copy(png,"E:/MACS/credible_intervals/R_proj/p9/best_analysis3_13_exclusive_all.png", width = 600, height = 900)
dev.off()

# here with the both risk group treated as a single group and those subjects not included in the first two analyses
# Analysis 3: HC no risk vs. HC genetic risk
BESTout_ana3_12 <- BESTmcmc(SUBdata$y [SUBdata$x0 == 1 & SUBdata$x4 == 0 & SUBdata$x5 == 0] , SUBdata$y [SUBdata$x0 == 1 & SUBdata$x4 == 1 & SUBdata$x5 == 0], numSavedSteps = 50000)
summary(BESTout_ana3_12)
plotAll(BESTout_ana3_12, credMass=hdiinterval, ROPEm=c(-0.1,0.1), ROPEeff=c(-0.1,0.1), compValm=0.5, showCurve=TRUE)
dev.copy(png,"E:/MACS/credible_intervals/R_proj/p9/best_analysis3_12_all.png", width = 600, height = 900)
dev.off()

# Analysis 3: HC no risk vs. HC environmental risk
BESTout_ana3_13 <- BESTmcmc(SUBdata$y [SUBdata$x0 == 1 & SUBdata$x4 == 0 & SUBdata$x5 == 0] , SUBdata$y [SUBdata$x0 == 1 & SUBdata$x4 == 0 & SUBdata$x5 == 1])
summary(BESTout_ana3_13)
plotAll(BESTout_ana3_13, credMass=hdiinterval, ROPEm=c(-0.1,0.1), ROPEeff=c(-0.1,0.1), compValm=0.5, showCurve=TRUE)
dev.copy(png,"E:/MACS/credible_intervals/R_proj/p9/best_analysis3_13_all.png", width = 600, height = 900)
dev.off()

# Analysis 3: HC no risk vs. HC both risks
BESTout_ana3_14 <- BESTmcmc(SUBdata$y [SUBdata$x1 == 1 & SUBdata$x4 == 0 & SUBdata$x5 == 0] , SUBdata$y [SUBdata$x0 == 1 & SUBdata$x4 == 1 & SUBdata$x5 == 1])
summary(BESTout_ana3_14)
plotAll(BESTout_ana3_14, credMass=hdiinterval, ROPEm=c(-0.1,0.1), ROPEeff=c(-0.1,0.1), compValm=0.5, showCurve=TRUE)
dev.copy(png,"E:/MACS/credible_intervals/R_proj/p9/best_analysis3_14_all.png", width = 600, height = 900)
dev.off()


### new Feb 2019: both MDD and HC included in the risk analysis


# Analysis 3: HC no risk vs. HC environmental risk
BESTout_ana4 <- BESTmcmc(SUBdata$y [SUBdata$x0 == 1 & SUBdata$x4 == 0 & SUBdata$x5 == 0] , SUBdata$y [SUBdata$x0 == 1 & SUBdata$x5 == 1], numSavedSteps = 500000)
summary(BESTout_ana3_13)
plotAll(BESTout_ana3_13, credMass=hdiinterval, ROPEm=c(-0.1,0.1), ROPEeff=c(-0.1,0.1), compValm=0.5, showCurve=TRUE)
dev.copy(png,"E:/MACS/credible_intervals/R_proj/p9/best_analysis3_13_exclusive_all.png", width = 600, height = 900)
dev.off()




##########################
# plot all for paper #####
##########################

# general
xseq<-seq(-1.0,0.7,.005)
lwdthin <- 3
lwdthick <- 5


# ana 1
plot.new()
#png(
#  "E:/MACS/credible_intervals/R_proj/best_analysis1.png",
#  width     = 600,
#  height    = 300,
#  pointsize = 12)
mean <- c( mean(BESTout_ana1$mu1) , mean(BESTout_ana1$mu2) )
sd   <- c( sd(BESTout_ana1$mu1) ,   sd(BESTout_ana1$mu2) )
muDiff <- BESTout_ana1$mu1 - BESTout_ana1$mu2
meanDiff <- mean(muDiff)
sdDiff <- sd(muDiff)
densities     <- array(1:(length(xseq)*length(mean)), dim=c(length(mean),length(xseq)))
densitiesDiff <- array(1:(length(xseq)*length(meanDiff)), dim=c(length(meanDiff),length(xseq)))
for (i in 1:length(mean)) {  densities[i,] =dnorm(xseq, mean[i], sd[i]) }
for (i in 1:length(meanDiff)) {  densitiesDiff[i,] =dnorm(xseq, meanDiff[i], sdDiff[i]) }
col=c("#006d2c","#810f7c")
plot(xseq, densities[1,], col=col[1] ,xlab="posterior parameter estimate", ylab="", type="l", yaxt='n', lwd=lwdthick, cex=2, main="diagnosis", cex.axis=.8, ylim=c(0,max(densities))) # vline=0)
for (i in 2:length(mean)) { lines(xseq, densities[i,], col=col[i], type="l", lwd=lwdthick, cex=2)}
# display means at top of curve
text(x = mean[1], y = max(densities[1,])*1.02, labels = round(mean[1],2), adj = NULL, pos = NULL, offset = 0.5, vfont = NULL, cex = 1, col = NULL, font = NULL)
text(x = mean[2], y = max(densities[2,])*1.02, labels = round(mean[2],2), adj = NULL, pos = NULL, offset = 0.5, vfont = NULL, cex = 1, col = NULL, font = NULL)

#diff curve
for (i in 1:length(meanDiff)) { lines(xseq, densitiesDiff[i,], col='black', type="l", lwd=lwdthick, lty='dotted', cex=2)}
# display means at top of diff curve
text(x = meanDiff, y = max(densitiesDiff)*1.02, labels = round(meanDiff[1],2), adj = NULL, pos = NULL, offset = 0.5, vfont = NULL, cex = 1, col = NULL, font = NULL)

# sigma diff / unequal variances?
#sigmaDiff <- BESTout_ana1$sigma1 - BESTout_ana1$sigma2
#densitiesSigmaDiff =dnorm(xseq, mean(sigmaDiff), sd(sigmaDiff))
#lines(xseq, densitiesSigmaDiff, col='darkgray', type="l", lwd=lwdthick, lty='dotted', cex=2)

# legends and boxes
legend("topright", legend = c('HC','MDD','meanDiff(HC,MDD)'), col=c(col,'black'), lty=c("solid", "solid", "dotted"), lwd=lwdthick) # optional legend
box(lwd=lwdthin)
abline(v = 0, lwd=lwdthin)

# get 95 HDI
hdi1 <- hdi(muDiff, credMass = hdiinterval)
segments(x0 = hdi1['lower'], y0 = 0, x1 = hdi1['upper'], y1 = 0, col = par("fg"), lty = "solid", lwd = 10) # was both  y1 = max(densities)/1.2
text(hdi1["lower"], y = max(densities)*0.05, labels = round(hdi1["lower"],2), adj = NULL, pos = NULL, offset = 0.5, vfont = NULL, cex = 1, col = NULL, font = NULL)
text(hdi1["upper"], y = max(densities)*0.05, labels = round(hdi1["upper"],2), adj = NULL, pos = NULL, offset = 0.5, vfont = NULL, cex = 1, col = NULL, font = NULL)
text(( hdi1["upper"] - (hdi1['upper'] - hdi1['lower'] ) / 2 ), y = max(densities)*0.05, labels = paste(c(hdiinterval*100,'% HDI'),collapse = ""), adj = NULL, pos = NULL, offset = 0.5, vfont = NULL, cex = 1, col = NULL, font = NULL)

# get probability of negative values
percent_negative <- round(length(muDiff[muDiff<0]) / length(muDiff) * 100, digits = 1)
percent_positive <- 100 - percent_negative
text(x = c(-0.1,-0.1,0.1,0.1),
     y = c(max(densitiesDiff)/2, max(densitiesDiff)/2.3, max(densitiesDiff)/2, max(densitiesDiff)/2.3),
     labels = c(paste(c(percent_negative,'%'),collapse=""), '< 0',paste(c(percent_positive,'%'),collapse=""), '> 0'),
     adj = NULL, pos = NULL, offset = 0.5, vfont = NULL, cex = 1, col = NULL, font = NULL)

# saving
dev.copy(png,"E:/MACS/credible_intervals/R_proj/best_analysis1.png", width = 1000, height = 500)
dev.off() # save the picture

# display some values
#print( 'analysis 1 - HC vs MDD' )
#print( c('mean') )
#print( 'analysis 1 - HC vs MDD' )

# delete variables
rm(muDiff)

# ana 2
Ncomp <- 2
mean     <- c ( mean(BESTout_ana2_12$mu1) , mean(BESTout_ana2_12$mu2) , mean(BESTout_ana2_13$mu2) )
sd       <- c ( sd(BESTout_ana2_12$mu1) , sd(BESTout_ana2_12$mu2) , sd(BESTout_ana2_13$mu2) )
muDiff   = cbind ( BESTout_ana2_12$mu1 - BESTout_ana2_12$mu2, BESTout_ana2_13$mu1 - BESTout_ana2_13$mu2)
meanDiff <- c ( mean(muDiff[,1] ), mean(muDiff[,2]) )
sdDiff   <- c ( sd(muDiff[,1]) ,   sd(muDiff[,2]) )
densities     <- array(1:(length(xseq)*length(mean)), dim=c(length(mean),length(xseq)))
densitiesDiff <- array(1:(length(xseq)*length(meanDiff)), dim=c(length(meanDiff),length(xseq)))
for (i in 1:length(mean)) {  densities[i,] =dnorm(xseq, mean[i], sd[i]) }
for (i in 1:length(meanDiff)) {  densitiesDiff[i,] =dnorm(xseq, meanDiff[i], sdDiff[i]) }
col=c("#810f7c","#8c6bb1","#8c96c6")
plot(xseq, densities[1,], col=col[1] ,xlab="posterior parameter estimate", ylab="", type="l", yaxt='n', lwd=lwdthick, cex=2, main="medication", cex.axis=.8, ylim=c(0,max(densities))) # vline=0)
for (i in 2:length(mean)) { lines(xseq, densities[i,], col=col[i], type="l", lwd=lwdthick, cex=2)}
#diff curve
for (i in 1:length(meanDiff)) { lines(xseq, densitiesDiff[i,], col=col[i+1], type="l", lwd=lwdthick, lty='dotted', cex=2)}
legend("topright", legend = c('MDD unmedicated','MDD SSRI','MDD SSNRI','diff(unmedicated,SSRI)','diff(unmedicated,SSNRI)'), col=c(col,col[2:3]), lty=c("solid", "solid", "solid", "dotted", "dotted"), lwd=lwdthick) # optional legend
box(lwd=lwdthin)
abline(v = 0, lwd=lwdthin)
# get 95 HDI
hdi1 <- hdi(muDiff, credMass = hdiinterval)
for (i in 1:length(meanDiff)) {
  segments(x0 = hdi1['lower',i], y0 = max(densities)/(1.2*i), x1 = hdi1['upper',i], y1 = max(densities)/(1.2*i), col = par("fg"), lty = "solid", lwd = 10)
  text(hdi1["lower",i], y = max(densities)/(1.3*i), labels = round(hdi1["lower",i],2), adj = NULL, pos = NULL, offset = 0.5, vfont = NULL, cex = 1, col = NULL, font = NULL)
  text(hdi1["upper",i], y = max(densities)/(1.3*i), labels = round(hdi1["upper",i],2), adj = NULL, pos = NULL, offset = 0.5, vfont = NULL, cex = 1, col = NULL, font = NULL)
  text(( hdi1["upper",i] - (hdi1['upper',i] - hdi1['lower',i] ) / 2 ), y = max(densities)/(1.1*i), labels = paste(c(hdiinterval*100,'% HDI'),collapse = ""), adj = NULL, pos = NULL, offset = 0.5, vfont = NULL, cex = 1, col = NULL, font = NULL)
}
# get probability of negative values
for (i in 1:Ncomp) {
  percent_negative[i] <- round(length(muDiff[muDiff[,i]<0]) / length(muDiff[,i]) * 100, digits = 1)
  percent_positive[i] <- 100 - percent_negative[i]
  text(x = c(-0.1,-0.1,0.1,0.1),
       y = c(max(densitiesDiff[i,])/2, max(densitiesDiff[i,])/2.3, max(densitiesDiff[i,])/2, max(densitiesDiff[i,])/2.3),
       labels = c(paste(c(percent_negative[i],'%'),collapse=""), '< 0',paste(c(percent_positive[i],'%'),collapse=""), '> 0'),
       adj = NULL, pos = NULL, offset = 0.5, vfont = NULL, cex = 1, col = NULL, font = NULL)
}



# saving
dev.copy(png,"E:/MACS/credible_intervals/R_proj/best_analysis2.png", width = 1000, height = 500)
dev.off() # save the picture



############################################################################


plot(BESTout_ana3_14, "sd")
plotPostPred(BESTout_ana3_14)
plotAll(BESTout_ana3_14, credMass=0.8, ROPEm=c(-0.1,0.1), ROPEeff=c(-0.2,0.2), compValm=0.5)
plotAll(BESTout_ana3_14, credMass=0.8, ROPEm=c(-0.1,0.1), ROPEeff=c(-0.2,0.2), compValm=0.5, showCurve=TRUE)

summary(BESTout_ana3_14, credMass=0.8, ROPEm=c(-0.1,0.1), ROPEsd=c(-0.15,0.15), ROPEeff=c(-0.2,0.2))
pairs(BESTout_ana3_14)
head(BESTout_ana3_14$mu1)



plot(BESTout, "sd")
plotPostPred(BESTout)
plotAll(BESTout, credMass=0.8, ROPEm=c(-0.1,0.1), ROPEeff=c(-0.2,0.2), compValm=0.5)
plotAll(BESTout, credMass=0.8, ROPEm=c(-0.1,0.1), ROPEeff=c(-0.2,0.2), compValm=0.5, showCurve=TRUE)

summary(BESTout, credMass=0.8, ROPEm=c(-0.1,0.1), ROPEsd=c(-0.15,0.15), ROPEeff=c(-0.2,0.2))
pairs(BESTout)
head(BESTout$mu1)
muDiff <- BESTout$mu1 - BESTout$mu2
mean(muDiff > 1.5)
mean(BESTout$sigma1 - BESTout$sigma2)
hist(BESTout$nu)