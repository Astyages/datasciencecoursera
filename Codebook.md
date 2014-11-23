
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
  - run_analysis.R calculates the mean of each variable for each activity and each subject on the mean.std data frame using lapply(). the result is then converted into a data frame with as.data.frame() as lapply() gives off a list.
  - Manually interpreted and translated the original variables names into more descriptive labels based on the descriptions in "features_info.txt"
  
### Variables Names
The conversion into more descriptive names is based on the following equivalences:
  - prefix t: time
  - prefix f: frequency domain calculated with Fast Fourier Transform
  - Body and Gravity: raw acceleration signal was separated into body and gravity acceleration
  - Acc: from accelerometer
  - Gyro: from gyroscope
  - Jerk: derived from body linear acceleration and angular velocity
  - Mag: magnitude of signals calculated using Euclidean norm
  - mean(): mean
  - std(): standard deviation
  - suffix X, Y, Z: 3 axial signals

  - "1"	"tBodyAcc-mean()-X"	"Mean Time for Body Accelerometer Signal on X axis"
  - "2"	"tBodyAcc-mean()-Y"	"Mean Time for Body Accelerometer Signal on Y axis"
  - "3"	"tBodyAcc-mean()-Z"	"Mean Time for Body Accelerometer Signal on Z axis"
  - "4"	"tGravityAcc-mean()-X"	"Mean Time for Gravity Accelerometer Signal on X axis"
  - "5"	"tGravityAcc-mean()-Y"	"Mean Time for Gravity Accelerometer Signal on Y axis"
  - "6"	"tGravityAcc-mean()-Z"	"Mean Time for Gravity Accelerometer Signal on Z axis"
  - "7"	"tBodyAccJerk-mean()-X"	"Mean Time for Derived Body Accelerometer Jerk Signal on X axis"
  - "8"	"tBodyAccJerk-mean()-Y"	"Mean Time for Derived Body Accelerometer Jerk Signal on Y axis"
  - "9"	"tBodyAccJerk-mean()-Z"	"Mean Time for Derived Body Accelerometer Jerk Signal on Z axis"
  - "10"	"tBodyGyro-mean()-X"	"Mean Time for Body Gyroscope Signal on X axis"
  - "11"	"tBodyGyro-mean()-Y"	"Mean Time for Body Gyroscope Signal on Y axis"
  - "12"	"tBodyGyro-mean()-Z"	"Mean Time for Body Gyroscope Signal on Z axis"
  - "13"	"tBodyGyroJerk-mean()-X"	"Mean Time for Derived Body Gyroscope Jerk Signal on X axis"
  - "14"	"tBodyGyroJerk-mean()-Y"	"Mean Time for Derived Body Gyroscope Jerk Signal on Y axis"
  - "15"	"tBodyGyroJerk-mean()-Z"	"Mean Time for Derived Body Gyroscope Jerk Signal on Z axis"
  - "16"	"tBodyAccMag-mean()"	"Mean Time for Magnitude of Body Accelerometer Signal"
  - "17"	"tGravityAccMag-mean()"	"Mean Time for Magnitude of Gravity Accelerometer Signal"
  - "18"	"tBodyAccJerkMag-mean()"	"Mean Time for Magnitude of Derived Body Accelerometer Jerk Signal"
  - "19"	"tBodyGyroMag-mean()"	"Mean Time for Magnitude of Body Gyroscope Signal"
  - "20"	"tBodyGyroJerkMag-mean()"	"Mean Time for Magnitude of Derived Body Gyroscope Jerk Signal"
  - "21"	"fBodyAcc-mean()-X"	"Mean Frequency for Body Accelerometer Signal on X axis"
  - "22"	"fBodyAcc-mean()-Y"	"Mean Frequency for Body Accelerometer Signal on Y axis"
  - "23"	"fBodyAcc-mean()-Z"	"Mean Frequency for Body Accelerometer Signal on Z axis"
  - "24"	"fBodyAccJerk-mean()-X"	"Mean Frequency for Derived Body Accelerometer Jerk Signal on X axis"
  - "25"	"fBodyAccJerk-mean()-Y"	"Mean Frequency for Derived Body Accelerometer Jerk Signal on Y axis"
  - "26"	"fBodyAccJerk-mean()-Z"	"Mean Frequency for Derived Body Accelerometer Jerk Signal on Z axis"
  - "27"	"fBodyGyro-mean()-X"	"Mean Frequency for Body Gyroscope Signal on X axis"
  - "28"	"fBodyGyro-mean()-Y"	"Mean Frequency for Body Gyroscope Signal on Y axis"
  - "29"	"fBodyGyro-mean()-Z"	"Mean Frequency for Body Gyroscope Signal on Z axis"
  - "30"	"fBodyAccMag-mean()"	"Mean Frequency for Magnitude of Body Accelerometer Signal"
  - "31"	"fBodyBodyAccJerkMag-mean()"	"Mean Frequency for Magnitude of Derived Body Accelerometer Jerk Signal"
  - "32"	"fBodyBodyGyroMag-mean()"	"Mean Frequency for Magnitude of Body Gyroscope Signal"
  - "33"	"fBodyBodyGyroJerkMag-mean()"	"Mean Frequency for Magnitude of Derived Body Gyroscope Jerk Signal"
  - "34"	"tBodyAcc-std()-X"	"Standard Deviation Time for Body Accelerometer Signal on X axis"
  - "35"	"tBodyAcc-std()-Y"	"Standard Deviation Time for Body Accelerometer Signal on Y axis"
  - "36"	"tBodyAcc-std()-Z"	"Standard Deviation Time for Body Accelerometer Signal on Z axis"
  - "37"	"tGravityAcc-std()-X"	"Standard Deviation Time for Gravity Accelerometer Signal on X axis"
  - "38"	"tGravityAcc-std()-Y"	"Standard Deviation Time for Gravity Accelerometer Signal on Y axis"
  - "39"	"tGravityAcc-std()-Z"	"Standard Deviation Time for Gravity Accelerometer Signal on Z axis"
  - "40"	"tBodyAccJerk-std()-X"	"Standard Deviation Time for Derived Body Accelerometer Jerk Signal on X axis"
  - "41"	"tBodyAccJerk-std()-Y"	"Standard Deviation Time for Derived Body Accelerometer Jerk Signal on Y axis"
  - "42"	"tBodyAccJerk-std()-Z"	"Standard Deviation Time for Derived Body Accelerometer Jerk Signal on Z axis"
  - "43"	"tBodyGyro-std()-X"	"Standard Deviation Time for Body Gyroscope Signal on X axis"
  - "44"	"tBodyGyro-std()-Y"	"Standard Deviation Time for Body Gyroscope Signal on Y axis"
  - "45"	"tBodyGyro-std()-Z"	"Standard Deviation Time for Body Gyroscope Signal on Z axis"
  - "46"	"tBodyGyroJerk-std()-X"	"Standard Deviation Time for Derived Body Gyroscope Jerk Signal on X axis"
  - "47"	"tBodyGyroJerk-std()-Y"	"Standard Deviation Time for Derived Body Gyroscope Jerk Signal on Y axis"
  - "48"	"tBodyGyroJerk-std()-Z"	"Standard Deviation Time for Derived Body Gyroscope Jerk Signal on Z axis"
  - "49"	"tBodyAccMag-std()"	"Standard Deviation Time for Magnitude of Body Accelerometer Signal"
  - "50"	"tGravityAccMag-std()"	"Standard Deviation Time for Magnitude of Gravity Accelerometer Signal"
  - "51"	"tBodyAccJerkMag-std()"	"Standard Deviation Time for Magnitude of Derived Body Accelerometer Jerk Signal"
  - "52"	"tBodyGyroMag-std()"	"Standard Deviation Time for Magnitude of Body Gyroscope Signal"
  - "53"	"tBodyGyroJerkMag-std()"	"Standard Deviation Time for Magnitude of Derived Body Gyroscope Jerk Signal"
  - "54"	"fBodyAcc-std()-X"	"Standard Deviation Frequency for Body Accelerometer Signal on X axis"
  - "55"	"fBodyAcc-std()-Y"	"Standard Deviation Frequency for Body Accelerometer Signal on Y axis"
  - "56"	"fBodyAcc-std()-Z"	"Standard Deviation Frequency for Body Accelerometer Signal on Z axis"
  - "57"	"fBodyAccJerk-std()-X"	"Standard Deviation Frequency for Derived Body Accelerometer Jerk Signal on X axis"
  - "58"	"fBodyAccJerk-std()-Y"	"Standard Deviation Frequency for Derived Body Accelerometer Jerk Signal on Y axis"
  - "59"	"fBodyAccJerk-std()-Z"	"Standard Deviation Frequency for Derived Body Accelerometer Jerk Signal on Z axis"
  - "60"	"fBodyGyro-std()-X"	"Standard Deviation Frequency for Body Gyroscope Signal on X axis"
  - "61"	"fBodyGyro-std()-Y"	"Standard Deviation Frequency for Body Gyroscope Signal on Y axis"
  - "62"	"fBodyGyro-std()-Z"	"Standard Deviation Frequency for Body Gyroscope Signal on Z axis"
  - "63"	"fBodyAccMag-std()"	"Standard Deviation Frequency for Magnitude of Body Accelerometer Signal"
  - "64"	"fBodyBodyAccJerkMag-std()"	"Standard Deviation Frequency for Magnitude of Derived Body Accelerometer Jerk Signal"
  - "65"	"fBodyBodyGyroMag-std()"	"Standard Deviation Frequency for Magnitude of Body Gyroscope Signal"
  - "66"	"fBodyBodyGyroJerkMag-std()"	"Standard Deviation Frequency for Magnitude of Derived Body Gyroscope Jerk Signal"
