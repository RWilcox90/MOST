library(lme4)
library(dplyr)
dat <- read.csv("InitialProcessing/wmmPSNMTG_clean.csv")

## Negative by Self and Thinking LME model
lmeNST <- lmer(Negative ~ Self + Thinking +(1+Self+Thinking|user_id), data = dat)

## Negative by Self
lmeNS <- lmer(Negative ~ Self + (1+Self|user_id), data = dat)

## Negative by Thinking
lmeNT <- lmer(Negative ~ Thinking + (1+Thinking|user_id), data = dat)

## Self by Thinking
lmeST <- lmer(Self ~ Thinking + (1+Thinking|user_id), data = dat)

## Mood by Self and Thinking
lmeMST <- lmer(Mood ~ Self + Thinking + (1+Self+Thinking|user_id), data = dat)

## Mood by Self
lmeMS <- lmer(Mood ~ Self + (1+Self|user_id), data = dat)

## Mood by Thinking
lmeMT <- lmer(Mood ~ Thinking + (1+Thinking|user_id), data = dat)