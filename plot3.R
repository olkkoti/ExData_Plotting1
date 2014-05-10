data <- read.csv("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

data$Date = as.Date(strptime(data$Date, "%d/%m/%Y"))
dates <- data[data$Date %in% as.Date(c("2007-02-01", "2007-02-02")),]

data <- read.csv("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

data$Date = as.Date(strptime(data$Date, "%d/%m/%Y"))
dates <- data[data$Date %in% as.Date(c("2007-02-01", "2007-02-02")),]

png(filename="plot3.png")
timestamps <- strptime(paste(dates$Date, dates$Time), format="%Y-%m-%d %H:%M:%S")
plot(timestamps, 
     dates$Sub_metering_1,
     type="l", 
     xlab="",
     ylab="Global Active Power (kilowatts)")
lines(timestamps, dates$Sub_metering_2, col="red")
lines(timestamps, dates$Sub_metering_3, col="blue")
legend(x="topright", lty=1, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"))
dev.off()
