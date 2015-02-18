setwd("./UCI HAR Dataset")
library(dplyr)
#read data from Train set
features = read.table('./features.txt',header=FALSE)
activityType = read.table('./activity_labels.txt',header=FALSE)
subjectTrain = read.table('./train/subject_train.txt',header=FALSE)
xTrain = read.table('./train/x_train.txt',header=FALSE)
yTrain = read.table('./train/y_train.txt',header=FALSE)

 #Assign column names
colnames(activityType) = c('activityId','activityType')
colnames(subjectTrain) = "subjectId"
colnames(xTrain) = features[,2]
colnames(yTrain) = "activityId"

 #Combine data columns
trainingData = cbind(yTrain,subjectTrain,xTrain)

# Read test data
subjectTest = read.table('./test/subject_test.txt',header=FALSE)
xTest = read.table('./test/x_test.txt',header=FALSE)
yTest = read.table('./test/y_test.txt',header=FALSE)

#Assign column names
colnames(subjectTest) = "subjectId"
colnames(xTest) = features[,2]
colnames(yTest) = "activityId"

#Combine data columns
testData = cbind(yTest,subjectTest,xTest)

#Combine all data rows
Data = rbind(trainingData,testData)

#Get column names
colNames= colnames(Data)

#Match only activityId, subjectId, std. deviation and mean
match=grepl(".+Id$|-mean\\(\\)$|-std\\(\\)$", colNames)

#Extract only those columns
Data=Data[,colNames[match]]

#Label with discriptive names
colNames=colnames(Data)
find=c("(Body)\\1", "^t","^f", "Mag", "-std\\(\\)", "-mean\\(\\)")
replace=c("Body", "Time", "Frequency", "Magnitude", "StdDev", "Mean")
for (i in 1:length(find)) {
  colNames<-gsub(find[[i]], replace[[i]], colNames)
}
colnames(Data)<-colNames

#Group first by activityId and then by subjectId and find mean
Clean<-Data %>% group_by(activityId, subjectId) %>%
  summarise_each(funs(mean))

#Merge data with activityType
Clean=merge(Clean, activityType, by="activityId", all.x=T)

#Export data
write.table(Clean, "./Clean.txt",row.names=TRUE)
