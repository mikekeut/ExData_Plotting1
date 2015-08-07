library(dplyr)
data <- read.table("/Users/MikeKeut/Downloads/household_power_consumption.txt", sep=";", header = T,
                   na.strings = "?")
data$Date <- as.Date(data$Date, format = "%d / %m / %Y")
subset <- filter(data, Date == "2007-02-01" | Date == "2007-02-02")
subset <- mutate(subset, DateTime = as.POSIXct(paste(subset$Date, subset$Time),
                                               format = "%Y-%m-%d %H:%M:%S"))
png(file = "plot4.png")
par(mfrow = c(2,2))

#plot2 - upper left
with(subset, plot(DateTime, Global_active_power, type = "l", xlab = "",
                  ylab = "Global Active Power (kilowatts)"))
#upper right
with(subset, plot(DateTime, Voltage, type = "l", xlab = "datetime",
                  ylab = "Voltage"))

#plot3 - lower left
with(subset, plot(DateTime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering"))
lines(subset$DateTime, subset$Sub_metering_2, col = "red")
lines(subset$DateTime, subset$Sub_metering_3, col = "blue")
legend(x = "topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = 1, col = c("black", "red", "blue"))

#lower right
with(subset, plot(DateTime, Global_reactive_power, type = "l", xlab = "datetime",
                  ylab = "Global_reactive_power"))

dev.off()