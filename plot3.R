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
png(filename="~/blue/ExData_Plotting1/Plot3.png", 
    width = 480, height = 480, units = "px")
plot(df$Date_new,df$Sub_metering_1,xlab="",ylab="Energy sub metering",
     type = "l",col='Black')
points(df$Date_new,df$Sub_metering_2,type = "l",col = 'Red')
points(df$Date_new,df$Sub_metering_3,type = "l",col = 'Blue')
legend("topright",lty = "solid",col=c("Black","Red","Blue"),
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()