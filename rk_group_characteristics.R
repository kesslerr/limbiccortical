# some characteristics for the groups

# load a data frame
library(openxlsx)
df <- read.xlsx("./characteristics_sparse.xlsx")
df$sex <- as.factor(df$sex)
df$subgroup <- as.factor(df$subgroup)
# add intelligence to DF
df2 <- read.csv("./AllesWichtigeVon513Probanden2.csv", header = TRUE, sep = ";")
for (i in 1:length(df$subject_no)){
  for (j in 1:length(df2$ProbandNr)){
    if ((df$subject_no[i] == df2$ProbandNr[j]) == TRUE){
      df$iq[i] = df2$IQ[j]
    }
  }
}


library(summarytools)
descr(subset(df, select = c("age","education","BDI","HAMD")), stats = c("mean","sd","min","med","max"))

descr(subset(df, subgroup == "no", select = c("age","education","BDI","HAMD")), stats = c("mean","sd","min","med","max"))
descr(subset(df, subgroup == "genetic", select = c("age","education","BDI","HAMD")), stats = c("mean","sd","min","med","max"))
descr(subset(df, subgroup == "environmental", select = c("age","education","BDI","HAMD")), stats = c("mean","sd","min","med","max"))
descr(subset(df, subgroup == "both", select = c("age","education","BDI","HAMD")), stats = c("mean","sd","min","med","max"))


# count the males and females of each group
library(plyr)
count(df, vars = "sex")

count(subset(df, subgroup == "no"), vars = "sex")
count(subset(df, subgroup == "genetic"), vars = "sex")
count(subset(df, subgroup == "environmental"), vars = "sex")
count(subset(df, subgroup == "both"), vars = "sex")







showCharacteristics <-function(df, groupNo){
  
  # continuous variables
  chars <- c("age","BDI", "HAMD", "education")
  for (i in chars){
    #print(i)
    print(paste(c(i,":",
                  "mean ",round(mean(df[,i][df$subgroup == groupNo], na.rm = TRUE), digits = 2),
                  "sd",round(sd(df[,i][df$subgroup == groupNo], na.rm = TRUE), digits = 2),
                  "median",median(df[,i][df$subgroup == groupNo], na.rm = TRUE),
                  "min",min(df[,i][df$subgroup == groupNo], na.rm = TRUE),
                  "max",max(df[,i][df$subgroup == groupNo], na.rm = TRUE)),
                  sep = " ", collapse = " "))
  }
  
  # categorical variables
  #chars <-
  
}

showCharacteristics(df, 1)
