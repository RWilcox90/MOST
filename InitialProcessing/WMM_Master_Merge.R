library(dplyr)
library(tidyr)
func <- function(x){
  as.numeric(levels(x))[x]
}

## Read in Step 2 data file
## Make sure to replace spaces and blanks with NA's in excel before 
head2 <- read.csv("InitialProcessing/WHERES_MY_MIND_STEP2_ALL.csv", header=FALSE, skip=grep("^user_id", readLines("InitialProcessing/WHERES_MY_MIND_STEP2_ALL.csv"))-1, nrows = 1, stringsAsFactors = FALSE)
step2 <- read.csv("InitialProcessing/WHERES_MY_MIND_STEP2_ALL.csv", header=FALSE, stringsAsFactors = FALSE)
colnames(step2) <- head2[1,]
step2 <- step2[-seq(nrow(step2), by=-1, len=2),]
colnames(step2) <- sub("2_","",colnames(step2))
step2[step2=="N/A"] <- NA
num_cols2 <- c("user_id", "IPI_1", "SHS_1", "SWLS_2", "PHQ_1", "PHQ_2", "SWLS_1", "RyffSocial_2", "FFMQ_2", "RyffSocial_3", "FFMQ_1", "RyffSocial_1", "CFQ_2", "CFQ_1", "PHQ_3", "PHQ_4", "RRQ_2", "RRQ_1", "RyffPurpose_3", "RyffPurpose_2", "Barratt_1", "RyffPurpose_1", "Barratt_2", "CSQ_1", "CSQ_2")
step2[num_cols2] <- lapply(step2[num_cols2], as.numeric)
step2 <- step2 %>% mutate(PHQ12_Anx=PHQ_1+PHQ_2, PHQ34_Dep=PHQ_3+PHQ_4, RRQ=RRQ_1+RRQ_2,FFMQ=FFMQ_1+FFMQ_2, Barratt=Barratt_1+Barratt_2, CSQ=CSQ_1+CSQ_2, CFQ=CFQ_1+CFQ_2, SWLS=SWLS_1+SWLS_2, Social=RyffSocial_1+RyffSocial_2+RyffSocial_3, Purpose=RyffPurpose_1+RyffPurpose_2+RyffPurpose_3)
step2$TimeZone_ID <- factor(step2$TimeZone_ID)
colnames(step2)[colnames(step2)=="StartTimeStr"] <- "Step2StartTimeStr"
colnames(step2)[colnames(step2)=="StopTimeStr"] <- "Step2StopTimeStr"
colnames(step2)[colnames(step2)=="TimeZone_ID"] <- "Step2TimeZoneID"
colnames(step2)[colnames(step2)=="Goal_3"] <- "Step2Goal_3"
colnames(step2)[colnames(step2)=="Goal_1"] <- "Step2Goal_1"
colnames(step2)[colnames(step2)=="Goal_2"] <- "Step2Goal_2"
colnames(step2)[colnames(step2)=="Social"] <- "Step2Social"


## Read in Step 3 data file
##Make sure to replace spaces and blanks with NA's in excel before hand
head3 <- read.csv("InitialProcessing/WHERE_MY_MIND_STEP3_01012015.csv", header = FALSE, skip=grep("^user_id", readLines("InitialProcessing/WHERE_MY_MIND_STEP3_01012015.csv"))-1, nrows=1, stringsAsFactors = FALSE)
step3 <- read.csv("InitialProcessing/WHERE_MY_MIND_STEP3_01012015.csv", header = FALSE, stringsAsFactors = FALSE)
colnames(step3) <- head3[1,]
colnames(step3) <- sub("3_", "", colnames(step3))
step3 <- step3[-seq(nrow(step3), by=-1, len=2),]
step3[step3=="N/A"] <- NA
step3 <- step3 %>% filter(Thinking=="Something else"|Thinking=="What I was doing")
num_cols3 <- c(1,3:8,13:14,16,18,20:24,26:40)
step3[,num_cols3] <- lapply(step3[,num_cols3], as.numeric)
fac_cols3 <- c("TimeZone_ID", "Thinking", "Activity")
step3[fac_cols3] <- lapply(step3[fac_cols3], factor)
colnames(step3)[colnames(step3)=="StartTimeStr"] <- "Step3StartTimeStr"
colnames(step3)[colnames(step3)=="StopTimeStr"] <- "Step3StopTimeStr"
colnames(step3)[colnames(step3)=="TimeZone_ID"] <- "Step3TimeZoneID"
colnames(step3)[colnames(step3)=="Social"] <- "Step3Social"

