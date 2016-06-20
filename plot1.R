##set working directoory
setwd("~/blue/")

##read data (downloaded manually this time)
df<-read.table("household_power_consumption.txt",header = T,sep = ";",
               na.strings = c("?",NA))

##make date time of date and time classes as mentioned in the assignment
df$Date_new<-strptime(paste(df$Date,df$Time),"%d/%m/%Y %H:%M:%S")

##take subsets for feb 1 , 2 of 2007
df<-df[(df$Date=="1/2/2007"|df$Date=="2/2/2007"),]

##open graphic device png , save file , close device
png(filename="~/blue/ExData_Plotting1/Plot1.png", 
    width = 480, height = 480, units = "px")
hist(df$Global_active_power,xlab="Global Active Power(kilowatts)",col = "Red",
     main = "Global Active Power")
dev.off()