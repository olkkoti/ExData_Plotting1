data <- read.csv("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

data$Date = as.Date(strptime(data$Date, "%d/%m/%Y"))
dates <- data[data$Date %in% as.Date(c("2007-02-01", "2007-02-02")),]

png(filename = "plot1.png")
hist(dates$Global_active_power, freq=TRUE, xlab="Global Active Power (kilowatts)", main="Global Active Power", col="red")
dev.off()