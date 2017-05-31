ce <- read.csv("lmeCE_Trait_Files/ceMS_Traits.csv")

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

MS_final <- rbind(Int, Self)
write.csv(MS_final, file = "Cor_Matrix_MSTrait.csv", row.names = FALSE)