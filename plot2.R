
#Read the data from the file
dc <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

#Add a datetime columns to the data
dc$DateTime <- as.POSIXct(paste(dc$Date, dc$Time), format="%d/%m/%Y %H:%M:%S")

#Retrieve the data rows for 2007/02/01 & 02
dcfeb <- subset(dc, DateTime >= as.POSIXct("2007/02/01") & DateTime < as.POSIXct("2007/02/03"))

#Set the plot device
png(file = "plot2.png")

#Plot the scatter plot: plot2
plot(dcfeb$Global_active_power~dcfeb$DateTime,ylab="Global Active Power (kilowatts)",xlab="",lty=1,lwd=1,type="l")

dev.off()