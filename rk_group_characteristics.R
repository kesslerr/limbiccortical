# some characteristics for the groups

# load a data frame
library(openxlsx)
df <- read.xlsx("./characteristics.xlsx")

showCharacteristics <-function(df, groupNo){
  
  # age
  print(paste(c("median: ",median(df$Alter[df$Gruppe == groupNo])), sep = "", collapse = ""))
  print(paste(c("mean: ",mean(df$Alter[df$Gruppe == groupNo])), sep = "", collapse = ""))
  print(paste(c("sd: ",sd(df$Alter[df$Gruppe == groupNo])), sep = "", collapse = ""))
  print(paste(c("min: ",min(df$Alter[df$Gruppe == groupNo])), sep = "", collapse = ""))
  print(paste(c("max: ",max(df$Alter[df$Gruppe == groupNo])), sep = "", collapse = ""))
  
  
}

showCharacteristics(df, 1)
