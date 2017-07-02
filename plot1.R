
# Setting the column classes as character for Date and Time Columns
# Setting the column classes as Numeric for rest of the seven fields

cc <- c(rep("character",2),rep("numeric",7))


# Reading just the header row and converting it into a character vector
cname<-as.character(read.csv("household_power_consumption.txt",sep = ";",na.strings = "?",nrows = 1,header = FALSE,stringsAsFactors = FALSE))


# Reading the data set for 2880 values from 66638th row as the the two dates relevant for analysis occur from here.. 
dat<-read.csv(file = "household_power_consumption.txt",sep=";",colClasses = cc, skip = 66637, header = FALSE, na.strings = "?",nrows = 2880)

# Alternatively we can read the entire file using nrow = 2,075,259 and use subset to eliminate rest of the data values. However i observed it takes more than 30 seconds in my system. 
##dat<-read.csv(file = "household_power_consumption.txt",sep=";",colClasses = cc, header = TRUE, na.strings = "?",nrows = 2075260)
## dat<-subset(dat, (Date == "1/02/2007" | Date == "2/02/2007"))
## However i preferred selecting the rows to see if i can avoid the delay in reading the big file

#Setting the colnames for the imported data file set. This is warranted as i skipped importing the header
colnames(dat)<-cname

#Setting the par function for single row, single column display
par(mfrow = c(1,1))

# creating a historgram using the hist function
hist(dat$Global_active_power,col = "red",main = "Global Active Power", xlab = "Global Active Power(kilowatts)")

# Using device copy function to copy the plot in PNG
dev.copy(png, "plot1.png")

# Closing the device
dev.off()

