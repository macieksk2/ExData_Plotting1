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

#Define the variables of interest
GAP <- as.numeric(extract$Global_active_power)
Volt<- as.numeric(extract$Voltage)
Sub_meter_1 <- as.numeric(extract$Sub_metering_1)
Sub_meter_2 <- as.numeric(extract$Sub_metering_2)
Sub_meter_3 <- as.numeric(extract$Sub_metering_3)
GAR <- as.numeric(extract$Global_reactive_power)
#Concatenate date and time
date_time <- strptime(paste(extract$Date, extract$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
#Create a png file
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))
#Make plots with characteristics specified in the project
plot(date_time, GAP, type="l", xlab="", ylab="Global Active Power (kilowatts)")
plot(date_time, Volt, type="l", xlab="datetime", ylab="Voltage")
plot(date_time,Sub_meter_1,type="l",col="black",xlab="", ylab="Energy sub metering")
lines(date_time,Sub_meter_2,type="l",col="red")
lines(date_time,Sub_meter_3,type="l",col="blue")
#No frame in legend
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=1, col=c("black", "red", "blue"), bty = "n")
plot(date_time, GAR, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()
