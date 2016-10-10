#Read the file 
file <- "household_power_consumption.txt"
head <- read.table(file,header=FALSE,sep=";",nrows=1)
cNames <- character()
for(i in 1:length(head)){ cNames[i] <- as.character(head[[i]]) }
powerData <- read.table(file,header=FALSE,sep=";",col.names=cNames,nrows=2880,skip=66637)

#plot the graph
hist(powerData$Global_active_power,col = "orangered",main = "Global Active Power",xlab = "Global Active Power(kilowatts)")

# To png
dev.copy(png, file = "plot1.png")
dev.off()
