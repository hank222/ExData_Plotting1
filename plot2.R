texto<-read.table("./dataF/household_power_consumption.txt",header = TRUE,sep=";")
subTexto<-texto[texto$Date %in% c("1/2/2007","2/2/2007"),]
gap<-as.numeric(subTexto$Global_active_power)
fecha<-paste(sep=" ",subTexto$Date,subTexto$Time)
fecha<-strptime(fecha,"%d/%m/%Y %H:%M:%S")
png("plot2.png", width=480, height=480)
plot(fecha,gap,type = "l",xlab ="",ylab = "Global Active Power (kilowatts)" )
dev.off()