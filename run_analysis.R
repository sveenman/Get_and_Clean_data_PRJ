library(data.table)
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
#download.file(fileUrl, destfile = "GandC_project.zip", method = "curl")
# method = curl does not work for me, so I use method = auto wich apparently does the job.. 
download.file(fileUrl, destfile = "GandC_project.zip", method = "auto")
unzip("GandC_project.zip")

# Read the provided files and the test and training dataset
xtestdata <- read.csv("UCI HAR Dataset/test/X_test.txt", sep="", header=FALSE)
ytest <- read.csv("UCI HAR Dataset/test/y_test.txt", sep="", header=FALSE)
subjecttest <- read.csv("UCI HAR Dataset/test/subject_test.txt", sep="", header=FALSE)
xtraindata <- read.csv("UCI HAR Dataset/train/X_train.txt", sep="", header=FALSE)
ytrain <- read.csv("UCI HAR Dataset/train/y_train.txt", sep="", header=FALSE)
subjecttrain <- read.csv("UCI HAR Dataset/train/subject_train.txt", sep="", header=FALSE)
activitylbls <- read.csv("UCI HAR Dataset/activity_labels.txt", sep="", header=FALSE, colClasses="character")
features <- read.csv("UCI HAR Dataset/features.txt", sep="", header=FALSE, colClasses="character")

# Add the activities and labels to the test and train data set
xtestdata[,c(1)] <- factor(xtestdata[,c(1)], levels=activitylbls[,c(1)], labels=activitylbls[,c(2)])
xtraindata[,c(1)] <- factor(xtraindata[,c(1)], levels=activitylbls[,c(1)], labels=activitylbls[,c(2)])

# The features file is used to define the field names to the dataset
# Also change V1 to activity and subject.. 
colnames(xtestdata) <- features[,c(2)]
colnames(xtraindata) <- features[,c(2)]
colnames(ytest) <- c("activity")
colnames(ytrain) <- c("activity")
colnames(subjecttest) <- c("subject")
colnames(subjecttrain) <- c("subject")

# Combine test, training and activities
xtestdata <- cbind(xtestdata, ytest)
xtestdata <- cbind(xtestdata, subjecttest)
xtraindata <- cbind(xtraindata, ytrain)
xtraindata <- cbind(xtraindata, subjecttrain)
testANDtrain <- rbind(xtestdata, xtraindata)

# Get the mean and stddev of each  measurements
# Supress a mean warning (Factor instead of num) by skipping the 1st field..
testANDtrain_mean <- sapply(testANDtrain[,c(2:563)], mean, na.rm=TRUE)
testANDtrain_sd <- sapply(testANDtrain, sd, na.rm=TRUE)

# Create the tidy data set with the average for all values by activity and subject.
datatable <- data.table(testANDtrain)
tidy <- datatable[,lapply(.SD,mean), by="activity,subject"]
write.csv(tidy, file="tidy.txt", row.names = FALSE)
