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



#Plot 1
png("plot1.png",width=480,height=480)
with(household, hist(Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)"))
dev.off()

