## run_analysis.R loads, cleans and merges data collected in testing wearable
## technology. 

## Load all the libraries used
library(data.table)
library(plyr)
library(reshape2)

## First, read all the data required. 

## metadata
activityLabels <- read.table("activity_labels.txt" )
features <- read.table("features.txt")

## Test data
subjectTest <- read.table("./test/subject_test.txt")
XTest <- read.table("./test/X_test.txt")
YTest <- read.table("./test/y_test.txt")

## Remaining Data in the "/test/Inertial Signals" directory is not required

## Training data
subjectTrain <- read.table("./train/subject_train.txt")
XTrain <- read.table("./train/X_train.txt")
YTrain <- read.table("./train/y_train.txt")

## Remaining Data in the "/test/Inertial Signals" directory is not required

## Transpose the features

featureLabels <- t(features[,2])

## Create a subset of measures with std|mean|Mean in them to be used later
featureSubset <- grep('mean|std|Mean',features[,2])

## Combine the X Test and X Train data, add column names and ditch the columns not needed

measuresData <- rbind(XTest, XTrain)
colnames(measuresData) <- featureLabels
measuresData <- measuresData[,featureSubset]

## Combine the Activity lists and merge with descriptive labels

activityList <- rbind(YTest, YTrain)
activityList <- merge(activityList, activityLabels, by.x="V1", by.y="V1", all=TRUE)
colnames(activityList) <- c("activityID","activityDescription")

## Combine the Subject lists and add descriptive label
subjects <- rbind(subjectTest, subjectTrain)
colnames(subjects) <- c("subjectID")

## Since the record counts are the same, add these to the start of the measuresData

measuresData <- cbind(subjects,activityList,measuresData)

## Now get averages for all variables

finalSummary <- melt(measuresData,id=c("subjectID","activityID","activityDescription"), measures.vars=featureLabels)
finalSummary <- dcast(finalSummary, subjectID + activityID + activityDescription ~ variable, mean)

## Write the data
write.table(finalSummary,"finalSummary.txt", row.names=FALSE)

## For validating results, uncomment this:
## write.table(measuresData,"measuresData.txt", row.names=FALSE)




