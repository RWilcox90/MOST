wmm <- read.csv("MOST/WMM_Step3_02222015.csv", header=TRUE)
wmm <- wmm[,c(1,10,11,25), drop=FALSE]
good <- complete.cases(wmm)
wmm <- wmm[good,,drop=FALSE]

tsplit <- separate(wmm, col=X3_Time, into=c("Time_1","Time_2","Time_3","Time_4","Time_5","Time_6","Time_7","Time_8","Time_9","Time_10","Time_11","Time_12","Time_13","Time_14","Time_15","Time_16"), sep="@")
##This parses the info based on a given character into new columns whose names you specify

for (i in 1:17146) {
  if ("A timeless topic (not relating to the past, present, or future)" %in% tsplit[i,4:19]) {
    tsplit$Timeless[i] <- 1
  } else {
    tsplit$Timeless[i] <- 0
  }
}
##This runs an if else statment through each row taking into account each column and sees
##if there is a text string in there, if there is then it places a 1 within the new
##column or if there isn't places a 0.  This assumes that each text string (the answers
##to 3_time) will only be present in one of the columns within each row

for (i in 1:17146) {
  if ("The past (more than 3 years ago)" %in% tsplit[i,4:19]) {
    tsplit$Past.More.3.Years[i] <- 1
  } else {
    tsplit$Past.More.3.Years[i] <- 0
  }
}

for (i in 1:17146) {
  if ("The past (between 1-3 years ago)" %in% tsplit[i,4:19]) {
    tsplit$Past.Between.1.3.Years[i] <- 1
  } else {
    tsplit$Past.Between.1.3.Years[i] <- 0
  }
}

for (i in 1:17146) {
  if ("The past (between 1-12 months ago)" %in% tsplit[i,4:19]) {
    tsplit$Past.Between.1.12.Months[i] <- 1
  } else {
    tsplit$Past.Between.1.12.Months[i] <- 0
  }
}

for (i in 1:17146) {
  if ("The past (between 1-4 weeks ago)" %in% tsplit[i,4:19]) {
    tsplit$Past.Between.1.4.Weeks[i] <- 1
  } else {
    tsplit$Past.Between.1.4.Weeks[i] <- 0
  }
}

for (i in 1:17146) {
  if ("The past (between 1-7 days ago)" %in% tsplit[i,4:19]) {
    tsplit$Past.Between.1.7.Days[i] <- 1
  } else {
    tsplit$Past.Between.1.7.Days[i] <- 0
  }
}

for (i in 1:17146) {
  if ("The past (yesterday)" %in% tsplit[i,4:19]) {
    tsplit$Past.Yesterday[i] <- 1
  } else {
    tsplit$Past.Yesterday[i] <- 0
  }
}

for (i in 1:17146) {
  if ("The past (earlier today)" %in% tsplit[i,4:19]) {
    tsplit$Past.Earlier.Today[i] <- 1
  } else {
    tsplit$Past.Earlier.Today[i] <- 0
  }
}

for (i in 1:17146) {
  if ("The present (within the current 5 minutes)" %in% tsplit[i,4:19]) {
    tsplit$Present.5.Minutes[i] <- 1
  } else {
    tsplit$Present.5.Minutes[i] <- 0
  }
}

for (i in 1:17146) {
  if ("The future (later today)" %in% tsplit[i,4:19]) {
    tsplit$Future.Later.Today[i] <- 1
  } else {
    tsplit$Future.Later.Today[i] <- 0
  }
}

for (i in 1:17146) {
  if ("The future (tomorrow)" %in% tsplit[i,4:19]) {
    tsplit$Future.Tomorrow[i] <- 1
  } else {
    tsplit$Future.Tomorrow[i] <- 0
  }
}

for (i in 1:17146) {
  if ("The future (between 1-7 days from now)" %in% tsplit[i,4:19]) {
    tsplit$Future.Between.1.7.Days[i] <- 1
  } else {
    tsplit$Future.Between.1.7.Days[i] <- 0
  }
}

for (i in 1:17146) {
  if ("The future (between 1-4 weeks from now)" %in% tsplit[i,4:19]) {
    tsplit$Future.Between.1.4.Weeks[i] <- 1
  } else {
    tsplit$Future.Between.1.4.Weeks[i] <- 0
  }
}

for (i in 1:17146) {
  if ("The future (between 1-12 months from now)" %in% tsplit[i,4:19]) {
    tsplit$Future.Between.1.12.Months[i] <- 1
  } else {
    tsplit$Future.Between.1.12.Months[i] <- 0
  }
}

for (i in 1:17146) {
  if ("The future (between 1-3 years from now)" %in% tsplit[i,4:19]) {
    tsplit$Future.Between.1.3.Years[i] <- 1
  } else {
    tsplit$Future.Between.1.3.Years[i] <- 0
  }
}

for (i in 1:17146) {
  if ("The future (more than 3 years from now)" %in% tsplit[i,4:19]) {
    tsplit$Future.More.3.Years[i] <- 1
  } else {
    tsplit$Future.More.3.Years[i] <- 0
  }
}

final <- tsplit[,-c(3:19),drop=FALSE]