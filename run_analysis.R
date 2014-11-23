wd <- getwd()

zip.file <- paste(wd, "wearablecomputing.zip", sep="/")
# names my zip file destination, which will be useful for unzipping its files

if(!file.exists(zip.file)) 
{
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", zip.file)
} 
# downloads the zip file and stores it as wearablecomputing.zip 

test.data <- read.table(unzip(zip.file, "UCI HAR Dataset/test/X_test.txt"))
test.activity <- read.table(unzip(zip.file, "UCI HAR Dataset/test/y_test.txt"))
test.subject <- read.table(unzip(zip.file, "UCI HAR Dataset/test/subject_test.txt"))
# unzips and reads the test activity labels, subject IDs and data measurements
test <- cbind(test.subject, test.activity, test.data)
# binds the subject ID and the measurements on his/her activities in one data frame

train.data <- read.table(unzip(zip.file, "UCI HAR Dataset/train/X_train.txt"))
train.activity <- read.table(unzip(zip.file, "UCI HAR Dataset/train/y_train.txt"))
train.subject <- read.table(unzip(zip.file, "UCI HAR Dataset/train/subject_train.txt"))
# unzips and reads the train activity labels, subject IDs and data measurements
train <- cbind(train.subject, train.activity, train.data)
# binds the subject ID, and the measurements on his/her activities in one data frame

all.data <- rbind(train, test)
# given the rows in test and train measurements are all different instances, 
# even if they are measurements of the same participant performing the same activity,
# they are merged one below the other

column.names <- read.table(unzip(zip.file, "UCI HAR Dataset/features.txt"))
# unzips and reads features.txt, the file that lists the variable names for all data frames
column.names[, 1] <- NULL
# erases the first row (an id row), in order to only have the column names row
column.names <- t(column.names)
# transposes this vector from a column into a row, which will become later the column names for the merged data frames
rownames(column.names) <- NULL
# because the t() function makes the previous column name (V2) into the first column, it is erased
colnames(all.data) <- c("Subjects", "Activity", column.names)
# names all variables with their corresponding activity labels and types of measurements

# STEP 1 COMPLETE: Merges the training and the test sets to create one data set

mean.data <- all.data[grepl("mean()", colnames(all.data), fixed = TRUE)]
# looks for the word "mean" in all variable names and subsets all mean measurements
std.data <- all.data[grepl("std()", colnames(all.data))]
# looks for the word "std" in all variable names and subsets all standard deviation measurements
IDs <- cbind(all.data$Subjects, all.data$Activity)
# extracts and binds the subject and activity IDs from the original dataset
mean.std <- cbind(IDs, mean.data, std.data)
# binds together the extracted IDs, means and std deviations

colnames(mean.std)[1] <- "Subjects"
colnames(mean.std)[2] <- "Activity"
# the ID columns were subsetted without their original column names; this is a quick fix

# STEP 2 COMPLETE: Extracts only the measurements on the mean and standard deviation for each measurement.

for(i in 1:nrow(mean.std)) {
  if(mean.std$Activity[[i]] == 1) {mean.std$Activity[[i]] <- "WALKING"}
  if(mean.std$Activity[[i]] == 2) {mean.std$Activity[[i]] <- "WALKING_UPSTAIRS"}
  if(mean.std$Activity[[i]] == 3) {mean.std$Activity[[i]] <- "WALKING_DOWNSTAIRS"}
  if(mean.std$Activity[[i]] == 4) {mean.std$Activity[[i]] <- "SITTING"}
  if(mean.std$Activity[[i]] == 5) {mean.std$Activity[[i]] <- "STANDING"}
  if(mean.std$Activity[[i]] == 6) {mean.std$Activity[[i]] <- "LAYING"}
}

# STEP 3 COMPLETE: Uses descriptive activity names to name the activities in the data set.

