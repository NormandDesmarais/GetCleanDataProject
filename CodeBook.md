#Human Activity Recognition Using Smartphones' Summary Data Set
## Description
This is a summary of the *standard deviation* and *mean value* measurement variables from the Human Activity Recognition Using Smartphones Data Set from UCI Machine Learning Repository. More details on the original data set are available [here](https://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

The summary presented here shows, for the selected measurements, the average value of all measurements per activity for each subject. Hence each subject (represented by his **SubjectID**) has 6 rows, one for each **Activity**.

##Data Cleaning
The original data set was obtained from  [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip), and the following operations were performed to obtain the summary:

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
BodyBody     | Body (removing double occurence from original varibale name)

+ 5) Finally, using this new table, a summary table containing the average value of each measurement per activity for each subject is generated. It is written into a text file named: *measurements_summary.txt*. The R code used to create this table, *run_analysis()*, also returns the summary table after completion.

##Original data set information
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

##Code Book
Here are the names of variables used in the summary data set. The original variable names are provided as a cross reference.

In what follows, the following apply:
+ variable name starting with **Time** means that the value expressed is time dependent and a direct result of measurement.
+ variable name starting with **Frequency** means that the value expressed is frequency dependent and obtained after applying FFT over the corresponding Time dependent measurments.
+ Jerk signal is the measure of change of acceleration, hence it is obtained as the derivative of acceleration with respect to time (units: m/s^3), or angulare acceleration with respect to time (units: radians/s^3).
+ Magnitude stands for the basic vector onto which the Jerk signal is projected (these values have hence no unit).

###Subject_ID
* **Original name**: The only variable of the files *subject_test.txt* and *subject_train.txt*.
* **Value type**: integer value
* **Units**: Not applicable
* **Description**: A unique ID identifying the subject performing the activity (a value from 1 to 30).

###Activity
* **Original name**: The only variable of the files *y_test.txt* and *y_train.txt*. Appears as an activity ID, which relationship to the activity name is provided by the file *activity_labels.txt*.
* **Value type**: character string
* **Units**: Not applicable
* **Description**: The name of the activity being performed by the subject. Possible values are: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING.

###TimeBodyAccelerationMeanValue_Xaxis (Yaxis, Zaxis)
* **Original name**: *tBodyAcc-mean()-X* (*Y*, *Z*)
* **Value type**: double
* **Units**: g (standard gravity units: 9.80665 m/s^2)
* **Description**: The X axis component of the mean value of the body acceleration obtained from the accelerometer measurements. The same variable exists for the Y and Z axis.

###TimeBodyAccelerationStandardDeviation_Xaxis (Yaxis, Zaxis)
* **Original name**: *tBodyAcc-std()-X* (*Y*, *Z*)
* **Value type**: double
* **Units**: g (standard gravity units: 9.80665 m/s^2)
* **Description**: The X axis component of the standard deviation of the body acceleration obtained from the accelerometer measurements. The same variable exists for the Y and Z axis.

###TimeGravityAccelerationMeanValue_Xaxis (Yaxis, Zaxis)
* **Original name**: *tGravityAcc-mean()-X* (*Y*, *Z*)
* **Value type**: double
* **Units**: g (standard gravity units: 9.80665 m/s^2)
* **Description**: The X axis component of the mean value of the gravity acceleration as deduced from the accelerometer measurements. The same variable exists for the Y and Z axis.

###TimeGravityAccelerationStandardDeviation_Xaxis (Yaxis, Zaxis)
* **Original name**: *tGravityAcc-std()-X* (*Y*, *Z*)
* **Value type**: double
* **Units**: g (standard gravity units: 9.80665 m/s^2)
* **Description**: The X axis component of the standard deviation of the gravity acceleration as deduced from the accelerometer measurements. The same variable exists for the Y and Z axis.

###TimeBodyAccelerationJerkMeanValue_Xaxis (Yaxis, Zaxis)
* **Original name**: *tBodyAccJerk-mean()-X* (*Y*, *Z*)
* **Value type**: double
* **Units**: m/s^3
* **Description**: The X axis component of the mean value of the body acceleration's Jerk signal. The same variable exists for the Y and Z axis.

###TimeBodyAccelerationJerkStandardDeviation_Xaxis (Yaxis, Zaxis)
* **Original name**: *tBodyAccJerk-std()-X* (*Y*, *Z*)
* **Value type**: double
* **Units**: m/s^3
* **Description**: The X axis component of the standard deviation of the body acceleration's Jerk signal. The same variable exists for the Y and Z axis.

