## Getting and Cleaning Data Project


### Description
The source data for this project can be found here:(https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

### Making Modifications to This Script
Once you have obtained and unzipped the source files, you will need to make one modification to the R file before you can process the data.
Note that on line 26 of run_analysis.R, you will set the path of the working directory to relect the location of the source files
in your own directory.

### Summary
The script Clean R works as follows:
 
1. Merges the training and the test sets.
2. Extracts only the mean and standard deviation for each measurement. 
3. Renames columns using descriptive activity names. 
4. Creates a second, data set containing only the average of each activity and each subject according to the principles of clear data. 
