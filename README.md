# Programming Assignment 3 - Getting and Cleaning Data

This is the programming Assignment # 3 for the course of Getting and Cleaning Data.

The R script, `run_analysis.R`, does the following:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Steps performed in the script

1. Load activity labels and features
2. Load all files into data tables
3. Merge train and test datasets
4. Add labels to merged data
5. Create factors
6. Melt merged data
7. Find Mean
8. Write tidy data to file

The output of this script is recorded in the file `tidy.txt`.