power <- read.csv("household_power_consumption.txt", sep=";", na.strings="?", stringsAsFactors=FALSE)
power$datetime <- paste(power$Date, power$Time)
power$Date <- as.Date(power$Date, "%d/%m/%Y")
power$datetime <- strptime(power$datetime, "%d/%m/%Y %H:%M:%S")
data <- subset(power, Date >= "2007-02-01" & Date <= "2007-02-02")


png(filename = "plot2.png",
    width = 480,
    height = 480)
plot(data$datetime, data$Global_active_power, type = "l",
     xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()
