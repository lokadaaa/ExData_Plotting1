# Exploratory Data Analysis Assignment 1
# Plot 4 Script
# 
# L Okada 3/14/18

library(data.table)
mainDirectory <- "C:\\Users\\Lauren\\Documents\\Data Science Specialization\\04_Exploratory Data Analysis"
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

# Open png file to plot and format 2x2 plot
png(filename = file.path(outputDirectory,"plot4.png"),
    width = 480, height = 480, units = "px")
par(mfrow=c(2,2))

# Plot 1: Global Active Power time series
plot(dat$DateTime,dat$Global_active_power,type="l",xlab="",ylab="Global Active Power")

# Plot 2: Voltage time series
plot(dat$DateTime, dat$Voltage, type="l", xlab="datetime", ylab = "Voltage")

# Plot 3: Energy sub metering time series
plot(dat$DateTime,dat$Sub_metering_1,type="l",xlab="", ylab="Energy sub metering")
lines(dat$DateTime,dat$Sub_metering_2,col="red")
lines(dat$DateTime,dat$Sub_metering_3,col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=c(1,1,1), col=c("black","red","blue"), bty="n")

# Plot 4: Global Reactive power time series
plot(dat$DateTime,dat$Global_reactive_power,
     xlab="datetime",ylab="Global_reactive_power",type="l")

dev.off() # close png file
