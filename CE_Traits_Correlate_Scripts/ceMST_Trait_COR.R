ce <- read.csv("lmeCE_Trait_Files/ceMST_Traits.csv")

XInt <- as.data.frame(list(Var="XInt", CSQ1=cor(ce$X.Intercept., ce$CSQ_1, use="complete.obs"),
                           CSQ2=cor(ce$X.Intercept., ce$CSQ_2, use="complete.obs"),
                           PHQAnx=cor(ce$X.Intercept., ce$PHQ12_Anx, use="complete.obs"),
                           PHQDep=cor(ce$X.Intercept., ce$PHQ34_Dep, use="complete.obs"),
                           RRQ=cor(ce$X.Intercept., ce$RRQ, use="complete.obs"),
                           FFMQ=cor(ce$X.Intercept., ce$FFMQ, use="complete.obs"),
                           Social=cor(ce$X.Intercept., ce$Social, use="complete.obs"),
                           Purpose=cor(ce$X.Intercept., ce$Purpose, use="complete.obs"),
                           Barratt=cor(ce$X.Intercept., ce$Barratt, use="complete.obs"),
                           CSQ=cor(ce$X.Intercept., ce$CSQ, use="complete.obs"),
                           CFQ=cor(ce$X.Intercept., ce$CFQ, use="complete.obs"),
                           SWLS=cor(ce$X.Intercept., ce$SWLS, use="complete.obs")))

Self <- as.data.frame(list(Var="Self", CSQ1=cor(ce$Self, ce$CSQ_1, use="complete.obs"),
                           CSQ2=cor(ce$Self, ce$CSQ_2, use="complete.obs"),
                           PHQAnx=cor(ce$Self, ce$PHQ12_Anx, use="complete.obs"),
                           PHQDep=cor(ce$Self, ce$PHQ34_Dep, use="complete.obs"),
                           RRQ=cor(ce$Self, ce$RRQ, use="complete.obs"),
                           FFMQ=cor(ce$Self, ce$FFMQ, use="complete.obs"),
                           Social=cor(ce$Self, ce$Social, use="complete.obs"),
                           Purpose=cor(ce$Self, ce$Purpose, use="complete.obs"),
                           Barratt=cor(ce$Self, ce$Barratt, use="complete.obs"),
                           CSQ=cor(ce$Self, ce$CSQ, use="complete.obs"),
                           CFQ=cor(ce$Self, ce$CFQ, use="complete.obs"),
                           SWLS=cor(ce$Self, ce$SWLS, use="complete.obs")))

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

MST_final <- rbind(XInt, Self, OnTask)
write.csv(MST_final, file = "Cor_Matrix_MSTTrait.csv", row.names = FALSE)