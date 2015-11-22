## Run_Analysis code aimes to process data to make it tidy
library(reshape2)

fileName <- "getdata_dataset.zip"

## Download file and unzip the dataset:
if (!file.exists(fileName)){
  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "
  download.file(fileURL, fileName)
}  
if (!file.exists("UCI HAR Dataset")) { 
  unzip(fileName) 
}

# Read activity labels
activityLabels <- read.table("UCI HAR Dataset/activity_labels.txt")
activityLabels[,2] <- as.character(activityLabels[,2])

# Read features
features <- read.table("UCI HAR Dataset/features.txt")
features[,2] <- as.character(features[,2])

# Detect features name related to mean and standard deviation and assign tidy name
featuresNeeded <- grep(".*mean.*|.*std.*", features[,2])
featuresNeeded.names <- features[featuresNeeded,2]
featuresNeeded.names = gsub('-mean', 'Mean', featuresNeeded.names)
featuresNeeded.names = gsub('-std', 'Std', featuresNeeded.names)
featuresNeeded.names <- gsub('[-()]', '', featuresNeeded.names)


# Read Train dataset: X data, Y activities, Subject - and then merge into one dataset
train <- read.table("UCI HAR Dataset/train/X_train.txt")[featuresNeeded]
trainActivities <- read.table("UCI HAR Dataset/train/Y_train.txt")
trainSubjects <- read.table("UCI HAR Dataset/train/subject_train.txt")
train <- cbind(trainSubjects, trainActivities, train)

# Read Test dataset: X data, Y activities, Subject - and then merge into one dataset
test <- read.table("UCI HAR Dataset/test/X_test.txt")[featuresNeeded]
testActivities <- read.table("UCI HAR Dataset/test/Y_test.txt")
testSubjects <- read.table("UCI HAR Dataset/test/subject_test.txt")
test <- cbind(testSubjects, testActivities, test)

# Merge train and test datasets and add labels (descriptive names)
mergedData <- rbind(train, test)
colnames(mergedData) <- c("subject", "activity", featuresNeeded.names)

# Turn activities & subjects into factors
mergedData$activity <- factor(mergedData$activity, levels = activityLabels[,1], labels = activityLabels[,2])
mergedData$subject <- as.factor(mergedData$subject)

mergedData.melted <- melt(mergedData, id = c("subject", "activity"))
mergedData.mean <- dcast(mergedData.melted, subject + activity ~ variable, mean)

# Write output file
write.table(mergedData.mean, "tidyData.txt", row.names = FALSE, quote = FALSE)