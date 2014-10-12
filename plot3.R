
## Set working dir to data file location
setwd("C:/Users/Admin/Dropbox/My/Coursera/exdata-007/Assignment1/ExData_Plotting1")

# Read data into a table 
power <- read.table("household_power_consumption.txt", sep=";", header=T, na.strings="?", colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

# Convert date and time

power$Date <- dmy(power$Date)
power$Time <- hms(power$Time)

# Reduce data frame to what we need
power <- subset(power, year(Date) == 2007 & 
                  month(Date) == 2 &
                  (day(Date) == 1 | day(Date) == 2))

# inser date and time
power$date.time <- power$Date + power$Time

# plot 3 submeterings vs. time in color
png("plot3.png")

plot(power$date.time, power$Sub_metering_1, type="l", 
     xlab="", ylab="Energy sub metering")

lines(power$date.time, power$Sub_metering_1, col="black")
lines(power$date.time, power$Sub_metering_2, col="red")
lines(power$date.time, power$Sub_metering_3, col="blue")

legend("topright", lwd=1, 
       col=c("black", "red", "blue"), 
       legend=c("Sub metering 1", "Sub metering 2", "Sub metering 3"))

dev.off()
