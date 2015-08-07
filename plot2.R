library(dplyr)
data <- read.table("/Users/MikeKeut/Downloads/household_power_consumption.txt", sep=";", header = T,
                   na.strings = "?")
data$Date <- as.Date(data$Date, format = "%d / %m / %Y")
subset <- filter(data, Date == "2007-02-01" | Date == "2007-02-02")
subset <- mutate(subset, DateTime = as.POSIXct(paste(subset$Date, subset$Time),
                                               format = "%Y-%m-%d %H:%M:%S"))
png(file = "plot2.png")
with(subset, plot(DateTime, Global_active_power, type = "l", xlab = "",
                  ylab = "Global Active Power (kilowatts)"))
dev.off()