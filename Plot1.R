## Plot1.R

data <- read.table("data/exdata_data_household_power_consumption/household_power_consumption.txt", header = FALSE, sep=";", na.strings = "?", skip = 65000, nrows = 6000)
colnames(data) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

data$Date <- as.Date(data$Date, "%d/%m/%Y")
start_date <- as.Date("2007-02-01")
end_date <-as.Date("2007-02-02")

data <- data[(data$Date>=start_date) & (data$Date<=end_date) ,]

png(filename="./ExData_Plotting1/plot1.png", bg="white")

hist(data$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency",
     ylim = c(0,1200), col = "red")

dev.off()

