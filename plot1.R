
## Set working dir to data file location
setwd("C:/Users/Admin/Dropbox/My/Coursera/exdata-007/Assignment1/ExData_Plotting1")

# Read data into a table 
power <- read.table("household_power_consumption.txt", sep=";", header=T, na.strings="?", colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))


# Convert date and time
power$Date <- dmy(power$Date)
power$Time <- hms(power$Time)

# Reduce data frame to range we need
power <- subset(power, year(Date) == 2007 & 
                     month(Date) == 2 &
                     (day(Date) == 1 | day(Date) == 2))

## plot histogram of Global Active Power
png("plot1.png")
hist(power$Global_active_power, breaks=12, col="red",
     main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")

dev.off()
