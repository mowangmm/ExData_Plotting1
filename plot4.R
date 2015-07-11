require(sqldf)
usedata <- read.csv2.sql("household_power_consumption.txt","select * from file where Date = '1/2/2007' or Date = '2/2/2007'")

usedata$DateTime <- strptime(paste(usedata$Date, usedata$Time),"%d/%m/%Y %H:%M:%S")

par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0)) 
with(usedata, {
  plot(x=1:nrow(usedata),y=Global_active_power,type = "l",xaxt = "n",xlab="",ylab = "Global Active Power")
  axis(side = 1,at=c(1,nrow(usedata)/2,nrow(usedata)),labels = c("Thu","Fri","Sat"))
  
  plot(x=1:nrow(usedata),y=Voltage,type = "l",xaxt = "n",xlab="datatime",ylab = "Voltage")
  axis(side = 1,at=c(1,nrow(usedata)/2,nrow(usedata)),labels = c("Thu","Fri","Sat"))
  
  plot(x=1:nrow(usedata),y=usedata$Sub_metering_1,type = "l",xaxt = "n",xlab="",ylab = "Energy sub metering")
  lines(x=1:nrow(usedata),y=usedata$Sub_metering_2,col = "red")
  lines(x=1:nrow(usedata),y=usedata$Sub_metering_3,col = "blue")
  axis(side = 1,at=c(1,nrow(usedata)/2,nrow(usedata)),labels = c("Thu","Fri","Sat"))
  legend("topright", cex = 0.6, bty="n",x.intersp=4, adj=c(0.3,0.6), lty = 1, col = c("black","red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
  
  plot(x=1:nrow(usedata),y=Global_reactive_power,type = "l",xaxt = "n",xlab="datatime",ylab = "Global_reactive_power")
  axis(side = 1,at=c(1,nrow(usedata)/2,nrow(usedata)),labels = c("Thu","Fri","Sat"))
})

dev.copy(png,filename="plot4.png",height=480, width=480,bg="white")
dev.off()