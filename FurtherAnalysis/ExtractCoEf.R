## Use the LMER objects created from the 'LMER_Models.R' script to
## extract coefficients of estimated intercept and slope by subject
ceNST <- data.frame(coef(lmeNST)[[1]])
ceNS <- data.frame(coef(lmeNS)[[1]])
ceNT <- data.frame(coef(lmeNT)[[1]])
ceST <- data.frame(coef(lmeST)[[1]])
ceMST <- data.frame(coef(lmeMST)[[1]])
ceMS <- data.frame(coef(lmeMS)[[1]])
ceMT <- data.frame(coef(lmeMT)[[1]])


## You need to then set the rown names as the values for a new column as these are the user_id values
ceNST <- cbind(user_id=rownames(ceNST),ceNST)
ceNS <- cbind(user_id=rownames(ceNS),ceNS)
ceNT <- cbind(user_id=rownames(ceNT),ceNT)
ceST <- cbind(user_id=rownames(ceST),ceST)
ceMST <- cbind(user_id=rownames(ceMST),ceMST)
ceMS <- cbind(user_id=rownames(ceMS),ceMS)
ceMT <- cbind(user_id=rownames(ceMT),ceMT)

## You can then optionally remove rownames if you want
rownames(ceNST) <- c()
rownames(ceNS) <- c()
rownames(ceNT) <- c()
rownames(ceST) <- c()
rownames(ceMST) <- c()
rownames(ceMS) <- c()
rownames(ceMT) <- c()
