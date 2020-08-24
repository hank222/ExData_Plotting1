texto<-read.table("./dataF/household_power_consumption.txt",header = TRUE,sep=";")
subTexto<-texto[texto$Date %in% c("1/2/2007","2/2/2007"),]
fecha<-paste(sep=" ",subTexto$Date,subTexto$Time)
fecha<-strptime(fecha,"%d/%m/%Y %H:%M:%S")
submet1<-subTexto$Sub_metering_1
submet2<-subTexto$Sub_metering_2
submet3<-subTexto$Sub_metering_3
submet1<-as.numeric(submet1)
submet2<-as.numeric(submet2)
submet3<-as.numeric(submet3)
png("plot3.png", width=480, height=480)
plot(fecha,submet1,type = "l",xlab ="",ylab = "Global Active Power (kilowatts)" )
lines(fecha,submet2,type = "l",col="red")
lines(fecha,submet3,type = "l",col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()