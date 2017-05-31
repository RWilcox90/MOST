ce <- read.csv("lmeCE_Trait_Files/ceST_Traits.csv")

Int <- as.data.frame(list(Var="Int", CSQ1=cor(ce$Intercept, ce$CSQ_1, use="complete.obs"),
                           CSQ2=cor(ce$Intercept, ce$CSQ_2, use="complete.obs"),
                           PHQAnx=cor(ce$Intercept, ce$PHQ12_Anx, use="complete.obs"),
                           PHQDep=cor(ce$Intercept, ce$PHQ34_Dep, use="complete.obs"),
                           RRQ=cor(ce$Intercept, ce$RRQ, use="complete.obs"),
                           FFMQ=cor(ce$Intercept, ce$FFMQ, use="complete.obs"),
                           Social=cor(ce$Intercept, ce$Social, use="complete.obs"),
                           Purpose=cor(ce$Intercept, ce$Purpose, use="complete.obs"),
                           Barratt=cor(ce$Intercept, ce$Barratt, use="complete.obs"),
                           CSQ=cor(ce$Intercept, ce$CSQ, use="complete.obs"),
                           CFQ=cor(ce$Intercept, ce$CFQ, use="complete.obs"),
                           SWLS=cor(ce$Intercept, ce$SWLS, use="complete.obs")))

OnTask <- as.data.frame(list(Var="OnTask", CSQ1=cor(ce$ThinkingWhat.I.was.doing, ce$CSQ_1, use="complete.obs"),
                             CSQ2=cor(ce$ThinkingWhat.I.was.doing, ce$CSQ_2, use="complete.obs"),
                             PHQAnx=cor(ce$ThinkingWhat.I.was.doing, ce$PHQ12_Anx, use="complete.obs"),
                             PHQDep=cor(ce$ThinkingWhat.I.was.doing, ce$PHQ34_Dep, use="complete.obs"),
                             RRQ=cor(ce$ThinkingWhat.I.was.doing, ce$RRQ, use="complete.obs"),
                             FFMQ=cor(ce$ThinkingWhat.I.was.doing, ce$FFMQ, use="complete.obs"),
                             Social=cor(ce$ThinkingWhat.I.was.doing, ce$Social, use="complete.obs"),
                             Purpose=cor(ce$ThinkingWhat.I.was.doing, ce$Purpose, use="complete.obs"),
                             Barratt=cor(ce$ThinkingWhat.I.was.doing, ce$Barratt, use="complete.obs"),
                             CSQ=cor(ce$ThinkingWhat.I.was.doing, ce$CSQ, use="complete.obs"),
                             CFQ=cor(ce$ThinkingWhat.I.was.doing, ce$CFQ, use="complete.obs"),
                             SWLS=cor(ce$ThinkingWhat.I.was.doing, ce$SWLS, use="complete.obs")))

ST_final <- rbind(Int, OnTask)
write.csv(ST_final, file = "Cor_Matrix_STTrait.csv", row.names = FALSE)