
#Read the data from the file
dc <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

#Add a datetime columns to the data
dc$DateTime <- as.POSIXct(paste(dc$Date, dc$Time), format="%d/%m/%Y %H:%M:%S")

#Retrieve the data rows for 2007/02/01 & 02
dcfeb <- subset(dc, DateTime >= as.POSIXct("2007/02/01") & DateTime < as.POSIXct("2007/02/03"))


#Set the plot device
png(file = "plot3.png")

#Plot the scatter plot: plot3
plot(dcfeb$Sub_metering_1~dcfeb$DateTime,ylab="Energy Sub Metering",xlab="",lty=1,lwd=1,type="l")
lines(dcfeb$Sub_metering_2~dcfeb$DateTime,lty=1,lwd=1,type="l",col="red")
lines(dcfeb$Sub_metering_3~dcfeb$DateTime,lty=1,lwd=1,type="l",col="blue")
legend("topright"
       , legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
       , col=c("black","red","blue")
       , lty=c(1,1,1),cex=0.75)

dev.off()
