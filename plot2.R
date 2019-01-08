URL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(URL,"hpc.zip")
unzip("hpc.zip")
hpc <- read.csv2("household_power_consumption.txt",na.strings = "?",stringsAsFactors = FALSE)
rel_hpc <- hpc[grep("^1/2/2007|^2/2/2007",hpc$Date),]
rel_hpc$Time <- strptime(paste(rel_hpc[,1],rel_hpc[,2],sep = " "), format = "%d/%m/%Y %T")
rel_hpc$Date <- as.Date(rel_hpc$Date, format = "%d/%m/%Y")
for(i in 3:9){rel_hpc[,i] <- as.numeric(rel_hpc[,i])}
png("plot2.png")
with(rel_hpc,plot(Time, Global_active_power, type = "n", xlab = "", ylab = "Global Active Power (Kilowatts)"))
with(rel_hpc,lines(Time, Global_active_power))
dev.off()