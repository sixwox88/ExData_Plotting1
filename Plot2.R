## Plot2.R

library(ggplot2)
library(scales)

data <- read.table("data/exdata_data_household_power_consumption/household_power_consumption.txt", header = FALSE, sep=";", na.strings = "?", skip = 65000, nrows = 6000)
colnames(data) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

data$Date <- as.Date(data$Date, "%d/%m/%Y")
start_date <- as.Date("2007-02-01")
end_date <-as.Date("2007-02-02")

data <- data[(data$Date>=start_date) & (data$Date<=end_date) ,]
date_time <- paste(as.character(data$Date), as.character(data$Time))
date_time <- as.POSIXct(strptime(date_time, "%Y-%m-%d %H:%M:%S"), tz = "Asia/Seoul")
data <- cbind(data, date_time)


png(filename="./ExData_Plotting1/plot2.png", bg="white")
with(data, plot(date_time, Global_active_power, type="S", pch = 1, col="black", xlab = "", ylab = "Global Active Power (kilowatts)"))
dev.off()



