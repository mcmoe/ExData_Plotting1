# PLEASE INSTALL DPLYR LIBRARY TO RUN SCRIPTS!  
# you can do so by running this command once: install.packages("dplyr")

library(dplyr)

par(mfrow = c(1,1))
data = tbl_df(read.csv(file = "household_power_consumption.txt", nrow = 69900, sep = ";"))
data = filter(data, Date == "1/2/2007" | Date == "2/2/2007")

data_date = as.POSIXct(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")

submetering1 = na.omit(as.numeric(as.character(data$Sub_metering_1)))
submetering2 = na.omit(as.numeric(as.character(data$Sub_metering_2)))
submetering3 = na.omit(as.numeric(as.character(data$Sub_metering_3)))

plot(data_date, submetering1, type = "l", xlab="", ylab="Energy sub metering")
lines(data_date, submetering2, col="red")
lines(data_date, submetering3, col="blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1), col=c("black","red", "blue"))

dev.copy(png, file = "plot3.png")
dev.off()