library(dplyr)
library(tidyr)
## Read in main data file
##Make sure to replace spaces and blanks with NA's in excel before hand
head <- read.csv("InitialProcessing/WHERE_MY_MIND_STEP3_01012015.csv", header = FALSE, skip=grep("^user_id", readLines("InitialProcessing/WHERE_MY_MIND_STEP3_01012015.csv"))-1, nrows=1, stringsAsFactors = FALSE)
wmmDat <- read.csv("InitialProcessing/WHERE_MY_MIND_STEP3_01012015.csv", header = FALSE)
colnames(wmmDat) <- head[1,]
colnames(wmmDat) <- sub("3_", "", colnames(wmmDat))
wmmDat <- wmmDat[-seq(nrow(wmmDat), by=-1, len=2),]
## Select only variables needed for analysis
wmmPSNMT <- wmmDat %>% select(user_id, StartTimeStr, Positive, Self, Negative, Mood, Thinking)
wmmPSNMT <- wmmPSNMT %>% filter(Thinking=="Something else"|Thinking=="What I was doing")
wmmPSNMT$Thinking <- factor(wmmPSNMT$Thinking)
## Separates StartTimeStr into 'Day', 'Month', 'Rest'
## and then removes 'Day' and 'Rest'
wmmPSNMT <- separate(wmmPSNMT, col=StartTimeStr, into=c("Day", "Month", "Rest"), sep=" ")
wmmPSNMT <- wmmPSNMT[,-c(2,4)]

uID <- unique(wmmPSNMT$user_id)
## Make vector of all unique ID's present in the dataset to be used to calculate individual regression
## for each subject


## Selects for users that generated at least 18 responses overall and removes rows
## with NA's
fail <- data.frame()
wmmPSNMT_clean <- data.frame()
## This will create an object of a single user's data, use only complete cases,
## and then only use the users that have 18 or more submissions
for (i in 1:length(uID)) {
  uDat <- wmmPSNMT[which(wmmPSNMT$user_id==uID[i]),]
  good <- complete.cases(uDat)
  uDat <- uDat[good,]
  if (nrow(uDat)<18) {
    fail <- rbind(fail, uDat[1,1])
  } else {
    wmmPSNMT_clean <- rbind(wmmPSNMT_clean, uDat)
  }
}

##Add Gender object
genHead <- read.csv("InitialProcessing/WHERES_MY_MIND_USERS_ALL.csv", header = FALSE, skip=grep("^user_id", readLines("InitialProcessing/WHERES_MY_MIND_USERS_ALL.csv"))-1, nrows=1, stringsAsFactors = FALSE)
genDat <- read.csv("InitialProcessing/WHERES_MY_MIND_USERS_ALL.csv", header = FALSE, stringsAsFactors = FALSE)
colnames(genDat) <- genHead[1,]
colnames(genDat) <- sub("1_", "", colnames(genDat))
genDat <- genDat[-seq(nrow(genDat), by=-1, len=2),]
genDat <- genDat[,c("user_id", "Gender")]
good <- complete.cases(genDat)
genDat <- genDat[good,]

## This will cycle through the gender object and subset each user
## It will then take that 1 row subset and cycle through all rows
## of the wmmPSNMTG_Clean object and add the Gender for each row
## in which the users match
wmmPSNMTG_clean <- merge(wmmPSNMT_clean, genDat, by.x = "user_id", by.y = "user_id", all.x = TRUE)

write.csv(wmmPSNMTG_clean, file = "InitialProcessing/wmmPSNMTG_clean.csv", row.names = FALSE)

## Following for loop selects for users that generated atleast 4 responses per month
## This is to be done after the previous for loop that selects for users that 
## generated at least 18 responses overall
fail <- data.frame()
user <- data.frame()
uMonth <- unique(wmmPSNMTG_clean$Month)
for (i in 1:length(uID)) {
  uDat <- wmmPSNMTG_clean[which(wmmPSNMTG_clean$user_id==uID[i]),]
  for (i in 1:length(uMonth)) {
    umDat <- uDat[which(uDat$Month==uMonth[i]),]
    if (nrow(umDat)<4) {
      fail <- rbind(fail, umDat[1,1])
    } else {
      user <- rbind(user, umDat)
    }
  }
}
wmmPSNMTG_clean <- user
