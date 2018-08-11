library(sqldf)
library(lubridate)
DT <- read.csv.sql("./household_power_consumption.txt", "SELECT * from file WHERE Date = '1/2/2007' or Date = '2/2/2007'", sep=";")
# Create numeric vector of Global Active Power
GAP <- as.numeric(DT$Global_active_power)
## clearing up time
DT$DateTime <- paste(DT$Date, DT$Time)
Time <- dmy_hms(DT$DateTime)
### Plot
png("plot2.png", width = 480, height = 480)
plot(Time, GAP, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()

