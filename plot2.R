library(dplyr)

## raw data file not uploaded to github due to big file size 

download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="df.zip")
unzip ("df.zip")

df <- read.csv("household_power_consumption.txt", sep=";", header=TRUE,stringsAsFactors=FALSE,na.strings="?")

df_feb <- filter(df, Date %in% c("1/2/2007","2/2/2007")) 
df_feb$DateTime <- strptime(paste(df_feb$Date, df_feb$Time), "%d/%m/%Y %H:%M:%S")
  
## Plot 2
plot(df_feb$DateTime, df_feb$Global_active_power,
     type="l", ylab="Global Active Power (kilowatts)", xlab=NA)

## Export and save PNG file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
