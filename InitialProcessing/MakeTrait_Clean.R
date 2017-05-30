library(dplyr)
head <- read.csv("InitialProcessing/WHERES_MY_MIND_STEP2_ALL.csv", header=FALSE, skip=grep("^user_id", readLines("InitialProcessing/WHERES_MY_MIND_STEP2_ALL.csv"))-1, nrows = 1, stringsAsFactors = FALSE)
trait <- read.csv("InitialProcessing/WHERES_MY_MIND_STEP2_ALL.csv", header=FALSE)
colnames(trait) <- head[1,]
trait <- trait[-seq(nrow(trait), by=-1, len=2),]
colnames(trait) <- sub("2_","",colnames(trait))
trait <- trait %>% select(-c(2:4,6,13,22,29,31,32))
trait[,-1] <- as.data.frame(lapply(trait[,-1], as.numeric))
trait <- trait %>% mutate(PHQ12_Anx=PHQ_1+PHQ_2, PHQ34_Dep=PHQ_3+PHQ_4, RRQ=RRQ_1+RRQ_2,FFMQ=FFMQ_1+FFMQ_2, Barratt=Barratt_1+Barratt_2, CSQ=CSQ_1+CSQ_2, CFQ=CFQ_1+CFQ_2, SWLS=SWLS_1+SWLS_2, Social=RyffSocial_1+RyffSocial_2+RyffSocial_3, Purpose=RyffPurpose_1+RyffPurpose_2+RyffPurpose_3)

write.csv(trait, file = "InitialProcessing/Step2_Traits_Clean.csv", row.names = FALSE, quote = FALSE)