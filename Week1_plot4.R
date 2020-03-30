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

#Creating plot 4
png("plot4.png")
par(mfrow = c(2,2))
plot(x = hpc$DateTime, y = hpc$Global_active_power, type = "l", col = "black", xlab = "", ylab = "Global Active Power")
plot(x = hpc$DateTime, y = hpc$Voltage, type = "l", col = "black", xlab = "datetime", ylab = "Voltage")

plot(x = hpc$DateTime, y = hpc$Sub_metering_1, type = "n", xlab = "", ylab ="Energy sub metering")
points(x = hpc$DateTime, y = hpc$Sub_metering_1, type = "l", col = "black")
points(x = hpc$DateTime, y = hpc$Sub_metering_2, type = "l", col = "red")
points(x = hpc$DateTime, y = hpc$Sub_metering_3, type = "l", col = "blue")
legend("topright", lty = c(1,1,1), col = c("black", "red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

plot(x = hpc$DateTime, y = hpc$Global_reactive_power, type = "l", col = "black", xlab = "datetime", ylab = "Global_reactive_power")
dev.off()