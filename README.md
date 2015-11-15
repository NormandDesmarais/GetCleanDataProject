# GetCleanDataProject
Getting and Cleaning Data Course's Project

##File list
This repository contains the R script and the code book for Getting and Cleaning Data course's project.

+ **CodeBook.md**: This code book describes the variables contained in the summary data set produced by *run_analysis.R*. It also list the transformations performed in order to obtain the final summary.
+ **README.md**: This file.
+ **run_analysis.R**: The R script that performs the analysis on the `Human Activity Recognition Using Smartphones`' original data set to produce a summary of the average measure per activity for each subject and for a set of selected measurement variables from the original data set (read *CodeBook.md* for more details).

##Processing 
The original data set was obtained from [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip), and the following operations were performed to obtain a summary per activity for each subject:

+ 1) The test and training data sets are merged into one data set.
+ 2) Only the Standard Deviation (**-std()**) and Mean Value (**-mean()**) measurement variables are kept (other variables are discarded from the analysis).
+ 3) Activities ID are replaced with their human readable names (as provided by the file *activity_labels.txt*).
+ 4) The feature's names from the file *features.txt* are used to name the selected measurement variable's, but abbreviations are expanded into their human readable version. (For example, the variable name **tBodyAcc-mean()-X** from the original data set is replaced by **TimeBodyAccelerationMeanValue_Xaxis** in the summary data set.)

Abbreviaton  | Is Replaced by
------------ | -----------------
*leading* t  | Time
*leading* f  | Frequency
Acc          | Acceleration
Gyro         | Gyroscope
Mag          | Magnitude
-std()       | StandardDeviation
-mean()      | MeanValue
-X, -Y, -Z   | _Xaxis, _Yaxis, _Zaxis
BodyBody     | Body (removing double occurence from original variable name)

+ 5) Finally, using this new table, a summary table containing the average value of each measurement per activity for each subject is generated. It is written in a text file named  *measurements_summary.txt*. The R code used to create this table, *run_analysis()*, also returns the summary table after completion.


