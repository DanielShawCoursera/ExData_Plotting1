#Read the file 
file <- "household_power_consumption.txt"
head <- read.table(file,header=FALSE,sep=";",nrows=1)
cNames <- character()
for(i in 1:length(head)){ cNames[i] <- as.character(head[[i]]) }

#Transform the format of time
powerData <- read.table(file,header=FALSE,sep=";",col.names=cNames,nrows=2880,skip=66637)
powerData$Date <- as.Date(powerData$Date,"%d/%m/%Y")
time <- paste(powerData$Date,powerData$Time,sep=" ")
time <- as.POSIXlt(time)

#plot the graph
plot(time,powerData$Sub_metering_1,type="l", ylab = "Energy sub metering")
lines(time, powerData$Sub_metering_2, col = "red")
lines(time, powerData$Sub_metering_3, col = "blue")
legend("topright",legend = c("sub_metering_1","sub_metering_2","sub_metering_3"),col = c("black","red","blue"),lty = 1)

# To png
dev.copy(png, file = "plot3.png")
dev.off()