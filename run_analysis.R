## Working Directory - git folder for the assignment
## I've put the data in this directory. I have not downloaded directly from the website in the script bec


##setwd(dir = "C:/Users/Rogerio/Google Drive/Cursos/R/git/AssignmentCleaningData")
## Download and unzip the dataset:

fileName <- "UCIDataSet.zip"

if (!file.exists(fileName)){
      fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
      download.file (url = fileURL, destfile = fileName)
}  
if (!file.exists("UCI HAR Dataset")) { 
      unzip(fileName) 
}



## READING DATA
## x... - set
## y... - labels
## Activity Labels
      ## 1 WALKING
      ## 2 WALKING_UPSTAIRS
      ## 3 WALKING_DOWNSTAIRS
      ## 4 SITTING
      ## 5 STANDING
      ## 6 LAYING
## Subjects
## Features

## Reading features
features <- read.table("./UCI HAR Dataset/features.txt")
names(features) <- c("featureNumber", "featureName")

## Reading Activity Labels
activityLabels <- read.table("./UCI HAR Dataset/activity_labels.txt")
names(activityLabels) <- c("activityNumber", "activityName")

## Reading train
xTrain <- read.table("./UCI HAR Dataset/train/X_train.txt")
yTrain <- read.table("./UCI HAR Dataset/train/Y_train.txt")
subjectTrain <- read.table("./UCI HAR Dataset/train/subject_train.txt")

## Reading test
xTest <- read.table("./UCI HAR Dataset/test/X_test.txt")
yTest <- read.table("./UCI HAR Dataset/test/Y_test.txt")
subjectTest <- read.table("./UCI HAR Dataset/test/subject_test.txt")


## Selecting variables to be used - only mean and std
featuresSelected <- grep("mean[(][)]|std[(][)]",  features$featureName)

## Arranging Train Set - mean and std variables + labels + subjects + set of origin (Train or Test)
trainSetMeanStd <- xTrain[, featuresSelected]
names(trainSetMeanStd) <- features$featureName[featuresSelected]
## Adding labels and subject to the Train set
trainSetMeanStd$activityNumber <- yTrain$V1
trainSetMeanStd$subject <- subjectTrain$V1
trainSetMeanStd$originSet <- "Train" ## To know what is the set when I merge Train and Test sets



## Arranging Train Set - mean and std variables + labels + subjects + set of origin (Train or Test)

testSetMeanStd <- xTest[, featuresSelected]
names(testSetMeanStd) <- features$featureName[featuresSelected]

## Adding labels and subject into the Train set
testSetMeanStd$activityNumber <- yTest$V1
testSetMeanStd$subject <- subjectTest$V1
testSetMeanStd$originSet <- "Test" ## To know what is the set when I merge Train and Test sets

## Merging train and test sets to create one data set
tidySet <- merge(trainSetMeanStd, testSetMeanStd, all = TRUE)


## Creating a column with the label name 
tidySet$activityName <- activityLabels$activityName[tidySet[, "activityNumber"]]

## Arranging column names
names(tidySet) <- gsub("mean[(][)]", "Mean", names(tidySet))
names(tidySet) <- gsub("std[(][)]", "Std", names(tidySet))
names(tidySet) <- gsub("-", "", names(tidySet))

## Arrangin column order
tidySet <- tidySet[, c(68, 70, 67, 69, 1:66)]

## This uses dplyr pac

## Creating data set of the means grouped by activity and subject
bySubjectActivity <- group_by(tidySet, subject, activityName)
meanOfTidySet <- summarise_all(bySubjectActivity, mean)
meanOfTidySet[69:70] <- NULL

## Writing txt file
write.table(meanOfTidySet, 
            file = "meanOfTidySetMeanStdTrainTestAllMeasuresByActivitySubject.txt", 
            row.names = FALSE)