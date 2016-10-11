#Loading activity labels and features
dtActivityLabels<-read.table("UCI HAR Dataset/activity_labels.txt")
dtFeatures<-read.table("UCI HAR Dataset/features.txt")
reqFeatures<-dtFeatures[grep("-mean*|-std*", dtFeatures$V2),1]
reqFeaturesNames<-dtFeatures[reqFeatures,2]
reqFeaturesNames<-gsub('-std','Std',reqFeaturesNames)
reqFeaturesNames<-gsub('-mean','Mean',reqFeaturesNames)
reqFeaturesNames<-gsub('-|\\(\\)','',reqFeaturesNames)


#Loading all files into data tables
dtDataTrain<-read.table("UCI HAR Dataset/train/X_train.txt")[reqFeatures]
dtSubTrain<-read.table("UCI HAR Dataset/train/subject_train.txt")
dtLabelsTrain<-read.table("UCI HAR Dataset/train/Y_train.txt")
dtTrain<-cbind(dtSubTrain, dtLabelsTrain, dtDataTrain)

dtDataTest<-read.table("UCI HAR Dataset/test/X_test.txt")[reqFeatures]
dtSubTest<-read.table("UCI HAR Dataset/test/subject_test.txt")
dtLabelsTest<-read.table("UCI HAR Dataset/test/Y_test.txt")
dtTest<-cbind(dtSubTest, dtLabelsTest, dtDataTest)

#Merging train and test datasets
dtMerged<-rbind(dtTrain,dtTest)

#Adding labels to merged data
colnames(dtMerged) <- c("subject", "activity", reqFeaturesNames)

#Creating factors
dtMerged$activity <- factor(dtMerged$activity, levels = dtActivityLabels$V1, labels = dtActivityLabels$V2)
dtMerged$subject <- as.factor(dtMerged$subject)

#Melting merged data
meltedMerged <- melt(dtMerged, id = c("subject", "activity"))

#Getting Mean
meanMerged <- dcast(meltedMerged, subject + activity ~ variable, mean)

#writing tidy data to file
write.table(meanMerged, "tidy.txt", row.names = FALSE, quote = FALSE)

