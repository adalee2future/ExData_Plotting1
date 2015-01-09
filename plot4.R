subdata <- subset(household, Date == "1/2/2007" | Date == "2/2/2007")
## convert date and time
subdata$DateTime <- paste(subdata$Date, subdata$Time)
subdata$Date <- as.Date(subdata$Date, "%d/%m/%Y")
subdata$DateTime <- strptime(subdata$DateTime, "%d/%m/%Y %H:%M:%S")


datetime <- subdata$DateTime
Global_reactive_power <- subdata$Global_reactive_power
Voltage <- subdata$Voltage

## 
par(mfrow = c(2, 2))
plot(datetime, Global_reactive_power, type = "n")
lines(datetime, Global_reactive_power)

plot(datetime, Voltage, type = "n")
lines(datetime, Voltage)