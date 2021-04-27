power <- read.csv("household_power_consumption.txt", sep=";", na.strings="?", stringsAsFactors=FALSE)
power$datetime <- paste(power$Date, power$Time)
power$Date <- as.Date(power$Date, "%d/%m/%Y")
power$datetime <- strptime(power$datetime, "%d/%m/%Y %H:%M:%S")
data <- subset(power, Date >= "2007-02-01" & Date <= "2007-02-02")


png(filename = "plot3.png",
    width = 480,
    height = 480)
plot(data$datetime, data$Sub_metering_1, type = "l",
     xlab = "", ylab = "Energy sub metering")
lines(data$datetime, data$Sub_metering_2, col = "red")
lines(data$datetime, data$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), lty = 1)

dev.off()