###TimeBodyGyroscopeMeanValue_Xaxis (Yaxis, Zaxis)
* **Original name**: *tBodyGyro-mean()-X* (*Y*, *Z*)
* **Value type**: double
* **Units**: radians/s
* **Description**: The X axis component of the mean value of the body angular velocity obtained from the gyroscope measurements. The same variable exists for the Y and Z axis.

###TimeBodyGyroscopeStandardDeviation_Xaxis (Yaxis, Zaxis)
* **Original name**: *tBodyGyro-std()-X* (*Y*, *Z*)
* **Value type**: double
* **Units**: radians/s
* **Description**: The X axis component of the standard deviation of the body angular velocity obtained from the gyroscope measurements. The same variable exists for the Y and Z axis.

###TimeBodyGyroscopeJerkMeanValue_Xaxis (Yaxis, Zaxis)
* **Original name**: *tBodyGyroJerk-mean()-X* (*Y*, *Z*)
* **Value type**: double
* **Units**: radians/s^3
* **Description**: The X axis component of the mean value of the body angular acceleration's Jerk signal. The same variable exists for the Y and Z axis.

###TimeBodyGyroscopeJerkStandardDeviation_Xaxis (Yaxis, Zaxis)
* **Original name**: *tBodyGyroJerk-std()-X* (*Y*, *Z*)
* **Value type**: double
* **Units**: radians/s^3
* **Description**: The X axis component of the standard deviation of the body angular acceleration's Jerk signal. The same variable exists for the Y and Z axis.

###TimeBodyAccelerationMagnitudeMeanValue
* **Original name**: *tBodyAccMag-mean()*
* **Value type**: double
* **Units**: no unit
* **Description**: The mean value of the magnitude along the body acceleration vector.

###TimeBodyAccelerationMagnitudeStandardDeviation
* **Original name**: *tBodyAccMag-std()*
* **Value type**: double
* **Units**: no unit
* **Description**: The standard deviation of the magnitude along the body acceleration vector.

###TimeGravityAccelerationMagnitudeMeanValue
* **Original name**: *tGravityAccMag-mean()*
* **Value type**: double
* **Units**: no unit
* **Description**: The mean value of the magnitude along the gravity acceleration vector.

###TimeGravityAccelerationMagnitudeStandardDeviation
* **Original name**: *tGravityAccMag-std()*
* **Value type**: double
* **Units**: no unit
* **Description**: The standard deviation of the magnitude along the gravity acceleration vector.

###TimeBodyAccelerationJerkMagnitudeMeanValue
* **Original name**: *tBodyAccJerkMag-mean()*
* **Value type**: double
* **Units**: no unit
* **Description**: The mean value of the magnitude along the body acceleration's Jerk vector.

###TimeBodyAccelerationJerkMagnitudeStandardDeviation
* **Original name**: *tBodyAccJerkMag-std()*
* **Value type**: double
* **Units**: no unit
* **Description**: The standard deviation of the magnitude along the body acceleration's Jerk vector.

###TimeBodyGyroscopeMagnitudeMeanValue
* **Original name**: *tBodyGyroMag-mean()*
* **Value type**: double
* **Units**: no unit
* **Description**: The mean value of the magnitude along the body angular velocity vector.

###TimeBodyGyroscopeMagnitudeStandardDeviation
* **Original name**: *tBodyGyroMag-std()*
* **Value type**: double
* **Units**: no unit
* **Description**: The standard deviation of the magnitude along the body angular velocity vector.

###TimeBodyGyroscopeJerkMagnitudeMeanValue
* **Original name**: *tBodyGyroJerkMag-mean()*
* **Value type**: double
* **Units**: no unit
* **Description**: The mean value of the magnitude along the body angular acceleration's Jerk vector.

###TimeBodyGyroscopeJerkMagnitudeStandardDeviation
* **Original name**: *tBodyGyroJerkMag-std()*
* **Value type**: double
* **Units**: no unit
* **Description**: The standard deviation of the magnitude along the body angular acceleration's Jerk vector.

###FrequencyBodyAccelerationMeanValue_Xaxis (Yaxis, Zaxis)
* **Original name**: *fBodyAcc-mean()-X* (*Y*, *Z*)
* **Value type**: double
* **Units**: g (standard gravity units: 9.80665 m/s^2)
* **Description**: The frequency dependent value of the X axis component of the mean value of the body acceleration. The same variable exists for the Y and Z axis.

