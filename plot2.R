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

##line graph to PNG file
png("plot2.png",width=480,height=480)
plot(x=subPowerConsump$DateTime, y=subPowerConsump$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")
dev.off()