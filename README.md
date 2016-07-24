# GettingAndCleaningDataCourseProject

## run_analysis.R

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
  
