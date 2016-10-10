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
plot(time,powerData$Global_active_power,type="l",ylab = "Global Active Power(kilowatts)")

# To png
dev.copy(png, file = "plot2.png")
dev.off()