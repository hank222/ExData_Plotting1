#Download data
if(!file.exists("./dataProject")){dir.create("./dataProject")}
fileUrl<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
name_f<-"./dataProject/dataset.zip"
download.file(fileUrl,destfile = name_f,method = "curl")
unzip(zipfile = name_f, exdir = "./dataF")
texto<-read.table("./dataF/household_power_consumption.txt",header = TRUE,sep=";")
subTexto<-texto[texto$Date %in% c("1/2/2007","2/2/2007"),]
gap<-as.numeric(subTexto$Global_active_power)
png("plot1.png", width=480, height=480)
hist(gap,col = "red",main = "Global Active Power",xlab = "Global Active Power (kilowatts)")
dev.off()