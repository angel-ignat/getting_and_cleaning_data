### Merge the training and the test sets.
After unzipping the source data it is organized in the following tables:

features.txt

activity_labels.txt

subject_train.txt

X_train.txt

Y_train.txt

subject_test.txt

X_test.txt

Y_test.txt

Data is read in the following variables:

features <- features.txt

activityType <- activity_labels.txt

subjectTrain <- subject_train.txt

xTrain <- x_train.txt

yTrain <- y_train.txt

subjectTest <- subject_test.txt

xTest <- x_test.txt

yTest <- y_test.txt

First test data is combined by columns, so does training data. Then both data sets are appended to each other.

## Extract only the mean and standard deviation. 
Create a logcal vector called match that contains True only for columns with names containing Id, mean and std deviation.
These columns are kept while others are discarded.

## Rename columns with discriptive names.
Expand abbriviations and get rid of some characters using gsub() function.


## Summarize data and create a second clean data set.
Data set contained in variable Data is grouped first by activityId and then by subjectId.
Second data set is created(Clean variable) containing only the average of each column in Data.
Clean is merged with activity type by activityId and the result is saved to a text file called Clean.txt
