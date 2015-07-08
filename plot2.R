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
plot(x=data$DateTime, y=data$Global_active_power, type="l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.copy(png, file="plot2.png", width = 480, height = 480)
#the graph i saved, has days with my current regional settings, i assume it is OK :)
dev.off()