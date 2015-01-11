## plot2
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

## Global_active_power
gap <- subdata$Global_active_power
datetime <- subdata$DateTime

## plot
png(filename = "plot2.png")
plot(datetime, gap, type = "n", xlab = "", ylab = "Global Active Power (kilowatts)")
lines(datetime, gap)
dev.off()



