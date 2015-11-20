#Summary data set on Human Activity Recognition Using Smartphones
## Project Description
The goal of this project is to create a summary of the *standard deviation* and *mean value* measurement variables from the `Human Activity Recognition Using Smartphones` Data Set from UCI Machine Learning Repository. More details on the original data set can be found [here](https://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

The summary presented here shows, for the selected measurement variables, the average value of all measurements per activity for each subject. Hence each subject (represented by his **SubjectID**) has 6 rows, one for each **Activity**.

##Study design and data processing
###Collection of the raw data
The original data set (the raw data from our view point) was obtained from  [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).

###Notes on the original (raw) data
The original raw data is a collection of measurements from an experiment on human activity recognition based on a smartphone accelerometer and gyroscope signals.

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, the experimenters captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained (original) dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

##Creating the tidy datafile
###Guide to create the tidy data file
1. dowload the original (raw) dataset from [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
2. uncompress the downloaded data file into your R working directory
3. within the R console, make sure that the package `dplyr` from CRAN has been installed. If not install it with the command `install.packages(dplyr)`.
4. within the R console, source the script *run_analysis.R* (from this GIT repository)
5. within the R console, run the function *run_analysis()*
6. the resulting tidy data file (*measurements_summary.txt*)  will be saved in your working directory after execution

###Cleaning of the data
The following operations were performed to obtain the summary leading to the tidy data file (*measurements_summary.txt*):

1. The test and training data sets from the original (raw) data set are merged into one data set.
2. Only the Standard Deviation (**-std()**) and Mean Value (**-mean()**) measurement variables are kept (other variables are discarded from the analysis).
3. Activities ID are replaced with their human readable names (as provided by the file *activity_labels.txt*).
4. The measurement variable's names are modified so that all abbreviations are expanded into their human readable version. See the table below for a complete list of changes. (For example, the variable name **tBodyAcc-mean()-X** from the original (raw) data set is replaced by **TimeBodyAccelerationMeanValue_Xaxis** in the summary data set.)
5. Finally, using this cleaned table, a summary table (the so called "tidy data set") is created. It contains, for each subject, the average value of each measurement per activity. The resultinf "tidy data set" is written into a text file named: *measurements_summary.txt*.


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
BodyBody     | Body (removing double occurence from original varibale name)


For more details on the code processing, please see the [README.md](https://github.com/NormandDesmarais/GetCleanDataProject/blob/master/README.md) file.

##Description of the variables in the measurements_summary.txt file
+ Data set dimensions: 180 observables and 68 variables.
+ Summary of the data: this data set contains for each subject ID, the average value per activity of a selected set of 66 measurement variables from the original (raw) data set on Human Activity Recognition Using Smartphones.
+ Variables present in the data set: The two first variabels represent the subject ID and the activity performed. The 66 other variables are the subset of mean value and standard deviation measurement variables from the original (raw) data set. These measurement variables describe the body acceleration, the gravity acceleration, the body angular velocy as well as the derived Jerk signal and it's projected magnitude on different vectors. 

###General comment
+ variable name starting with **Time** means that the value is time dependent.
+ variable name starting with **Frequency** means that the value is frequency dependent and was obtained after applying FFT over the corresponding Time dependent measurements.
+ Jerk signal is the measure of change of acceleration with time, hence it is obtained as the derivative of acceleration with respect to time, or angulare acceleration with respect to time.
+ Magnitude stands for the length of the corresponding vector.

###Subject_ID
* **Original name**: The only variable of the files *subject_test.txt* and *subject_train.txt*.
* **Class**: integer
* **Unique values**: 1-30
* **Units**: Not applicable
* **Description**: A unique ID identifying the subject performing the activity.

###Activity
* **Original name**: The only variable of the files *y_test.txt* and *y_train.txt*. Appears as an activity ID, which relationship to the activity name is provided by the file *activity_labels.txt*.
* **Class**: Factor
* **Unique values**: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
* **Units**: Not applicable
* **Description**: The name of the activity being performed by the subject.

###TimeBodyAccelerationMeanValue_Xaxis (Yaxis, Zaxis)
* **Original name**: *tBodyAcc-mean()-X* (*Y*, *Z*)
* **Class**: numeric (double)
* **Units**: none
* **Description**: The X axis component of the mean value of the body acceleration obtained from the accelerometer measurements. The same variable exists for the Y and Z axis.

###TimeBodyAccelerationStandardDeviation_Xaxis (Yaxis, Zaxis)
* **Original name**: *tBodyAcc-std()-X* (*Y*, *Z*)
* **Class**: numeric (double)
* **Units**: none
* **Description**: The X axis component of the standard deviation of the body acceleration obtained from the accelerometer measurements. The same variable exists for the Y and Z axis.

###TimeGravityAccelerationMeanValue_Xaxis (Yaxis, Zaxis)
* **Original name**: *tGravityAcc-mean()-X* (*Y*, *Z*)
* **Class**: numeric (double)
* **Units**: none
* **Description**: The X axis component of the mean value of the gravity acceleration as deduced from the accelerometer measurements. The same variable exists for the Y and Z axis.

###TimeGravityAccelerationStandardDeviation_Xaxis (Yaxis, Zaxis)
* **Original name**: *tGravityAcc-std()-X* (*Y*, *Z*)
* **Class**: numeric (double)
* **Units**: none
* **Description**: The X axis component of the standard deviation of the gravity acceleration as deduced from the accelerometer measurements. The same variable exists for the Y and Z axis.

###TimeBodyAccelerationJerkMeanValue_Xaxis (Yaxis, Zaxis)
* **Original name**: *tBodyAccJerk-mean()-X* (*Y*, *Z*)
* **Class**: numeric (double)
* **Units**: none
* **Description**: The X axis component of the mean value of the body acceleration's Jerk signal. The same variable exists for the Y and Z axis.

###TimeBodyAccelerationJerkStandardDeviation_Xaxis (Yaxis, Zaxis)
* **Original name**: *tBodyAccJerk-std()-X* (*Y*, *Z*)
* **Class**: numeric (double)
* **Units**: none
* **Description**: The X axis component of the standard deviation of the body acceleration's Jerk signal. The same variable exists for the Y and Z axis.

###TimeBodyGyroscopeMeanValue_Xaxis (Yaxis, Zaxis)
* **Original name**: *tBodyGyro-mean()-X* (*Y*, *Z*)
* **Class**: numeric (double)
* **Units**: none
* **Description**: The X axis component of the mean value of the body angular velocity obtained from the gyroscope measurements. The same variable exists for the Y and Z axis.

###TimeBodyGyroscopeStandardDeviation_Xaxis (Yaxis, Zaxis)
* **Original name**: *tBodyGyro-std()-X* (*Y*, *Z*)
* **Class**: numeric (double)
* **Units**: none
* **Description**: The X axis component of the standard deviation of the body angular velocity obtained from the gyroscope measurements. The same variable exists for the Y and Z axis.

###TimeBodyGyroscopeJerkMeanValue_Xaxis (Yaxis, Zaxis)
* **Original name**: *tBodyGyroJerk-mean()-X* (*Y*, *Z*)
* **Class**: numeric (double)
* **Units**: none
* **Description**: The X axis component of the mean value of the body angular acceleration's Jerk signal. The same variable exists for the Y and Z axis.

###TimeBodyGyroscopeJerkStandardDeviation_Xaxis (Yaxis, Zaxis)
* **Original name**: *tBodyGyroJerk-std()-X* (*Y*, *Z*)
* **Class**: numeric (double)
* **Units**: none
* **Description**: The X axis component of the standard deviation of the body angular acceleration's Jerk signal. The same variable exists for the Y and Z axis.

###TimeBodyAccelerationMagnitudeMeanValue
* **Original name**: *tBodyAccMag-mean()*
* **Class**: numeric (double)
* **Units**: none
* **Description**: The mean value of the magnitude along the body acceleration vector.

###TimeBodyAccelerationMagnitudeStandardDeviation
* **Original name**: *tBodyAccMag-std()*
* **Class**: numeric (double)
* **Units**: none
* **Description**: The standard deviation of the magnitude along the body acceleration vector.

###TimeGravityAccelerationMagnitudeMeanValue
* **Original name**: *tGravityAccMag-mean()*
* **Class**: numeric (double)
* **Units**: none
* **Description**: The mean value of the magnitude along the gravity acceleration vector.

###TimeGravityAccelerationMagnitudeStandardDeviation
* **Original name**: *tGravityAccMag-std()*
* **Class**: numeric (double)
* **Units**: none
* **Description**: The standard deviation of the magnitude along the gravity acceleration vector.

###TimeBodyAccelerationJerkMagnitudeMeanValue
* **Original name**: *tBodyAccJerkMag-mean()*
* **Class**: numeric (double)
* **Units**: none
* **Description**: The mean value of the magnitude along the body acceleration's Jerk vector.

###TimeBodyAccelerationJerkMagnitudeStandardDeviation
* **Original name**: *tBodyAccJerkMag-std()*
* **Class**: numeric (double)
* **Units**: none
* **Description**: The standard deviation of the magnitude along the body acceleration's Jerk vector.

###TimeBodyGyroscopeMagnitudeMeanValue
* **Original name**: *tBodyGyroMag-mean()*
* **Class**: numeric (double)
* **Units**: none
* **Description**: The mean value of the magnitude along the body angular velocity vector.

###TimeBodyGyroscopeMagnitudeStandardDeviation
* **Original name**: *tBodyGyroMag-std()*
* **Class**: numeric (double)
* **Units**: none
* **Description**: The standard deviation of the magnitude along the body angular velocity vector.

###TimeBodyGyroscopeJerkMagnitudeMeanValue
* **Original name**: *tBodyGyroJerkMag-mean()*
* **Class**: numeric (double)
* **Units**: none
* **Description**: The mean value of the magnitude along the body angular acceleration's Jerk vector.

###TimeBodyGyroscopeJerkMagnitudeStandardDeviation
* **Original name**: *tBodyGyroJerkMag-std()*
* **Class**: numeric (double)
* **Units**: none
* **Description**: The standard deviation of the magnitude along the body angular acceleration's Jerk vector.

###FrequencyBodyAccelerationMeanValue_Xaxis (Yaxis, Zaxis)
* **Original name**: *fBodyAcc-mean()-X* (*Y*, *Z*)
* **Class**: numeric (double)
* **Units**: none
* **Description**: The frequency dependent value of the X axis component of the mean value of the body acceleration. The same variable exists for the Y and Z axis.

###FrequencyBodyAccelerationStandardDeviation_Xaxis (Yaxis, Zaxis)
* **Original name**: *fBodyAcc-std()-X* (*Y*, *Z*)
* **Class**: numeric (double)
* **Units**: none
* **Description**: The frequency dependent value of the X axis component of the standard deviation of the body acceleration. The same variable exists for the Y and Z axis.

###FrequencyBodyAccelerationJerkMeanValue_Xaxis (Yaxis, Zaxis)
* **Original name**: *fBodyAccJerk-mean()-X* (*Y*, *Z*)
* **Class**: numeric (double)
* **Units**: none
* **Description**: The frequency dependent value of the X axis component of the mean value of the body acceleration's Jerk signal. The same variable exists for the Y and Z axis.

###FrequencyBodyAccelerationJerkStandardDeviation_Xaxis (Yaxis, Zaxis)
* **Original name**: *fBodyAccJerk-std()-X* (*Y*, *Z*)
* **Class**: numeric (double)
* **Units**: none
* **Description**: The frequency dependent value of the X axis component of the standard deviation of the body acceleration's Jerk signal. The same variable exists for the Y and Z axis.

###FrequencyBodyGyroscopeMeanValue_Xaxis (Yaxis, Zaxis)
* **Original name**: *fBodyGyro-mean()-X* (*Y*, *Z*)
* **Class**: numeric (double)
* **Units**: none
* **Description**: The frequency dependent value of the X axis component of the mean value of the body angular velocity. The same variable exists for the Y and Z axis.

###FrequencyBodyGyroscopeStandardDeviation_Xaxis (Yaxis, Zaxis)
* **Original name**: *fBodyGyro-std()-X* (*Y*, *Z*)
* **Class**: numeric (double)
* **Units**: none
* **Description**: The frequency dependent value of the X axis component of the standard deviation of the body angular velocity. The same variable exists for the Y and Z axis.

###FrequencyBodyAccelerationMagnitudeMeanValue
* **Original name**: *fBodyAccMag-mean()*
* **Class**: numeric (double)
* **Units**: none
* **Description**: The frequency dependent value of the mean value of the magnitude along the body acceleration vector.

###FrequencyBodyAccelerationMagnitudeStandardDeviation
* **Original name**: *fBodyAccMag-std()*
* **Class**: numeric (double)
* **Units**: none
* **Description**: The frequency dependent value of the standard deviation of the magnitude along the body acceleration vector.

###FrequencyBodyAccelerationJerkMagnitudeMeanValue
* **Original name**: *fBodyBodyAccJerkMag-mean()*
* **Class**: numeric (double)
* **Units**: none
* **Description**: The frequency dependent value of the mean value of the magnitude along the body acceleration's Jerk vector.

###FrequencyBodyAccelerationJerkMagnitudeStandardDeviation
* **Original name**: *fBodyBodyAccJerkMag-std()*
* **Class**: numeric (double)
* **Units**: none
* **Description**: The frequency dependent value of the standard deviation of the magnitude along the body acceleration's Jerk vector.

###FrequencyBodyGyroscopeMagnitudeMeanValue
* **Original name**: *fBodyBodyGyroMag-mean()*
* **Class**: numeric (double)
* **Units**: none
* **Description**: The frequency dependent value of the mean value of the magnitude along the body angular velocity vector.

###FrequencyBodyGyroscopeMagnitudeStandardDeviation
* **Original name**: *fBodyBodyGyroMag-std()*
* **Class**: numeric (double)
* **Units**: none
* **Description**: The frequency dependent value of the standard deviation of the magnitude along the body angular velocity vector.

###FrequencyBodyGyroscopeJerkMagnitudeMeanValue
* **Original name**: *fBodyBodyGyroJerkMag-mean()*
* **Class**: numeric (double)
* **Units**: none
* **Description**: The frequency dependent value of the mean value of the magnitude along the body angular acceleration's Jerk vector.

###FrequencyBodyGyroscopeJerkMagnitudeStandardDeviation
* **Original name**: *fBodyBodyGyroJerkMag-std()*
* **Class**: numeric (double)
* **Units**: none
* **Description**: The frequency dependent value of the standard deviation of the magnitude along the body angular acceleration's Jerk vector.

