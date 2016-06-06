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

##overlayed line graph to PNG file
png("plot3.png",width=480,height=480)
plot(x=subPowerConsump$DateTime,y=subPowerConsump$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
lines(x=subPowerConsump$DateTime,y=subPowerConsump$Sub_metering_2,col="red")
lines(x=subPowerConsump$DateTime,y=subPowerConsump$Sub_metering_3,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1,lwd=2,cex=0.8)
dev.off()