###FrequencyBodyAccelerationStandardDeviation_Xaxis (Yaxis, Zaxis)
* **Original name**: *fBodyAcc-std()-X* (*Y*, *Z*)
* **Value type**: double
* **Units**: g (standard gravity units: 9.80665 m/s^2)
* **Description**: The frequency dependent value of the X axis component of the standard deviation of the body acceleration. The same variable exists for the Y and Z axis.

###FrequencyBodyAccelerationJerkMeanValue_Xaxis (Yaxis, Zaxis)
* **Original name**: *fBodyAccJerk-mean()-X* (*Y*, *Z*)
* **Value type**: double
* **Units**: m/s^3
* **Description**: The frequency dependent value of the X axis component of the mean value of the body acceleration's Jerk signal. The same variable exists for the Y and Z axis.

###FrequencyBodyAccelerationJerkStandardDeviation_Xaxis (Yaxis, Zaxis)
* **Original name**: *fBodyAccJerk-std()-X* (*Y*, *Z*)
* **Value type**: double
* **Units**: m/s^3
* **Description**: The frequency dependent value of the X axis component of the standard deviation of the body acceleration's Jerk signal. The same variable exists for the Y and Z axis.

###FrequencyBodyGyroscopeMeanValue_Xaxis (Yaxis, Zaxis)
* **Original name**: *fBodyGyro-mean()-X* (*Y*, *Z*)
* **Value type**: double
* **Units**: radians/s
* **Description**: The frequency dependent value of the X axis component of the mean value of the body angular velocity. The same variable exists for the Y and Z axis.

###FrequencyBodyGyroscopeStandardDeviation_Xaxis (Yaxis, Zaxis)
* **Original name**: *fBodyGyro-std()-X* (*Y*, *Z*)
* **Value type**: double
* **Units**: radians/s
* **Description**: The frequency dependent value of the X axis component of the standard deviation of the body angular velocity. The same variable exists for the Y and Z axis.

###FrequencyBodyAccelerationMagnitudeMeanValue
* **Original name**: *fBodyAccMag-mean()*
* **Value type**: double
* **Units**:  no unit
* **Description**: The frequency dependent value of the mean value of the magnitude along the body acceleration vector.

###FrequencyBodyAccelerationMagnitudeStandardDeviation
* **Original name**: *fBodyAccMag-std()*
* **Value type**: double
* **Units**:  no unit
* **Description**: The frequency dependent value of the standard deviation of the magnitude along the body acceleration vector.

###FrequencyBodyAccelerationJerkMagnitudeMeanValue
* **Original name**: *fBodyBodyAccJerkMag-mean()*
* **Value type**: double
* **Units**:  no unit
* **Description**: The frequency dependent value of the mean value of the magnitude along the body acceleration's Jerk vector.

###FrequencyBodyAccelerationJerkMagnitudeStandardDeviation
* **Original name**: *fBodyBodyAccJerkMag-std()*
* **Value type**: double
* **Units**:  no unit
* **Description**: The frequency dependent value of the standard deviation of the magnitude along the body acceleration's Jerk vector.

###FrequencyBodyGyroscopeMagnitudeMeanValue
* **Original name**: *fBodyBodyGyroMag-mean()*
* **Value type**: double
* **Units**:  no unit
* **Description**: The frequency dependent value of the mean value of the magnitude along the body angular velocity vector.

###FrequencyBodyGyroscopeMagnitudeStandardDeviation
* **Original name**: *fBodyBodyGyroMag-std()*
* **Value type**: double
* **Units**:  no unit
* **Description**: The frequency dependent value of the standard deviation of the magnitude along the body angular velocity vector.

###FrequencyBodyGyroscopeJerkMagnitudeMeanValue
* **Original name**: *fBodyBodyGyroJerkMag-mean()*
* **Value type**: double
* **Units**:  no unit
* **Description**: The frequency dependent value of the mean value of the magnitude along the body angular acceleration's Jerk vector.

###FrequencyBodyGyroscopeJerkMagnitudeStandardDeviation
* **Original name**: *fBodyBodyGyroJerkMag-std()*
* **Value type**: double
* **Units**:  no unit
* **Description**: The frequency dependent value of the standard deviation of the magnitude along the body angular acceleration's Jerk vector.

