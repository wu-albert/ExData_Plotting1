##R Programming course
##https://github.com/wu-albert/ExData_Plotting1/

##read data
powerConsumption<-read.csv("./household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", colClasses=c("character","character","double","double","double","double","double","double","numeric"))
powerConsumption$Date<-as.Date(powerConsumption$Date, format = "%d/%m/%Y")

##subset data
subPowerConsump<-subset(powerConsumption, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

##histogram plot to PNG file
png("plot1.png")
hist(subPowerConsump$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
dev.off()