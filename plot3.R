subdata <- subset(household, Date == "1/2/2007" | Date == "2/2/2007")
## convert date and time
subdata$DateTime <- paste(subdata$Date, subdata$Time)
subdata$Date <- as.Date(subdata$Date, "%d/%m/%Y")
subdata$DateTime <- strptime(subdata$DateTime, "%d/%m/%Y %H:%M:%S")


datetime <- subdata$DateTime
sm1 <- subdata$Sub_metering_1
sm2 <- subdata$Sub_metering_2
sm3 <- subdata$Sub_metering_3
plot(datetime, sm3, type = "n")
lines(datetime, sm3)

