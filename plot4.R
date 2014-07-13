setwd("c:/classes/exploratory analysis/Project1")
#Downloand and Unzip File
if(!file.exists("./proj1")){dir.create("./proj1")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl,destfile="./proj1/data1.zip")
unzip("./proj1/data1.zip", exdir = "./data1")

#Read and Format File
hhpower<-read.csv2("./data1/household_power_consumption.txt")
hhpower$Date<-as.Date(hhpower$Date, "%d/%m/%Y")
hhfeb<-hhpower[hhpower$Date=="2007-02-01"|hhpower$Date=="2007-02-02",]
a<-paste(hhfeb$Date,hhfeb$Time,sep=" ")
hhfeb$Time<-strptime(a,format="%Y-%m-%d %H:%M:%S")
hhfeb$Global_active_power<-as.numeric(as.character(hhfeb$Global_active_power))
hhfeb$Voltage<-as.numeric(as.character(hhfeb$Voltage))
hhfeb$Global_reactive_power<-as.numeric(as.character(hhfeb$Global_reactive_power))
hhfeb$Global_intensity<-as.numeric(as.character(hhfeb$Global_intensity))
hhfeb$Sub_metering_1<-as.numeric(as.character(hhfeb$Sub_metering_1))
hhfeb$Sub_metering_2<-as.numeric(as.character(hhfeb$Sub_metering_2))
hhfeb$Sub_metering_3<-as.numeric(as.character(hhfeb$Sub_metering_3))

# Generate Plot4:
png(filename="plot4.png")
par(mfrow=c(2,2),mar=c(5,5,3,1),oma=c(1,1,1,1))

#1
with(hhfeb, {
        plot(Time,Global_active_power,
             type="l",
             xlab="",
             ylab="Global Active Power" 
        )
})

#2
with(hhfeb, {
        plot(Time,Voltage,
             type="l",
             xlab="datetime",
             ylab="Voltage" 
        )
})


#3
with(hhfeb, {
        plot(Time,Sub_metering_1,
             type="l",
             xlab="",
             ylab="Energy sub metering" 
        )
        points(Time,Sub_metering_2,
               type="l",
               xlab="",
               ylab="",
               col="red"
        )
        points(Time,Sub_metering_3,
               type="l",
               xlab="",
               ylab="",
               col="blue"
        )
        legend("topright",col=c("black","blue","red"),lwd=2,cex=.5,
               legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
})


#4
with(hhfeb, {
        plot(Time,Global_reactive_power,
             type="l",
             xlab="datetime",
             ylab="Global_reactive_power" 
        )
})

dev.off()
