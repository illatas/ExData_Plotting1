####Plot  Exploratory Data Analysis Asignment

####Plot  Exploratory Data Analysis Asignment

#### NOTE: Step 1 is in case you need to download the data. 
####       The other steps assume the file "household_power_comsumption.txt" is in the working directory


#1: to get the zip file and unzip the date you need UNCOMMENT THE NEXT TWO LINES
	#download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","temp.zip",mode="wb")
	#unzip("temp.zip")

#2: read colNames
	nombres=names(read.csv("houshold_power_consumption.txt", sep=";",nrows=1))

#3 Find rows for appropiate dates
	FileRows=grep("^[1,2]/2/2007", readLines("household_power_consumption.txt"))

#4 Find number of Rows
	NRows=FileRows[length(FileRows)]-FileRows[1]+1

#5 Set Data Frame
	household <- read.csv("household_power_consumption.txt",na.strings = "?",sep = ";",header = FALSE, col.names = nombres,
     skip =FileRows[1]-1 , nrows=NRows)

#6 Use Date and Time to construct a new vector, plots 2:4

	x<-with(household, paste(Date,Time))
	DataTime = strptime(x,"%d/%m/%Y %H:%M:%S")



#7 Plot 3
png("plot3.png",width=480,height=480)
plot(DataTime,household$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
lines(DataTime,household$Sub_metering_2,col="red")
lines(DataTime,household$Sub_metering_3,col="blue")
legend("topright",lty=1, col=c("black","red","Blue"),legend=names(household)[7:9])
dev.off()

