#Set working directy and Load dataset: 
setwd("~/Documents/GitHub/ExData_Plotting1/")
hpc_all<-read.table("household_power_consumption.txt", header = TRUE, sep = ";",
                    dec = ".", fill = TRUE, comment.char = "", na.strings = "?")

#Subset dataframe to the days relevant: 
hpc <- subset(hpc_all, hpc_all$Date== "1/2/2007" | hpc_all$Date =="2/2/2007")

#Creating plot one 
png("plot1.png")
hist(hpc$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power")
dev.off()





