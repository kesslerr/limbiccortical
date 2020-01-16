#install.packages("BEST")

library(BEST)
library(rjags)
library(R.matlab)
library(openxlsx)
library(ggplot2)

plotPath = 'D:/MACS/limbiccortical/plots/BEST/' 

# import posterior distribution
df <- read.xlsx('D:/MACS/limbiccortical/data/characteristics_sparse.xlsx')

hdiinterval <- 0.95


## Comparison of two groups:
## =========================
# subgroup 1: no risk
# subgroup 2: genetic risk
# subgroup 3: environmental risk
# subgroup 4: both risks

# Analysis: HC no risk vs. HC genetic risk
BESTout_ana1 <- BEST::BESTmcmc(y1 = df$inhibition [df$subgroup == "no"] , 
                               y2 = df$inhibition [df$subgroup == "genetic" | df$subgroup == "both"],
                               numSavedSteps = 50000)
summary(BESTout_ana1)
plotAll(BESTout_ana1, credMass=hdiinterval, ROPEm=c(-0.1,0.1), ROPEeff=c(-0.1,0.1), compValm=0.5, showCurve=TRUE)
dev.copy(png,paste0(c(plotPath,"no_risk_vs_gen_risk.png"),collapse = ""), width = 600, height = 900)
dev.off()

# Analysis: HC no risk vs. HC environmental risk
BESTout_ana2 <- BEST::BESTmcmc(y1 = df$inhibition [df$subgroup == "no"] , 
                               y2 = df$inhibition [df$subgroup == "environmental" | df$subgroup == "both"],
                               numSavedSteps = 50000)
summary(BESTout_ana2)
plotAll(BESTout_ana2, credMass=hdiinterval, ROPEm=c(-0.1,0.1), ROPEeff=c(-0.1,0.1), compValm=0.5, showCurve=TRUE)
dev.copy(png,paste0(c(plotPath,"no_risk_vs_env_risk.png"),collapse = ""), width = 600, height = 900)
dev.off()




# overall properties
xlim <- c(-1.,0.5)
showCurve = TRUE
cexLab <- 1 #.25
credMass <- 0.95 # hdi interval
par(bg=NA) # makes the background transparaent


# plot the stuff for the paper

mu1 = BESTout_ana1$mu1
mu2 = BESTout_ana1$mu2
mudiff12 = mu1 - mu2
mu3 = BESTout_ana2$mu2
mudiff13 = mu1 - mu3

png("D:/MACS/limbiccortical/plots/BEST/all.png", width = 800, height = 500, res = 100, pointsize = 10)
par(mfrow=c(2,3))

histInfo = plotPost( mu1 ,main=paste("no risk"),
                     xlim=xlim , credMass = credMass, cex.lab = cexLab, showCurve=showCurve, xlab="coupling strength",
                     col= "#33a02c")
abline(v = 0, lty = 3)
histInfo = plotPost( mu2 ,main=paste("genetic risk"),
                     xlim=xlim , credMass = credMass, cex.lab = cexLab, showCurve=showCurve, xlab="coupling strength",
                     col= "#1f78b4")
abline(v = 0, lty = 3)
histInfo = plotPost( mudiff12 ,main=paste("difference"),
                     xlim=xlim , credMass = credMass, cex.lab = cexLab, showCurve=showCurve, xlab="coupling strength",
                     col= "#a6cee3")
abline(v = 0, lty = 3)
frame() # blank plot
#
histInfo = plotPost( mu3 ,main=paste("environmental risk"),
                     xlim=xlim , credMass = credMass, cex.lab = cexLab, showCurve=showCurve, xlab="coupling strength",
                     col= "#e31a1c")
abline(v = 0, lty = 3)

histInfo = plotPost( mudiff13 ,main=paste("difference"),
                     xlim=xlim , credMass = credMass, cex.lab = cexLab, showCurve=showCurve, xlab="coupling strength",
                     col= "#fb9a99")
abline(v = 0, lty = 3)

dev.off() # saving the picture
