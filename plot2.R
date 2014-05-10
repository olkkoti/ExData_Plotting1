data <- read.csv("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

data$Date = as.Date(strptime(data$Date, "%d/%m/%Y"))
dates <- data[data$Date %in% as.Date(c("2007-02-01", "2007-02-02")),]

png(filename="plot2.png")
plot(strptime(paste(dates$Date, dates$Time), format="%Y-%m-%d %H:%M:%S"), 
     dates$Global_active_power, 
     type="l", 
     xlab="",
     ylab="Global Active Power (kilowatts)")
dev.off()