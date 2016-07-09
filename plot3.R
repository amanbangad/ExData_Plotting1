data <-
  read.table(
    "household_power_consumption.txt",
    sep = ";",
    header = TRUE,
    na.strings = c("?")
  )
sub_data <- subset(data, Date  %in% c("1/2/2007", "2/2/2007"))
sub_data$Date = as.Date(sub_data$Date, format = "%d/%m/%Y")
sub_dahistta$time <- strptime(sub_data$Time, format = "%H:%M:%S")
png(filename="plot3.png", width = 480, height = 480)
with(
  sub_data,
  plot(
    Sub_metering_1,
    type = "l",
    xaxt = "n",
    ylab = "Energy sub metering",
    xlab = ""
  )
)
lines(sub_data$Sub_metering_2, col = "orange")
lines(sub_data$Sub_metering_3, col = "blue")
axis(1,
     at = seq(0, 2880, 2880 / 2),
     labels = c("Thu", "Fri", "Sat"))
legend(
  "topright",
  legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
  lty = 1,
  col = c("black", "orange", "blue")
)
dev.off()