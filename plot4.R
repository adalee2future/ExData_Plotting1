## read data
filepath <- "household_power_consumption.txt"
household <- read.table(filepath, header = TRUE, sep = ";",
                        na.strings = "?", stringsAsFactors = FALSE)

## We will only be using data from the dates 2007-02-01 and 2007-02-02
subdata <- subset(household, Date == "1/2/2007" | Date == "2/2/2007")

## convert date and time
subdata$DateTime <- paste(subdata$Date, subdata$Time)
subdata$Date <- as.Date(subdata$Date, "%d/%m/%Y")
subdata$DateTime <- strptime(subdata$DateTime, "%d/%m/%Y %H:%M:%S")


datetime <- subdata$DateTime
gap <- subdata$Global_active_power
Global_reactive_power <- subdata$Global_reactive_power
Voltage <- subdata$Voltage
sm1 <- subdata$Sub_metering_1
sm2 <- subdata$Sub_metering_2
sm3 <- subdata$Sub_metering_3

## plot 
png(file = "plot4.png")
par(mfrow = c(2, 2))
## plot 1
plot(datetime, gap, type = "n", xlab = "", ylab = "Global Active Power")
lines(datetime, gap)
## plot 2
plot(datetime, Voltage, type = "n")
lines(datetime, Voltage)
## plot 3
plot(datetime, sm1, type = "n", xlab = "", ylab = "Energy sub metering")
par(new=TRUE)
lines(datetime, sm1, type = "l", col = "black")
lines(datetime, sm2, type = "l", col = "red")
lines(datetime, sm3, type = "l", col = "blue")
legend("topright", lwd = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), bty = "n")

## plot 4
plot(datetime, Global_reactive_power, type = "n")
lines(datetime, Global_reactive_power)

dev.off()

