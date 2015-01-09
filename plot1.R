## plot1
## read data
filepath <- "household_power_consumption.txt"
household <- read.table(filepath, header = TRUE, sep = ";",
                        na.strings = "?", stringsAsFactors = FALSE)
## We will only be using data from the dates 2007-02-01 and 2007-02-02
subdata <- subset(household, Date == "1/2/2007" | Date == "2/2/2007")
gap <- subdata$Global_active_power
hist(gap, main = "Global Active Power", xlab = "Global Active Power (kilowatts)",
     col = "red")
