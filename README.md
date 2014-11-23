datasciencecoursera
===================

# Course Assignment
This repo holds the R script (run_analysis.R) that performs the course assignment instructions, as part of the [Getting and Cleaning Data Science course](https://class.coursera.org/getdata-009/human_grading/view/courses/972587/assessments/3/submissions). It also holds the Codebook (Codebook.md) which describes the variables, the data, and all work performed to clean up the data. Particularly, it describes the specific files that were unzipped and turned into the variables the R script ends up using, and the functions which in someway alterate the raw data. 

Below is an overview of what the R script performs and how those program instructions correspond to the necessary steps to be performed for this course assignment.

## run_analysis.R
  - Names the zip file destination, which will be useful for unzipping its files, and downloads the assignment's zip file.
  - Unzips and reads the Train and Test subject IDs, activity labels, and data measurements.
  - Rbinds the Test table under the Train table, given they are all values of different instances, even if there are measurements of the same participant. 
  - Unzips the variable names and adds them as the column names to complete the data set.

> STEP 1 COMPLETE: Merges the training and the test sets to create one data set
  
  - Looks for the word "mean()" and "std()" in all variable names and subsets all corresponding measurements.
  - Cbinds them together with their subject IDs and activity labels.

> STEP 2 COMPLETE: Extracts only the measurements on the mean and standard deviation for each measurement.

  - Uses a for loop to go over the activity labels column, changing the numbered labels to corresponding descriptive activities.

> STEP 3 COMPLETE: Uses descriptive activity names to name the activities in the data set.

  - Astyages evaluated all 68 variable names in the smaller dataset and manually wrote more descriptive variable names, substituting the original names.

> STEP 4 COMPLETE: Appropriately labels the data set with descriptive variable names. 

  - Uses a nested for loop to go over all combinations of subject IDs (1-30) and activities (1-6, e.g. "WALKING")
  - Uses lappply to calculate the mean for all variables of each unique combination.
  - 30 Subjects, each one performing 6 activities (30*6=180), each with the mean of their 68 variables results in a tidy data set of dimensions 180 rows and 68 columns
  - Orders the data set based on subject ID and activity label.

> STEP 5 COMPLETE: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

