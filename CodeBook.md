# Introduction

This script ir a result of an assingment in the end of the course Getting and Cleaning Data, from Coursera. The instructions were: You should create one R script called run_analysis.R that does the following.

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# Variables
* features, activityLabels, xTrain, yTrain, subjectTrain, xTest, yTest, subjectTest contains data read from the files. 
 * names of features and activity were changed to be more readable
* featuresSelected - variables with measures of the mean and std
* trainSetMeanStd and testSetMeanStd- Train and Test, respectively, sets with only the variables selected
 * names type (V1, V2... ) were substituted by the features it represents
 * Included in the data set the activity number, subjec and the set of origin (Train or Test, depending on the case)
* tidySet - the merge of Train and Test sets
 * Create a variable with name of activity
 * Reorder the variables to put caracteristics of the measure first
* bySubjectActivity - data set grouped by subject and activity
* meanOfTidySet - calculates the mean of each variable by subject and activity
 * Excluded unused variables


