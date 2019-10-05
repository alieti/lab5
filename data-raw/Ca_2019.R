## code to prepare `DATASET` dataset goes here
data5 <- read.csv2("Ca_2019.csv", sep = ",")


gooddays <- as.numeric(data5$Good)
moderatedays <- as.numeric(data5$Moderate)
unhealthy <- data.frame(SomewhatUnhealthy = data5$Unhealthy.for.Sensitive.Groups,
                        Unhealthy = data5$Unhealthy,
                        VeryUnhealthy = data5$Very.Unhealthy,
                        stringsAsFactors = FALSE)

unhealthy <- sapply(unhealthy, as.numeric)
nothealthy <- rowSums(unhealthy)
latit <- as.numeric(format((data5$latitude)))
longi <-  -1*as.numeric(format((data5$longitude)))

Ca_2019 <- data.frame(longi = longi, latit = latit,
                       GoodDays = gooddays,
                       ModerateDays = moderatedays,
                       UnhealthyDays = nothealthy)

usethis::use_data(Ca_2019, overwrite = TRUE)
