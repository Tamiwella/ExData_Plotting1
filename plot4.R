library(sqldf)
library(lubridate)
DT <- read.csv.sql("./household_power_consumption.txt", "SELECT * from file WHERE Date = '1/2/2007' or Date = '2/2/2007'", sep=";")
## clearing up time
DT$DateTime <- paste(DT$Date, DT$Time)
datetime<- dmy_hms(DT$DateTime)

png("plot4.png", width = 480, height = 480)

## Par
par(mfrow = c(2,2))
## plot1
  # Create numeric vector of Global Active Power
  GAP <- as.numeric(DT$Global_active_power)
  ### Set Plot
  plot(datetime, GAP, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
##plot2
  #Create numeric vector of Voltage
  Voltage <- as.numeric(DT$Voltage)
  # Set Plot
  plot(datetime, Voltage, type = "l")
##plot3
  #Sub metering objects
  Sub1 <- as.numeric(DT$Sub_metering_1)
  Sub2 <- as.numeric(DT$Sub_metering_2)
  Sub3 <- as.numeric(DT$Sub_metering_3)
  # Set Plot
  plot3 <- plot(datetime, Sub1, type = "n", ylab = "Energy sub metering", xlab = "")
  points(datetime, Sub1, type = "l")
  points(datetime, Sub2, type = "l", col = "red")
  points(datetime, Sub3, type = "l", col = "blue")
  legend("topright", legend = c ("Sub_metering_1",  "Sub_metering_2", "Sub_metering_3"), lwd = c(1,1,1),  col = c("black", "red", "blue"))
##plot4
  #Create numeric vector of Global Reactive Power
  GRP <- as.numeric(DT$Global_reactive_power)
  # Set Plot
  plot(datetime, GRP, type = "l", ylab = "Global_reactive_power")
  dev.off()