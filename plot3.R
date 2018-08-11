library(sqldf)
library(lubridate)
DT <- read.csv.sql("./household_power_consumption.txt", "SELECT * from file WHERE Date = '1/2/2007' or Date = '2/2/2007'", sep=";")
## clearing up date and time
DT$DateTime <- paste(DT$Date, DT$Time)
Time <- dmy_hms(DT$DateTime)
##Sub metering objects
Sub1 <- as.numeric(DT$Sub_metering_1)
Sub2 <- as.numeric(DT$Sub_metering_2)
Sub3 <- as.numeric(DT$Sub_metering_3)
### Plot
png("plot3.png", width = 480, height = 480)
plot3 <- plot(Time, Sub1, type = "n", ylab = "Energy sub metering", xlab =  "")
points(Time, Sub1, type = "l")
points(Time, Sub2, type = "l", col = "red")
points(Time, Sub3, type = "l", col = "blue")
legend("topright", legend = c ("Sub_metering_1",  "Sub_metering_2", "Sub_metering_3"), lwd = c(1,1,1),  col = c("black", "red", "blue"))
dev.off()



