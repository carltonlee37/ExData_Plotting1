if(!file.exists("./data")){dir.create("./data")}
fileUrl<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl,destfile="./data/powerconsumption.zip",method="curl")
unzip("./data/powerconsumption.zip",exdir="./data")
power<-read.table("./data/household_power_consumption.txt",header=TRUE,sep=";",skip=66637,nrow=2880)
colnames(power)<-c("Date","Time","GlobalActivePower","GlobalReactivePower","Voltage","GlobalIntensity","Submetering1","Submetering2","Submetering3")
power$datetime<-strptime(paste(power$Date,power$Time),format="%d/%m/%Y %H:%M:%S")
png("plot3.png",width=480,height=480)
with(power,plot(datetime,Submetering1,type="l",xlab="",ylab="Energy sub metering"))
with(power,lines(datetime,Submetering2,type="l",col="red"))
with(power,lines(datetime,Submetering3,type="l",col="blue"))
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,lwd=2,col=c("black","red","blue"))
dev.off()