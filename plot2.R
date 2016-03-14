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

## Generating Plot 2

plot(usedata$Global_active_power ~ usedata$Datetime, type = "l", 
     ylab = "Global Active Power (kilowatts)", xlab = "")