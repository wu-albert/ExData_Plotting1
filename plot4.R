##R Programming course
##https://github.com/wu-albert/ExData_Plotting1/

##read data
powerConsumption<-read.csv("./household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", colClasses=c("character","character","double","double","double","double","double","double","numeric"))
powerConsumption$Date<-as.Date(powerConsumption$Date, format = "%d/%m/%Y")

##subset data
subPowerConsump<-subset(powerConsumption, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

##combine date and time as POXIXlt
subPowerConsump$DateTime<-paste(subPowerConsump$Date, subPowerConsump$Time)
subPowerConsump$DateTime<-as.POSIXlt(subPowerConsump$DateTime, format="%Y-%m-%d %H:%M:%S")

##matrix of graphs to PNG file
png("plot4.png",width=480,height=480)
par(mfrow=c(2,2))

##Graph 1 - Global Active Power
plot(x=subPowerConsump$DateTime, y=subPowerConsump$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")

##Graph 2 - Voltage
plot(x=subPowerConsump$DateTime, y=subPowerConsump$Voltage,type="l",ylab="Voltage",xlab="")

##Graph 3 - Sub Metering
plot(x=subPowerConsump$DateTime,y=subPowerConsump$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
lines(x=subPowerConsump$DateTime,y=subPowerConsump$Sub_metering_2,col="red")
lines(x=subPowerConsump$DateTime,y=subPowerConsump$Sub_metering_3,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),bty='n',lty=1,lwd=2,cex=0.6)

##Graph 4 - Global Reactive Power
plot(x=subPowerConsump$DateTime,y=subPowerConsump$Global_reactive_power,type="l",ylab="Global Reactive Power",xlab="")

dev.off()