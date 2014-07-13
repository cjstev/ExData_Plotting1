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


# Generate Plot1:
png(filename="plot1.png")
par(mfrow=c(1,1),mar=c(5,5,3,2),oma=c(1,1,1,1))

with(hhfeb, {
        hist(Global_active_power,
             xlab="Global Active Power (kilowatts)",
             ylab="Frequency",
             main="Global Active Power",
             col="red"
        )
})

dev.off()
