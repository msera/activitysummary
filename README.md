Goal
====
Summary of activity data produced in experiments by volunteers wearing smartphones. The data includes: type of activity, volunteer(subject) number, and various measurements produced in the experiment.


Setup
=====
Download and unzip the following set of files.
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

Copy the files and directories from the unzipped "getdata-projectfiles-UCI HAR Dataset" directory to your  
working directory.

Install the R package dplyr (if not installed already)

Running the code
================
Run the R code in run_analysis.R

The code reads the input files, merges them to produce one dataset, selects a subset of measurements, replaces variable names with descriptive names, and summarizes the average of measurements by activity and subject.

Output
======
A results tab delimited file is created in the working directory. 
File name: SummaryActivit.txt

See the CodeBook.md file for detailed description of the variables in the output file and transformations performed.
