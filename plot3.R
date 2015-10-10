#Set up the directory
setwd(".../R")
getwd()
datapath<-".../R/household_power_consumption.txt"
#Read the dataset
dataset<-read.table(datapath, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
head(dataset)
#Extract data from 1/2/2007 and 2/2/2007
extract<-dataset[dataset$Date %in% c("1/2/2007","2/2/2007"),]
summary(extract)
#Concatenate date and time
date_time <- strptime(paste(extract$Date, extract$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
#Define the variables of interest
Sub_meter_1 <- as.numeric(extract$Sub_metering_1)
Sub_meter_2 <- as.numeric(extract$Sub_metering_2)
Sub_meter_3 <- as.numeric(extract$Sub_metering_3)
#Create a png file
png("plot3.png", width=480, height=480)
#Make a plot with characteristics specified in the project
plot(date_time,Sub_meter_1,type="l",col="black",xlab="", ylab="Energy sub metering")
lines(date_time,Sub_meter_2,type="l",col="red")
lines(date_time,Sub_meter_3,type="l",col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=1, col=c("black", "red", "blue"))
dev.off()