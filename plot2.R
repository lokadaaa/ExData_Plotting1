# Exploratory Data Analysis Assignment 1
# Plot 2 Script
# 
# L Okada 3/14/18

library(data.table)
mainDirectory <- "C:\\Users\\Lauren\\Documents\\Data Science Specialization\\04_Exploratory Data Analysis\\"
outputDirectory <- file.path(mainDirectory,"ExData_Plotting1")

# Read in data file 
filename <- file.path(mainDirectory,"household_power_consumption.txt")
allDat <- fread(filename,header=T,sep=";",na.strings="?",stringsAsFactors = F)

# Format date and select data for 2/1/07 and 2/2/07 only
allDat$Date <- as.Date(allDat$Date,format="%d/%m/%Y")
iMyDates <- which(allDat$Date=="2007-02-01" |allDat$Date=="2007-02-02")
dat <- allDat[iMyDates,]

# Format time
dat$DateTime <- paste(dat$Date,dat$Time,sep=" ")
formatDateTime <- as.POSIXct(strptime(dat$DateTime,format="%Y-%m-%d %H:%M:%S"))
dat$DateTime <- formatDateTime

# Plot time series of Global Active Power to png file
png(filename = file.path(outputDirectory,"plot2.png"),
    width = 480, height = 480, units = "px")
plot(dat$DateTime,dat$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.off()
