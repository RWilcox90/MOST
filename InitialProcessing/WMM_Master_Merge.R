library(dplyr)
library(tidyr)
## Read in Step 2 data file
## Make sure to replace spaces and blanks with NA's in excel before 
head2 <- read.csv("InitialProcessing/WHERES_MY_MIND_STEP2_ALL.csv", header=FALSE, skip=grep("^user_id", readLines("InitialProcessing/WHERES_MY_MIND_STEP2_ALL.csv"))-1, nrows = 1, stringsAsFactors = FALSE)
step2 <- read.csv("InitialProcessing/WHERES_MY_MIND_STEP2_ALL.csv", header=FALSE)
colnames(step2) <- head2[1,]
step2 <- step2[-seq(nrow(step2), by=-1, len=2),]
colnames(step2) <- sub("2_","",colnames(step2))
num_cols <- c("IPI_1", "SHS_1", "SWLS_2", "PHQ_1", "PHQ_2", "SWLS_1", "RyffSocial_2", "FFMQ_2", "RyffSocial_3", "FFMQ_1", "RyffSocial_1", "CFQ_2", "CFQ_1", "PHQ_3", "PHQ_4", "RRQ_2", "RRQ_1", "RyffPurpose_3", "RyffPurpose_2", "Barratt_1", "RyffPurpose_1", "Barratt_2", "CSQ_1", "CSQ_2")
func <- function(x){
  as.numeric(levels(x))[x]
}
step2[,num_cols] <- lapply(step2[,num_cols], func)
step2 <- step2 %>% mutate(PHQ12_Anx=PHQ_1+PHQ_2, PHQ34_Dep=PHQ_3+PHQ_4, RRQ=RRQ_1+RRQ_2,FFMQ=FFMQ_1+FFMQ_2, Barratt=Barratt_1+Barratt_2, CSQ=CSQ_1+CSQ_2, CFQ=CFQ_1+CFQ_2, SWLS=SWLS_1+SWLS_2, Social=RyffSocial_1+RyffSocial_2+RyffSocial_3, Purpose=RyffPurpose_1+RyffPurpose_2+RyffPurpose_3)

## Read in Step 3 data file
##Make sure to replace spaces and blanks with NA's in excel before hand
head3 <- read.csv("InitialProcessing/WHERE_MY_MIND_STEP3_01012015.csv", header = FALSE, skip=grep("^user_id", readLines("InitialProcessing/WHERE_MY_MIND_STEP3_01012015.csv"))-1, nrows=1, stringsAsFactors = FALSE)
step3 <- read.csv("InitialProcessing/WHERE_MY_MIND_STEP3_01012015.csv", header = FALSE)
