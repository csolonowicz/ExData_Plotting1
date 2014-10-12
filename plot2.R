
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

## plot GAP vs. date time:
png("plot2.png")
plot(power$date.time, power$Global_active_power, type="l", 
     xlab="", ylab="Global Active Power (kilowatts)")

dev.off()