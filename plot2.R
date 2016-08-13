# course 4 week 1 project plot 2

# read in the first 1000 rows and calculate a rough estimate of memory the dataset will require
electricdata <- read.table (file = "household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?", nrows = 1000)
size <- object.size(electricdata)
print (size * 2075259 / 1000, units = "Gb")

# read in the full dataset
electricdata <- read.table (file = "household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
str(electricdata)

# convert the Date variable using as.Date() function
class("Date")
electricdata$Date <- as.Date(electricdata$Date, format = "%d/%m/%Y")

# subset the data from the dates 2007-02-01 and 2007-02-02
electricdata <- subset(electricdata, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

# converting the dates and time
datetime <- paste(as.Date(electricdata$Date), electricdata$Time)
electricdata$datetime <- as.POSIXct(datetime)

# generate plot 2
plot (electricdata$Global_active_power ~ electricdata$datetime, type = "l",
      ylab = "Global Active Power (kilowatts)", xlab = "")
