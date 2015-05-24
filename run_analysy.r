#
#Getting and Cleaning Data Course Project
#
#Task:
# Based on the data from
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
# Create one R script called run_analysis.R that does the following. 
# 1.Merges the training and the test sets to create one data set.
# 2.Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3.Uses descriptive activity names to name the activities in the data set
# 4.Appropriately labels the data set with descriptive variable names.  
# 5.From the data set in step 4, creates a second, independent tidy data set 
#   with the average of each variable for each activity and each subject


rm(list=ls())
setwd("~/Coursera R/Readata/runAnalysis")
library(plyr)
library(dplyr)

#-------------------------------
#|  Load global code tables    |
#-------------------------------

#1. get descriptive definition of activities codes
activityLabels <- 
    read.table("UCI HAR Dataset/activity_labels.txt", header = FALSE, stringsAsFactors=FALSE)
#2. get descriptive definition of features codes
featureLabels<- 
    read.table("UCI HAR Dataset/features.txt", header = FALSE)

# +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#|1.  Merge the training and the test sets to create one data set | 
#|(Requirement no.1)                                              |
# +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

#---------------------------------------------------------------------------------
#|1.1 create a full data set for train data, including the subject,  the          |
#|activity  and the data of the measurements. total 563 colunms                   |
#---------------------------------------------------------------------------------

#read train data
trainMeasurements <- 
    read.table("UCI HAR Dataset/train/X_train.txt", header = FALSE)

#read activities codes related to the train data
trainActivity<-read.table("UCI HAR Dataset/train/Y_train.txt", header = FALSE)

#read  subject for train data 
trainSubjects <- read.table("UCI HAR Dataset/train/subject_train.txt", header = FALSE)

# Build the complete train dataframe 
trainMeasurements <-cbind(trainSubjects,trainActivity,trainMeasurements)

#--------------------------------------------------------------------------
#|1.2 create a full data set for test data, including the subject, the    |
#|activity code and the data of the measurements. total 563 colunms       |
#--------------------------------------------------------------------------

#read test data
testMeasurements<- 
    read.table("UCI HAR Dataset/test/X_test.txt", header = FALSE)

#read activities codes related to the test data
testActivity<-read.table("UCI HAR Dataset/test/Y_test.txt", header = FALSE)

#read  subject for test data 
testSubjects <- read.table("UCI HAR Dataset/test/subject_test.txt", header = FALSE)

# Build the complete test dataframe 
testMeasurements <-cbind(testSubjects,testActivity,testMeasurements)

#----------------------------------------------------------------
#|1.3 Merge the two data frames to create one complete dataframe|   
#----------------------------------------------------------------

allMeasurements <-rbind(trainMeasurements,testMeasurements)
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#|4. Appropriately labels the data set with descriptive variable names|
#|(Requirement no. 4)                                                 |
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

#read features labels
featureLabels<- 
    read.table("UCI HAR Dataset/features.txt", header = FALSE)

#create labels for the two columns added to the dataframe (subject and activity)
cols1 <- data.frame( c(0L,0L),  c("Subject","Activity"))
names(cols1)<-names(featureLabels)           

#create a full labels dataframe
dataLabels <-rbind(cols1,featureLabels)

#colnames(allMeasurements)<-featureLabels[,2]
colnames(allMeasurements)<-dataLabels[,2]
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#|2. Extracts only the measurements on the mean and standard deviation |
#|for each measurement. (Requirement no. 2) assuming the requirement   |
#| does not include meanFreq or the angel()  mean_variables            |
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

#build the indices of the "mean()" and "std()" columns


meanIndices <- grepl("mean\\(\\)", names(allMeasurements),ignore.case=TRUE)
stdIndices <- grepl("std\\(\\)", names(allMeasurements),ignore.case=TRUE)


combindIndices <- meanIndices | stdIndices

# add the "subject" and "activity" columns
combindIndices[1] <- TRUE
combindIndices[2] <- TRUE

meanAndStdMeasurements <- allMeasurements[, combindIndices]

#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#|3.Uses descriptive activity names to name the activities in the data set (from2)|
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

# create named activities for mean and std dataframe 
 namedActivities <- 
    activityLabels[match(meanAndStdMeasurements[,2], activityLabels[,1]), 2]

#replace activities codes by activity names  
meanAndStdMeasurements[,2]<-namedActivities

#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#|5. From the data set in step 4 ,creates a second,                              |
#|independent tidy data set                                                      | 
#| with the average of each variable for each activity and each subject          |
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

#create average activities per subject data frame
averageActivities <- 
    ddply(meanAndStdMeasurements, .(Subject, Activity), colwise(mean))

# write the output file
write.table(averageActivities, file="averageActivities.txt", row.name=FALSE)