tsplit <- step3 %>% select(Time)
tsplit <- separate(tsplit, col=Time, into=c("Time_1","Time_2","Time_3","Time_4","Time_5","Time_6","Time_7","Time_8","Time_9","Time_10","Time_11","Time_12","Time_13","Time_14","Time_15","Time_16"), sep="@")

for (i in 1:nrow(tsplit)) {
  if ("A timeless topic (not relating to the past, present, or future)" %in% tsplit[i,1:16]) {
    tsplit$Timeless[i] <- 1
  } else {
    tsplit$Timeless[i] <- 0
  }
}
##This runs an if else statment through each row taking into account each column and sees
##if there is a text string in there, if there is then it places a 1 within the new
##column or if there isn't places a 0.  This assumes that each text string (the answers
##to 3_time) will only be present in one of the columns within each row

for (i in 1:nrow(tsplit)) {
  if ("The past (more than 3 years ago)" %in% tsplit[i,1:16]) {
    tsplit$Past.More.3.Years[i] <- 1
  } else {
    tsplit$Past.More.3.Years[i] <- 0
  }
}

for (i in 1:nrow(tsplit)) {
  if ("The past (between 1-3 years ago)" %in% tsplit[i,1:16]) {
    tsplit$Past.Between.1.3.Years[i] <- 1
  } else {
    tsplit$Past.Between.1.3.Years[i] <- 0
  }
}

for (i in 1:nrow(tsplit)) {
  if ("The past (between 1-12 months ago)" %in% tsplit[i,1:16]) {
    tsplit$Past.Between.1.12.Months[i] <- 1
  } else {
    tsplit$Past.Between.1.12.Months[i] <- 0
  }
}

for (i in 1:nrow(tsplit)) {
  if ("The past (between 1-4 weeks ago)" %in% tsplit[i,1:16]) {
    tsplit$Past.Between.1.4.Weeks[i] <- 1
  } else {
    tsplit$Past.Between.1.4.Weeks[i] <- 0
  }
}

for (i in 1:nrow(tsplit)) {
  if ("The past (between 1-7 days ago)" %in% tsplit[i,1:16]) {
    tsplit$Past.Between.1.7.Days[i] <- 1
  } else {
    tsplit$Past.Between.1.7.Days[i] <- 0
  }
}

for (i in 1:nrow(tsplit)) {
  if ("The past (yesterday)" %in% tsplit[i,1:16]) {
    tsplit$Past.Yesterday[i] <- 1
  } else {
    tsplit$Past.Yesterday[i] <- 0
  }
}

for (i in 1:nrow(tsplit)) {
  if ("The past (earlier today)" %in% tsplit[i,1:16]) {
    tsplit$Past.Earlier.Today[i] <- 1
  } else {
    tsplit$Past.Earlier.Today[i] <- 0
  }
}

for (i in 1:nrow(tsplit)) {
  if ("The present (within the current 5 minutes)" %in% tsplit[i,1:16]) {
    tsplit$Present.5.Minutes[i] <- 1
  } else {
    tsplit$Present.5.Minutes[i] <- 0
  }
}

for (i in 1:nrow(tsplit)) {
  if ("The future (later today)" %in% tsplit[i,1:16]) {
    tsplit$Future.Later.Today[i] <- 1
  } else {
    tsplit$Future.Later.Today[i] <- 0
  }
}

for (i in 1:nrow(tsplit)) {
  if ("The future (tomorrow)" %in% tsplit[i,1:16]) {
    tsplit$Future.Tomorrow[i] <- 1
  } else {
    tsplit$Future.Tomorrow[i] <- 0
  }
}

for (i in 1:nrow(tsplit)) {
  if ("The future (between 1-7 days from now)" %in% tsplit[i,1:16]) {
    tsplit$Future.Between.1.7.Days[i] <- 1
  } else {
    tsplit$Future.Between.1.7.Days[i] <- 0
  }
}

