#Set working directy and Load dataset: 
setwd("~/Documents/GitHub/ExData_Plotting1/")
hpc_all<-read.table("household_power_consumption.txt", header = TRUE, sep = ";",
                    dec = ".", fill = TRUE, comment.char = "", na.strings = "?")

#Subset dataframe to the days relevant: 
hpc <- subset(hpc_all, hpc_all$Date== "1/2/2007" | hpc_all$Date =="2/2/2007")

#create a variable called "DateTime"
hpc$DateTime <- strptime(paste(hpc$Date, hpc$Time), format="%d/%m/%Y %H:%M:%S")

#load package "lubridate" 
install.packages("lubridate")
library(lubridate)
#create a string variable to get the day of the week:
wday(hpc$DateTime, label=TRUE)
summary(wday(hpc$DateTime, label=TRUE))

#Creating plot 3 
png("plot3.png")
plot(x = hpc$DateTime, y = hpc$Sub_metering_1, type = "n", xlab = "", ylab ="Energy sub metering")
points(x = hpc$DateTime, y = hpc$Sub_metering_1, type = "l", col = "black")
points(x = hpc$DateTime, y = hpc$Sub_metering_2, type = "l", col = "red")
points(x = hpc$DateTime, y = hpc$Sub_metering_3, type = "l", col = "blue")
legend("topright", lty = c(1,1,1), col = c("black", "red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()

