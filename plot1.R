require(sqldf)
usedata <- read.csv2.sql("household_power_consumption.txt","select * from file where Date = '1/2/2007' or Date = '2/2/2007'")

hist(usedata$Global_active_power,freq=TRUE,col="red",xlab="Global Active Power(kilowatts)",ylab="Frequency",xaxt="n",yaxt="n",main="Global Active Power")
axis(side=2,at=seq(0,1200,200))
axis(side=1,at=NULL)

dev.copy(png,filename="plot1.png",height=480, width=480,bg="white")
dev.off()