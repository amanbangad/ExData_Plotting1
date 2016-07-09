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
png(filename="plot2.png", width = 480, height = 480)
with(
  sub_data,
  plot(
    Global_active_power,
    type = "l",
    xaxt = "n",
    ylab = "Global Active Power (kilowatts)",
    xlab = ""
  )
)
axis(1,
     at = seq(0, 2880, 2880 / 2),
     labels = c("Thu", "Fri", "Sat"))
dev.off()