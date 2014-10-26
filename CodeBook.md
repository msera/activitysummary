Summary of Activity Data
========================

The input data used in this project was produced in experiments by a group of 30 volunteers  
(subjects). Each subject performed six activities wearing a smartphone. The purpose of this project is to  
summarize the averages of a subset of measurements. The averages are grouped by activity and subject.


Variables:
==========

- Activity: the type of activity the volunteers performed. Values are: WALKING, WALKING_UPSTAIRS,  
WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING

- Subject: a number between 1 and 30 representing the volunteer id

- Measurements: averages of all mean and standard deviation variables in the experiments. Each measurement  
represents an experiment with a combination of the following characteristics:
	- Signal: Time, Frequency
	- Component: Accelerometer, Gyroscope
	- Acceleration: Body, Gravity
	- Axis: X, Y, Z
	- Transformations: Jerk, Magnitude 

Input Files:
=================

The original input files can be found here:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The underlying data is contained in a set of files. One set for training data and the other for test data.  
The set of files for train is:
- 'train/X_train.txt': Training measurement results set.
- 'train/y_train.txt': Training activity id.
- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window  
sample. Its range is from 1 to 30. 

A similar set of files is available for test data.

Two additional files applicable to both sets of data:
- 'features_info.txt': provides the headers for the measurement results set.
- 'activity_labels.txt': Links the activity numbers with their activity name.


Transformations:
================

- Load the measurements data in the train and test files and combine them using rbind resulting in a  data frame.
- Add column headers to the data frame by setting colnames() with the data from the features_info  
file.
- Select a subset of measurements to include only means and standard deviation data.
- Load the activity and subject data to generate two new columns. One for activity number and the  
other for subject number. Add these two columns to the data frame.
- Map the activity represented as a number between 1-6 to activity label by looking up the  
activity number in the activity label lookup table using the merge function. Drop the original  
numeric activity. As a result the data frame includes descriptive activities rather than  
numeric values.
- Replace the original column names with more descriptive names by substituting abbreviated names with  
full names and removing '-' signs.
- Create a summary tidy data set with the average of each variable for each activity and each subject using  
group_by and chained commands from the dplyr package.
- Write the summary tidy data to a tab delimited file: SummaryActivity.txt
   


