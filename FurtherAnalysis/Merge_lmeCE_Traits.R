## Load Trait questionnaire file
## This is the most up to date traits but there is a past traits file "Mean_app_data_split_traits_demog.csv"
wmmTraits <- read.csv("InitialProcessing/Step2_Traits_Clean.csv")


ceNST_Traits <- merge(ceNST, wmmTraits, by.x = "user_id", by.y = "user_id", all.x = TRUE)
ceNS_Traits <- merge(ceNS, wmmTraits, by.x = "user_id", by.y = "user_id", all.x = TRUE)
ceNT_Traits <- merge(ceNT, wmmTraits, by.x = "user_id", by.y = "user_id", all.x = TRUE)
ceST_Traits <- merge(ceST, wmmTraits, by.x = "user_id", by.y = "user_id", all.x = TRUE)
ceMST_Traits <- merge(ceMST, wmmTraits, by.x = "user_id", by.y = "user_id", all.x = TRUE)
ceMS_Traits <- merge(ceMS, wmmTraits, by.x = "user_id", by.y = "user_id", all.x = TRUE)
ceMT_Traits <- merge(ceMT, wmmTraits, by.x = "user_id", by.y = "user_id", all.x = TRUE)

write.csv(ceNST_Traits, file="ceNST_Traits.csv", row.names = FALSE, quote = FALSE)
write.csv(ceNS_Traits, file="ceNS_Traits.csv", row.names = FALSE, quote = FALSE)
write.csv(ceNT_Traits, file="ceNT_Traits.csv", row.names = FALSE, quote = FALSE)
write.csv(ceST_Traits, file="ceST_Traits.csv", row.names = FALSE, quote = FALSE)
write.csv(ceMST_Traits, file="ceMST_Traits.csv", row.names = FALSE, quote = FALSE)
write.csv(ceMS_Traits, file="ceMS_Traits.csv", row.names = FALSE, quote = FALSE)
write.csv(ceMT_Traits, file="ceMT_Traits.csv", row.names = FALSE, quote = FALSE)
