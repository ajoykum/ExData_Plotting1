
# Setting the column classes as character for Date and Time Columns
# Setting the column classes as Numeric for rest of the seven fields

cc <- c(rep("character",2),rep("numeric",7))


# Reading just the header row and converting it into a character vector
# This is required since i am skipping reading of all the unwanted date-range observations
cname<-as.character(read.csv("household_power_consumption.txt",sep = ";",na.strings = "?",nrows = 1,header = FALSE,stringsAsFactors = FALSE))


# Reading the data set for 2880 values from 66638th row as the the two dates relevant for analysis occur from here.. 
dat<-read.csv(file = "household_power_consumption.txt",sep=";",colClasses = cc, skip = 66637, header = FALSE, na.strings = "?",nrows = 2880)

## Alternatively we can read the entire file using nrow = 2,075,259 and use subset to eliminate rest of the data values. However i observed it takes more than 30 seconds in my system. 
##dat<-read.csv(file = "household_power_consumption.txt",sep=";",colClasses = cc, header = TRUE, na.strings = "?",nrows = 2075260)
## dat<-subset(dat, (Date == "1/02/2007" | Date == "2/02/2007"))
## However i have preferred selecting the rows to see if i can avoid the delay in reading the big file


#Setting the colnames for the imported data file set. This was warranted as i have to skip the data import for the first 66K rows
colnames(dat)<-cname

## converting the Date character column into Date
dat$Date <-  as.Date(dat$Date,"%d/%m/%Y")

##Concatenating Date with Time and assigning it to Time column in dataframe
dat$Time <- strptime(paste(dat$Date,dat$Time),format = "%Y-%m-%d %H:%M:%S")

## Setting the graphical parameter to 1 row and 1 col.
par(mfrow = c(1,1))

## Plotting the Active power against Time and settling axis labels
with(dat, plot(Time, Global_active_power, type = "l", ylab = "Global Active Power(kilowatts", xlab = ""))

## Copying the output from one device to another
dev.copy(png, "plot2.png", height =480, width = 480)

# Closing the png device opened
dev.off()



