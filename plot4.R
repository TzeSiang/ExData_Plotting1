library(dplyr)

## raw data file not uploaded to github due to big file size 

download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="df.zip")
unzip ("df.zip")

df <- read.csv("household_power_consumption.txt", sep=";", header=TRUE,stringsAsFactors=FALSE,na.strings="?")

df_feb <- filter(df, Date %in% c("1/2/2007","2/2/2007")) 
df_feb$DateTime <- strptime(paste(df_feb$Date, df_feb$Time), "%d/%m/%Y %H:%M:%S")

par(mfcol=c(2,2))

# plot (1,1)
plot(df_feb$DateTime, df_feb$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab=NA)

# plot (2,1)
plot(df_feb$DateTime, df_feb$Sub_metering_1,type="l",ylab="Energy sub metering",xlab=NA,col="black")
lines(df_feb$DateTime, df_feb$Sub_metering_2, col="red")
lines(df_feb$DateTime, df_feb$Sub_metering_3, col="blue")
legend("topright", lty=1, bty="n", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# plot (1,2)
plot(df_feb$DateTime, df_feb$Voltage, type="l", xlab="datetime", ylab="Voltage")

# plot (2, 2)
plot (df_feb$DateTime, df_feb$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

## Export and save PNG file
dev.copy(png, file="plot4.png", height=680, width=680)
dev.off()
