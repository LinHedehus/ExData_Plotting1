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

#Creating plot 2
png("plot2.png")
plot(x = hpc$DateTime, y = hpc$Global_active_power, type = "l", xlab = "", ylab ="Global Active Power (kilowatts)")
dev.off()