for (i in 1:nrow(tsplit)) {
  if ("The future (between 1-4 weeks from now)" %in% tsplit[i,1:16]) {
    tsplit$Future.Between.1.4.Weeks[i] <- 1
  } else {
    tsplit$Future.Between.1.4.Weeks[i] <- 0
  }
}

for (i in 1:nrow(tsplit)) {
  if ("The future (between 1-12 months from now)" %in% tsplit[i,1:16]) {
    tsplit$Future.Between.1.12.Months[i] <- 1
  } else {
    tsplit$Future.Between.1.12.Months[i] <- 0
  }
}

for (i in 1:nrow(tsplit)) {
  if ("The future (between 1-3 years from now)" %in% tsplit[i,1:16]) {
    tsplit$Future.Between.1.3.Years[i] <- 1
  } else {
    tsplit$Future.Between.1.3.Years[i] <- 0
  }
}

for (i in 1:nrow(tsplit)) {
  if ("The future (more than 3 years from now)" %in% tsplit[i,1:16]) {
    tsplit$Future.More.3.Years[i] <- 1
  } else {
    tsplit$Future.More.3.Years[i] <- 0
  }
}

tsplit <- tsplit[,-c(1:16),drop=FALSE]
step3 <- cbind(step3, tsplit)


## Read in Users data file
headU <- read.csv("InitialProcessing/WHERES_MY_MIND_USERS_ALL.csv", header = FALSE, skip=grep("^user_id", readLines("InitialProcessing/WHERES_MY_MIND_USERS_ALL.csv"))-1, nrows=1, stringsAsFactors = FALSE)
Users <- read.csv("InitialProcessing/WHERES_MY_MIND_USERS_ALL.csv", header = FALSE, stringsAsFactors = FALSE)
colnames(Users) <- headU[1,]
colnames(Users) <- sub("1_", "", colnames(Users))
Users <- Users[-seq(nrow(Users), by=-1, len=2),]
Users[Users=="N/A"] <- NA
num_colsU <- c(1,6,7,21,22,26)
Users[,num_colsU] <- lapply(Users[,num_colsU], as.numeric)
fac_colsU <- c(4,5,8,10:13,15:17,23,24)
Users[,fac_colsU] <- lapply(Users[,fac_colsU], factor)
colnames(Users)[colnames(Users)=="TimeZone_ID"] <- "UsersTimeZoneID"


## Read in Step 4 data file
head4 <- read.csv("InitialProcessing/WHERE_MY_MIND_STEP4_01012015.csv", header = FALSE, skip=grep("^user_id", readLines("InitialProcessing/WHERE_MY_MIND_STEP4_01012015.csv"))-1, nrows=1, stringsAsFactors = FALSE)
step4 <- read.csv("InitialProcessing/WHERE_MY_MIND_STEP4_01012015.csv", header = FALSE, stringsAsFactors = FALSE)
colnames(step4) <- head4[1,]
colnames(step4) <- sub("4_", "", colnames(step4))
step4 <- step4[-seq(nrow(step4), by=-1, len=2),]
step4[step4=="N/A"] <- NA
num_cols4 <- c(1:4)
step4[,num_cols4] <- lapply(step4[,num_cols4], as.numeric)
step4$TimeZone_ID <- factor(step4$TimeZone_ID)
colnames(step4)[colnames(step4)=="StartTimeStr"] <- "Step4StartTimeStr"
colnames(step4)[colnames(step4)=="StopTimeStr"] <- "Step4StopTimeStr"
colnames(step4)[colnames(step4)=="TimeZone_ID"] <- "Step4TimeZoneID"


## Merge Users, Step2, Step3
UStep2 <- merge(Users, step2, by.x = "user_id", by.y = "user_id", all = TRUE)
UStep23 <- merge(UStep2, step3, by.x = "user_id", by.y = "user_id", all = TRUE)
UStep234 <- merge(UStep23, step4, by.x = "user_id", by.y = "user_id", all = TRUE)

write.csv(UStep234, file = "wmmApp_Master.csv", row.names = FALSE, quote = FALSE)