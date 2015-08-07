library(dplyr)
data <- read.table("/Users/MikeKeut/Downloads/household_power_consumption.txt", sep=";", header = T,
                   na.strings = "?")
data$Date <- as.Date(data$Date, format = "%d / %m / %Y")
subset <- filter(data, Date == "2007-02-01" | Date == "2007-02-02")
png(file = "plot1.png")
hist(subset$Global_active_power, col = "red", main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")
dev.off()