setwd("L:/Health/Epidemiology/Banwarth_Epi/support_HC/other")

data <- read.csv("maxMinTemps.csv")
data <- data[which(data$Year > 2001),]

data$sub30 <- 0
data[which(data$TMIN < 31),"sub30"] <- 1

sub30table <- table(data$Year,data$Month,data$sub30)

sub30 <- sub30table[,,2]

apply(sub30,2,median)

apply(sub30,2,function(x) quantile(x,.75))

apply(sub30,2,function(x) quantile(x,.25))

sub30df <- data.frame("25percentile" = apply(sub30,2,function(x) quantile(x,.25)),
                      "median" = apply(sub30,2,median),
                      "75percentile" = apply(sub30,2,function(x) quantile(x,.75)))

names(sub30df) <- c("25th percentile","Median","75th percentile")
row.names(sub30df) <- format(ISOdate(2004,1:12,1),"%B")

data$over100 <- 0
data[which(data$TMAX > 99),"over100"] <- 1

over100table <- table(data$Year,data$Month,data$over100)

over100 <- over100table[,,2]

apply(over100,2,median)

apply(over100,2,function(x) quantile(x,.75))

apply(over100,2,function(x) quantile(x,.25))

over100df <- data.frame("25percentile" = apply(over100,2,function(x) quantile(x,.25)),
                      "median" = apply(over100,2,median),
                      "75percentile" = apply(over100,2,function(x) quantile(x,.75)))

names(over100df) <- c("25th percentile","Median","75th percentile")
row.names(over100df) <- format(ISOdate(2004,1:12,1),"%B")