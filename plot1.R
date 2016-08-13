# course 4 week 1 project plot 1

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

# generate plot 1
par(mar=c(5,5,2,1))
hist(electricdata$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")



