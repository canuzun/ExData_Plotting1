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

#cast date column and filter our interval
data$Date = dmy(data$Date)
data = data[data$Date >= dmy("01/02/2007") & data$Date <= dmy("02/02/2007"),]

#plot and save to file
hist(data$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.copy(png, file="plot1.png")
dev.off()
