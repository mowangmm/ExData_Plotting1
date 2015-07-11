require(sqldf)
usedata <- read.csv2.sql("household_power_consumption.txt","select * from file where Date = '1/2/2007' or Date = '2/2/2007'")

usedata$DateTime <- strptime(paste(usedata$Date, usedata$Time),"%d/%m/%Y %H:%M:%S")

plot(x=1:nrow(usedata),y=usedata$Global_active_power,type = "l",xaxt = "n",xlab="",ylab = "Global Active Power(kilowatts)")
axis(side = 1,at=c(1,nrow(usedata)/2,nrow(usedata)),labels = c("Thu","Fri","Sat"))

dev.copy(png,filename="plot2.png",height=480, width=480,bg="white")
dev.off()
