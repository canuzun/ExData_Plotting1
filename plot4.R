setwd("D:/Data Science/Coursera/3 - Exploratory Data Analysis/P1/")
#clean workspace
rm(list=ls())

#load all data
data <- read.csv("household_power_consumption.txt", sep=";", na.strings = "?")

#load libraries
library(data.table)
library(lubridate)

#convert dataframe to data.table, this is not necessary but data.table is a nice package
data = data.table(data)

#lets see our structure
str(data)

#combine date & time
data$DateTime = dmy_hms(paste(data$Date, data$Time))
#cast date column and filter our interval
data$Date = dmy(data$Date)
data = data[data$Date >= dmy("01/02/2007") & data$Date <= dmy("02/02/2007"),]

#plot and save to file
png("plot4.png", width=480, height=480)

par(mfrow = c(2, 2))
#plot 1
plot(x=data$DateTime, y=data$Global_active_power, type="l", ylab = "Global Active Power (kilowatts)", xlab = "")
#plot 2
plot(x=data$DateTime, y=data$Voltage, type="l", ylab = "Global Active Power (kilowatts)", xlab = "")
#plot 3
plot(x=data$DateTime, y=data$Sub_metering_1, type="l", ylab = "Energy sub metering", xlab = "")
lines(x=data$DateTime, y=data$Sub_metering_2, col = "red")
lines(x=data$DateTime, y=data$Sub_metering_3, col = "blue")
legend("topright", lty = 1, col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
#plot 4
plot(x=data$DateTime, y=data$Global_reactive_power, type="l", ylab = "Global Active Power (kilowatts)", xlab = "")

#the graph i saved, has days with my current regional settings, i assume it is OK :)
dev.off()

