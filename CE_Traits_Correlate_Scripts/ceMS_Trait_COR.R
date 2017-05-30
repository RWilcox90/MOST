ce <- read.csv("lmeCE_Trait_Files/ceMS_Traits.csv")

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

MS_final <- rbind(XInt, Self)
write.csv(MS_final, file = "Cor_Matrix_MSTrait.csv", row.names = FALSE)