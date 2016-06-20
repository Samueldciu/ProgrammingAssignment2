##set working directoory
setwd("~/blue/")

##read data 
df<-read.table("household_power_consumption.txt",header = T,sep = ";",
               na.strings = c("?",NA))

##make date time of date and time classes
df$Date_new<-strptime(paste(df$Date,df$Time),"%d/%m/%Y %H:%M:%S")

##take subsets for feb 1 , 2 of 2007
df<-df[(df$Date=="1/2/2007"|df$Date=="2/2/2007"),]

##open graphic device png , save file , close device
png(filename="~/blue/ExData_Plotting1/Plot2.png", 
    width = 480, height = 480, units = "px")
plot(df$Date_new,df$Global_active_power,xlab="",ylab="Global Active Power(kilowatts)",
     type = "l")
dev.off()