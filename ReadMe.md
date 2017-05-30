## Initial Processing
* First, you’ll start with ‘wmmPSNMTG_clean_create.R’ which will create a file of User ID’s, gender and survey responses of the following variables:
** Positive
** Self
** Negative
** Mood
** Thinking

* Next, you’ll run ‘MakeTrait_Clean.R’ which will create a cleaned up file of User ID’s and new traits calculated from users’ trait questionnaire responses
** PHQ12_Anx
** PHQ34_Dep
** RRQ
** FFMQ
** Barratt
** CSQ
** CFQ
** SWLS
** Social
** Purpose

## Further Analysis
* First, you’ll run LMER_Models.R to create linear mixed effects models
** NOTE: Keep these objects within R environment, they will be used in the ‘ExtractCoEf.R’ script

* Second, you’ll run the ‘ExtractCoEf.R’ script which will extract the estimated x-intercepts and slopes for each of the linear mixed effects models you ran in the previous script
** NOTE: Again do not remove these objects from R environment, they will be used in the ‘Merge_lmeCE_Traits.R’

* Third, you’ll run the ‘Merge_lmeCE_Traits.R’ script which will merge the R objects containing the estimated x-intercepts and slopes for each of the linear mixed effects models and the trait questionnaire you previously created
** This will also write those files into .csv files to be used later in the correlation scripts

## Correlation Scripts
* Each of these scripts will run correlations between the estimated x intercept, estimated slope(s), and trait questionnaires
** They will also write .csv files of the output