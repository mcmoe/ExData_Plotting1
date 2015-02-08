library(dplyr)
data = tbl_df(read.csv(file = "household_power_consumption.txt", nrow = 69900, sep = ";"))
data = filter(data, Date == "1/2/2007" | Date == "2/2/2007")

activePower = as.numeric(as.character(data$Global_active_power))
activePower = na.omit(activePower)
data_date = as.POSIXct(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")

plot(data_date, activePower, type = "l", xlab="", ylab="Global Active Power (killowatts)")

dev.copy(png, file = "plot2.png")
dev.off()