####Plot  Exploratory Data Analysis Asignment



#1: get the zip file and unzip
	unzip("exdata-data-household_power_consumption.zip",list=FALSE)

#2: read colNames
	nombres=names(read.csv("bas.txt", sep=";",nrows=1))

#3 Find rows for appropiate dates
	FileRows=grep("^[1,2]/2/2007", readLines("household_power_consumption.txt"))

#4 Find number of Rows
	NRows=FileRows[length(FileRows)]-FileRows[1]+1

#Set Data Frame
	household <- read.csv("household_power_consumption.txt",na.strings = "?",sep = ";",header = FALSE, col.names = nombres,
     skip =FileRows[1]-1 , nrows=NRows)

# Use Date and Time to construct a new vector, plots 2:4

	x<-with(household, paste(Date,Time))
	DataTime = strptime(x,"%d/%m/%Y %H:%M:%S")





#Plot 4
png("plot4.png",width=480,height=480)
par(mfcol=c(2,2))
# Top Left
plot(DataTime,household$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
#Bottom Left
plot(DataTime,household$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
lines(DataTime,household$Sub_metering_2,col="red")
lines(DataTime,household$Sub_metering_3,col="blue")
legend("topright",lty=1, col=c("black","red","Blue"),legend=names(household)[7:9],bty="n")
#Top Right
plot(DataTime,household$Voltage,type="l",xlab="datetime",ylab="Voltage")
#Bottom Right
plot(DataTime,household$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")
dev.off()
