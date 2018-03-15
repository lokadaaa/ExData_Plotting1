# Exploratory Data Analysis Assignment 1
# Plot 1 Script
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

# Plot Histogram of Global Active Power to png file
png(filename = file.path(outputDirectory,"plot1.png"),
    width = 480, height = 480, units = "px")
hist(dat$Global_active_power,breaks = seq(0,8,by=0.5),
     xlab="Global Active Power (kilowatts)",main="Global Active Power",
     col="red",xaxt="n")
axis(side=1,at=seq(0,6,by=2))
dev.off()
