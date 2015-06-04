#Read the data from the file
dc <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

#Add a datetime columns to the data
dc$DateTime <- as.POSIXct(paste(dc$Date, dc$Time), format="%d/%m/%Y %H:%M:%S")

#Retrieve the data rows for 2007/02/01 & 02
dcfeb <- subset(dc, DateTime >= as.POSIXct("2007/02/01") & DateTime < as.POSIXct("2007/02/03"))

#Set the screen to show four plot
par(mfrow=c(2,2))

#plot(1,1)
plot(dcfeb$Global_active_power~dcfeb$DateTime,ylab="Global Active Power (kilowatts)",xlab="",lty=1,lwd=1,type="l")

#plot(1,2)
plot(dcfeb$Voltage~dcfeb$DateTime,ylab="Voltage",xlab="datetime",lty=1,lwd=1,type="l")

#plot(2,1)
plot(dcfeb$Sub_metering_1~dcfeb$DateTime,ylab="Energy Sub Metering",xlab="",lty=1,lwd=1,type="l")
lines(dcfeb$Sub_metering_2~dcfeb$DateTime,lty=1,lwd=1,type="l",col="red")
lines(dcfeb$Sub_metering_3~dcfeb$DateTime,lty=1,lwd=1,type="l",col="blue")
legend("topright"
       , legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
       , col=c("black","red","blue"),lty=c(1,1,1),bty="n",cex=0.5)

#plot(2,2)
plot(dcfeb$Global_reactive_power~dcfeb$DateTime,ylab="Global_reactive_power",xlab="datetime",lty=1,lwd=1,type="l")

#Export as plot4.png
dev.copy(png, file = "plot4.png")
dev.off()