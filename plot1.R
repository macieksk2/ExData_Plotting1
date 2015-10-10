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
#Define the variable of interest
GAP<- as.numeric(extract$Global_active_power)
#Create a png file
png("plot1.png", width=480, height=480)
#Plot a histogram with characteristics specified in the project
hist(GAP, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()