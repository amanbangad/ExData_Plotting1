data <-
  read.table(
    "household_power_consumption.txt",
    sep = ";",
    header = TRUE,
    na.strings = c("?")
  )
sub_data <- subset(data, Date  %in% c("1/2/2007", "2/2/2007"))
sub_data$Date = as.Date(sub_data$Date, format = "%d/%m/%Y")
sub_data$time <- strptime(sub_data$Time, format = "%H:%M:%S")
png(filename="plot1.png", width = 480, height = 480)
hist(
  sub_data$Global_active_power,
  col = "red",
  xlab = "Global Active Power (kilowatts)",
  main = "Global Active Power"
)
dev.off()