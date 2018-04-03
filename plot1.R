if(!file.exists("./data")){dir.create("./data")}
fileUrl<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl,destfile="./data/powerconsumption.zip",method="curl")
unzip("./data/powerconsumption.zip",exdir="./data")
power<-read.table("./data/household_power_consumption.txt",header=TRUE,sep=";",skip=66637,nrow=2880)
colnames(power)<-c("Date","Time","GlobalActivePower","GlobalReactivePower","Voltage","GlobalIntensity","Submetering1","Submetering2","Submetering3")
hist(power$GlobalActivePower,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)",ylab="Frequency")
dev.copy(png,file="plot1.png")
dev.off()