descriptive.labels.1 <- c("Subject","Activity","Mean Time for Body Accelerometer Signal on X axis","Mean Time for Body Accelerometer Signal on Y axis","Mean Time for Body Accelerometer Signal on Z axis","Mean Time for Gravity Accelerometer Signal on X axis","Mean Time for Gravity Accelerometer Signal on Y axis","Mean Time for Gravity Accelerometer Signal on Z axis","Mean Time for Derived Body Accelerometer Jerk Signal on X axis","Mean Time for Derived Body Accelerometer Jerk Signal on Y axis","Mean Time for Derived Body Accelerometer Jerk Signal on Z axis","Mean Time for Body Gyroscope Signal on X axis","Mean Time for Body Gyroscope Signal on Y axis","Mean Time for Body Gyroscope Signal on Z axis","Mean Time for Derived Body Gyroscope Jerk Signal on X axis","Mean Time for Derived Body Gyroscope Jerk Signal on Y axis","Mean Time for Derived Body Gyroscope Jerk Signal on Z axis","Mean Time for Magnitude of Body Accelerometer Signal","Mean Time for Magnitude of Gravity Accelerometer Signal","Mean Time for Magnitude of Derived Body Accelerometer Jerk Signal","Mean Time for Magnitude of Body Gyroscope Signal","Mean Time for Magnitude of Derived Body Gyroscope Jerk Signal","Mean Frequency for Body Accelerometer Signal on X axis","Mean Frequency for Body Accelerometer Signal on Y axis","Mean Frequency for Body Accelerometer Signal on Z axis","Mean Frequency for Derived Body Accelerometer Jerk Signal on X axis","Mean Frequency for Derived Body Accelerometer Jerk Signal on Y axis","Mean Frequency for Derived Body Accelerometer Jerk Signal on Z axis","Mean Frequency for Body Gyroscope Signal on X axis","Mean Frequency for Body Gyroscope Signal on Y axis","Mean Frequency for Body Gyroscope Signal on Z axis","Mean Frequency for Magnitude of Body Accelerometer Signal","Mean Frequency for Magnitude of Derived Body Accelerometer Jerk Signal","Mean Frequency for Magnitude of Body Gyroscope Signal","Mean Frequency for Magnitude of Derived Body Gyroscope Jerk Signal","Standard Deviation Time for Body Accelerometer Signal on X axis","Standard Deviation Time for Body Accelerometer Signal on Y axis","Standard Deviation Time for Body Accelerometer Signal on Z axis","Standard Deviation Time for Gravity Accelerometer Signal on X axis","Standard Deviation Time for Gravity Accelerometer Signal on Y axis","Standard Deviation Time for Gravity Accelerometer Signal on Z axis","Standard Deviation Time for Derived Body Accelerometer Jerk Signal on X axis","Standard Deviation Time for Derived Body Accelerometer Jerk Signal on Y axis","Standard Deviation Time for Derived Body Accelerometer Jerk Signal on Z axis","Standard Deviation Time for Body Gyroscope Signal on X axis","Standard Deviation Time for Body Gyroscope Signal on Y axis","Standard Deviation Time for Body Gyroscope Signal on Z axis","Standard Deviation Time for Derived Body Gyroscope Jerk Signal on X axis","Standard Deviation Time for Derived Body Gyroscope Jerk Signal on Y axis","Standard Deviation Time for Derived Body Gyroscope Jerk Signal on Z axis","Standard Deviation Time for Magnitude of Body Accelerometer Signal","Standard Deviation Time for Magnitude of Gravity Accelerometer Signal","Standard Deviation Time for Magnitude of Derived Body Accelerometer Jerk Signal","Standard Deviation Time for Magnitude of Body Gyroscope Signal","Standard Deviation Time for Magnitude of Derived Body Gyroscope Jerk Signal","Standard Deviation Frequency for Body Accelerometer Signal on X axis","Standard Deviation Frequency for Body Accelerometer Signal on Y axis","Standard Deviation Frequency for Body Accelerometer Signal on Z axis","Standard Deviation Frequency for Derived Body Accelerometer Jerk Signal on X axis","Standard Deviation Frequency for Derived Body Accelerometer Jerk Signal on Y axis","Standard Deviation Frequency for Derived Body Accelerometer Jerk Signal on Z axis","Standard Deviation Frequency for Body Gyroscope Signal on X axis","Standard Deviation Frequency for Body Gyroscope Signal on Y axis","Standard Deviation Frequency for Body Gyroscope Signal on Z axis")
descriptive.labels.2 <- c("Standard Deviation Frequency for Magnitude of Body Accelerometer Signal","Standard Deviation Frequency for Magnitude of Derived Body Accelerometer Jerk Signal","Standard Deviation Frequency for Magnitude of Body Gyroscope Signal","Standard Deviation Frequency for Magnitude of Derived Body Gyroscope Jerk Signal")
descriptive.labels <- c(descriptive.labels.1, descriptive.labels.2)
colnames(mean.std) <- descriptive.labels

# STEP 4 COMPLETE: Appropriately labels the data set with descriptive variable names. 

tidy <- data.frame()

for(i in unique(mean.std$Subject)){
  for(j in unique(mean.std$Activity))
  {
    tidy.avg <- mean.std[mean.std$Subject == i & mean.std$Activity == j, ]
    # subsets groups of rows for subjects 1 thru 30 performing activities "WALKING" through "LAYING"  
    tidy.no.mean <- tidy.avg[1, 1:2]
    tidy.avg <- as.data.frame(lapply(tidy.avg[, -c(1,2)], mean))
    tidy.avg <- cbind(tidy.no.mean, tidy.avg)
    # calculates the average of every group
    tidy <- rbind(tidy, tidy.avg)
   }
}

tidy <- tidy[order(tidy[, 1], tidy[, 2]), ]
rownames(tidy) <- NULL

# STEP 5 COMPLETE: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

write.table(tidy, paste0(wd, "/tidy.txt"), row.name=F)
