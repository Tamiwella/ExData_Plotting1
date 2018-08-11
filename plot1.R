library(sqldf)
#Importing data
DT <- read.csv.sql("./household_power_consumption.txt", "SELECT * from file WHERE Date = '1/2/2007' or Date = '2/2/2007'", sep=";")
##clearing up dates
Dates <- as.Date(DT$Date, "%d/%m/%Y")
DT$Date <- Dates
# Create numeric vector of Global Active Power
hist1 <- as.numeric(DT$Global_active_power)
## check for NAs
NAsHist1 <- is.na(hist1)
table(NAsHist1)
#Create plot 1
png("plot1.png", width = 480, height = 480)
hist(hist1, col = "red", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power")
dev.off()

