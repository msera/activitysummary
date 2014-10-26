Summary of Activity Data
========================

The underlying data used in this project was produced in experiments by a group of 30 volunteers  
(subjects). Each subject performed activities wearing a smartphone. The purpose of this project is to  
summarize the averages of a subset of measurements. The averages are grouped by activity and subject.

The underlying data can be found here:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 


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

Underlying Files:
=================

The underlying data is contained in a set of files. One set for training data and the other for test data.  
The set of files for train is:
- 'train/X_train.txt': Training measurement results set.
- 'train/y_train.txt': Training activity id.
- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window  
sample. Its range is from 1 to 30. 
A similar set of files is available for test data.
Two additional files applicable to bother sets of data:
- 'features_info.txt': provides the headers for the measurement results set.
- 'activity_labels.txt': Links the activity numbers with their activity name.


Transformations:
================

- The measurements data in the train and test files were loaded and appended using rbind resulting in a  
combined data frame.
- Column headers were added to the data frame by setting colnames() with the data from the features_info  
file.
- A subset of measurements was selected to include only means and standard deviation data.
- The activity and subject data were loaded to generate two new columns on for activity number and the  
other for subject number that were added to the data frame.
- The activity represented as a number between 1-6 was converted to activity label by looking up the  
activity number in the features info lookup table. This was done using the merge function. The original  
numeric activity was then dropped. As a result the data frame includes descriptive activities rather than  
numeric values.
- The original column names were replaced by more descriptive names by substituting abbreviated names with  
full names and removing '-' signs.
- Created a tidy data set with the average of each variable for each activity and each subject using  
group_by from the dplyr package.
   


