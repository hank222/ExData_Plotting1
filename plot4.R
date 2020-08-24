texto<-read.table("./dataF/household_power_consumption.txt",header = TRUE,sep=";")
subTexto<-texto[texto$Date %in% c("1/2/2007","2/2/2007"),]
fecha<-paste(sep=" ",subTexto$Date,subTexto$Time)
fecha<-strptime(fecha,"%d/%m/%Y %H:%M:%S")
voltage<-subTexto$Voltage
gap<-subTexto$Global_active_power
grp<-subTexto$Global_reactive_power
submet1<-subTexto$Sub_metering_1
submet2<-subTexto$Sub_metering_2
submet3<-subTexto$Sub_metering_3
submet1<-as.numeric(submet1)
submet2<-as.numeric(submet2)
submet3<-as.numeric(submet3)
voltage<-as.numeric(voltage)
gap<-as.numeric(gap)
grp<-as.numeric(grp)

png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))
plot(fecha,gap,type = "l",xlab ="",ylab = "Global Active Power (kilowatts)" )
plot(fecha,voltage,type = "l",xlab="datetime",ylab = "Voltage" )

plot(fecha,submet1,type = "l",xlab ="",ylab = "Global Active Power (kilowatts)" )
lines(fecha,submet2,type = "l",col="red")
lines(fecha,submet3,type = "l",col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1, lwd=2.5, col=c("black", "red", "blue"))
plot(fecha,grp,type = "l",xlab="Global_reactive_power",ylab = "Voltage" )
dev.off()