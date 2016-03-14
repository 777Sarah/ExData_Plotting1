## Getting full dataset

fullData <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";",
                     na.strings = "?", nrows = 2075759, check.names = FALSE, 
                     stringsAsFactors = FALSE, comment.char = "", quote = '\"')

fullData$Date<-as.Date(fullData$Date, format = "%d/%m/%Y")

## Subsetting the data

usedata <- subset(fullData, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(fullData)

## Converting dates

datetime <- paste(as.Date(usedata$Date), usedata$Time)
usedata$Datetime <- as.POSIXct(datetime)

## Generating Plot 4

par(mfrow = c(2,2), mar = c(4,4,1,1))
with(usedata, {
        plot(Global_active_power ~ Datetime, type = "l",
             ylab = "Global Active Power", xlab = "")
        plot(Voltage ~ Datetime, type = "l",
             ylab = "Voltage", xlab = "datetime")
        plot(Sub_metering_1 ~ Datetime, type = "l",
             ylab = "Energy sub metering", xlab = "")
        lines(Sub_metering_2 ~ Datetime, col = "Red")
        lines(Sub_metering_3 ~ Datetime, col = "Blue")
        legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, bty = "n",
               legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        plot(Global_reactive_power ~ Datetime, type = "l",
             ylab = "Global_reactive_power", xlab = "datetime")
})