library(dplyr)
data = tbl_df(read.csv(file = "household_power_consumption.txt", nrow = 69900, sep = ";"))
data = filter(data, Date == "1/2/2007" | Date == "2/2/2007")
activePower = as.numeric(as.character(data$Global_active_power))
activePower = na.omit(activePower)

hist(activePower, col = "red", main = "Global Active Power", xlab = "Global Active Power (killowatts)")
