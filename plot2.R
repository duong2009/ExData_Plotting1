mySql <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
myData <- read.csv.sql("household_power_consumption.txt", sql = mySql, sep =";")

Date1 <- strptime(paste(myData$Date, myData$Time), format='%d/%m/%Y %H:%M:%S')

plot(Date1, myData$Global_active_power, type ="l", xlab = "",
     ylab = "Global Active Power (kilowatts)")

dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()