
# Codebook

### R
Version 0.98.976

### Raw Data Set
[Human Activity Recognition Using Smartphones Dataset
Version 1.0](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip), as provided in the [Course Assignment page](https://class.coursera.org/getdata-009/human_grading/view/courses/972587/assessments/3/submissions)

### Files extracted
  - Test Subject IDs: "UCI HAR Dataset/test/subject_test.txt"
  - Test Activity Labels: "UCI HAR Dataset/test/y_test.txt"
  - Test Data Measurements: "UCI HAR Dataset/test/X_test.txt" 
  - Training Subject IDs: "UCI HAR Dataset/train/subject_train.txt"
  - Training Activity Labels: "UCI HAR Dataset/train/y_train.txt"
  - Training Data Measurements: "UCI HAR Dataset/train/X_train.txt"
  - Original Variable Names: "UCI HAR Dataset/features.txt"
  - Activity Labels: "UCI HAR Dataset/activity_labels.txt"
  
### Important Variables
  - all.data: data frame which holds all test and training measurements with their corresponding subjects IDs and activity labels
  - mean.std: data frame which holds only the mean and standard deviation variables extracted from all.data; these variables were alreadyy part of the original data set
  - descriptive.labels: character vector which holds manually inputted, more descriptive variable names
  - tidy: 180 by 68 data frame which holds the mean of each variable for each activity and each subject
  
### Important Transformations
  - run_analysis.R rbind() the test data under the train data, given these measurements are different instances, even if the measurments correspond to the same subject ID performing the same activity label.
  - run_analysis.R uses grepl() to look for only "mean()" and "std()" in all.data, excluding meanFreq() variables
  - run_analysis.R for() loops to change the numeric activity labels into character values based on "UCI HAR Dataset/activity_labels.txt"
  
###
