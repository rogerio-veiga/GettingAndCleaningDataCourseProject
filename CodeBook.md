# Introduction

This script ir a result of an assingment in the end of the course Getting and Cleaning Data, from Coursera. The instructions were: You should create one R script called run_analysis.R that does the following.

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# run_analysis.R

The script follows these steps:

* Download the file and unzip it, if needed
* Read the files
  * Train Set
  * Test Set
  * Activities
  * Features
  * Subject
* Select only the Mean and Std features, as defined in the instructions
* It creates two variables - trainSetMeanStd and testSetMeanStd with only the variables needed, including activity and subject data
  * Substitute the names of the variables to meaningful names
* Merges Train and Test sets
  * Put names in a standard format and order to facilitate visualization
* Using dplyr package:
  * Group by subject and activity
  * Generates a data set with the means of each mesure by subject and activity
* Write txt file - meanOfTidySetMeanStdTrainTestAllMeasuresByActivitySubject.txt
  
