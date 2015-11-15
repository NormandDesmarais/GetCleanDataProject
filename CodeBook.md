#Human Activity Recognition Using Smartphones' Summary Data Set
## Description
This is a summary of the *standard deviation* and *mean value* measurement variables from the Human Activity Recognition Using Smartphones Data Set from UCI Machine Learning Repository. More details on the original data set are available  [here](https://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

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

+ 5) Finally, using this new table, a summary table containing the average value of each measurement per activity for each subject is generated. It is written in a text file named  *measurements_summary.txt*. The R code used to create this table, *run_analysis()*, also returns the summary table after completion.

##Original data set information
###Experiment
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

###Feature Selection
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals *tAcc-XYZ* and *tGyro-XYZ*. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (*tBodyAcc-XYZ* and *tGravityAcc-XYZ*) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (*tBodyAccJerk-XYZ* and *tBodyGyroJerk-XYZ*). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (*tBodyAccMag*, *tGravityAccMag*, *tBodyAccJerkMag*, *tBodyGyroMag*, *tBodyGyroJerkMag*). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing *fBodyAcc-XYZ*, *fBodyAccJerk-XYZ*, *fBodyGyro-XYZ*, *fBodyAccJerkMag*, *fBodyGyroMag*, *fBodyGyroJerkMag*. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

* mean(): Mean value
* std(): Standard deviation
* mad(): Median absolute deviation 
* max(): Largest value in array
* min(): Smallest value in array
* sma(): Signal magnitude area
* energy(): Energy measure. Sum of the squares divided by the number of values. 
* iqr(): Interquartile range 
* entropy(): Signal entropy
* arCoeff(): Autorregresion coefficients with Burg order equal to 4
* correlation(): correlation coefficient between two signals
* maxInds(): index of the frequency component with largest magnitude
* meanFreq(): Weighted average of the frequency components to obtain a mean frequency
* skewness(): skewness of the frequency domain signal 
* kurtosis(): kurtosis of the frequency domain signal 
* bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
* angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

* gravityMean
* tBodyAccMean
* tBodyAccJerkMean
* tBodyGyroMean
* tBodyGyroJerkMean

The complete list of variables of each feature vector is available in 'features.txt'

##Code Book
Here are the names of variables used in the summary data set. The original variable names are provided as a reference.

###Subject_ID
* **Original name**: The only variable of the files *subject_test.txt* and *subject_train.txt*.
* **Meaning**: A unique ID identifying the subject of a recorded set of measurements.
* **Value type**: integer value

###Activity
* **Original name**: The only variable of the files *y_test.txt* and *y_train.txt*. Appears as an activity ID, which relationship to the activity name is provided by the file *activity_labels.txt*.
* **Meaning**: The name of the activity being performed by the subject when the set of measurements where being recorded. Possible values are: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING.
* **Value type**: character string

###TimeBodyAccelerationMeanValue_Xaxis (Yaxis, Zaxis)
* **Original name**: *tBodyAcc-mean()-X* (*Y*, *Z*)
* **Meaning**: The time dependent body acceleration mean value projected on the X axis, as deduced from the accelerometer measurements. The same variable exists for the Y and Z axis.
* **Value type**: double

###TimeBodyAccelerationStandardDeviation_Xaxis (Yaxis, Zaxis)
* **Original name**: *tBodyAcc-std()-X* (*Y*, *Z*)
* **Meaning**: The time dependent body acceleration standard deviation projected on the X axis, as deduced from the accelerometer measurements. The same variable exists for the Y and Z axis.
* **Value type**: double

###TimeGravityAccelerationMeanValue_Xaxis (Yaxis, Zaxis)
* **Original name**: *tGravityAcc-mean()-X* (*Y*, *Z*)
* **Meaning**: The time dependent gravity acceleration mean value projected on the X axis, as deduced from the accelerometer measurements. The same variable exists for the Y and Z axis.
* **Value type**: double

###TimeGravityAccelerationStandardDeviation_Xaxis (Yaxis, Zaxis)
* **Original name**: *tGravityAcc-std()-X* (*Y*, *Z*)
* **Meaning**: The time dependent gravity acceleration standard deviation projected on the X axis, as deduced from the accelerometer measurements. The same variable exists for the Y and Z axis.
* **Value type**: double

###TimeBodyAccelerationJerkMeanValue_Xaxis (Yaxis, Zaxis)
* **Original name**: *tBodyAccJerk-mean()-X* (*Y*, *Z*)
* **Meaning**: The time dependent body acceleration Jerk signal mean value projected on the X axis, as deduced from the accelerometer measurements. The same variable exists for the Y and Z axis.
* **Value type**: double

###TimeBodyAccelerationJerkStandardDeviation_Xaxis (Yaxis, Zaxis)
* **Original name**: *tBodyAccJerk-std()-X* (*Y*, *Z*)
* **Meaning**: The time dependent body acceleration Jerk signal standard deviation projected on the X axis, as deduced from the accelerometer measurements. The same variable exists for the Y and Z axis.
* **Value type**: double

###TimeBodyGyroscopeMeanValue_Xaxis (Yaxis, Zaxis)
* **Original name**: *tBodyGyro-mean()-X* (*Y*, *Z*)
* **Meaning**: The time dependent body angular velocity mean value projected on the X axis, as deduced from the gyroscope measurements. The same variable exists for the Y and Z axis.
* **Value type**: double

###TimeBodyGyroscopeStandardDeviation_Xaxis (Yaxis, Zaxis)
* **Original name**: *tBodyGyro-std()-X* (*Y*, *Z*)
* **Meaning**: The time dependent body angular velocity standard deviation projected on the X axis, as deduced from the gyroscope measurements. The same variable exists for the Y and Z axis.
* **Value type**: double

###TimeBodyGyroscopeJerkMeanValue_Xaxis (Yaxis, Zaxis)
* **Original name**: *tBodyGyroJerk-mean()-X* (*Y*, *Z*)
* **Meaning**: The time dependent body angular velocity Jerk signal mean value projected on the X axis, as deduced from the gyroscope measurements. The same variable exists for the Y and Z axis.
* **Value type**: double

###TimeBodyGyroscopeJerkStandardDeviation_Xaxis (Yaxis, Zaxis)
* **Original name**: *tBodyGyroJerk-std()-X* (*Y*, *Z*)
* **Meaning**: The time dependent body angular velocity Jerk signal standard deviation projected on the X axis, as deduced from the gyroscope measurements. The same variable exists for the Y and Z axis.
* **Value type**: double

###TimeBodyAccelerationMagnitudeMeanValue
* **Original name**: *tBodyAccMag-mean()*
* **Meaning**: The time dependent body acceleration magnitude mean value, as deduced from the accelerometer measurements.
* **Value type**: double

###TimeBodyAccelerationMagnitudeStandardDeviation
* **Original name**: *tBodyAccMag-std()*
* **Meaning**: The time dependent body acceleration magnitude standard deviation, as deduced from the accelerometer measurements.
* **Value type**: double

###TimeGravityAccelerationMagnitudeMeanValue
* **Original name**: *tGravityAccMag-mean()*
* **Meaning**: The time dependent gravity acceleration magnitude mean value, as deduced from the accelerometer measurements.
* **Value type**: double

###TimeGravityAccelerationMagnitudeStandardDeviation
* **Original name**: *tGravityAccMag-std()*
* **Meaning**: The time dependent gravity acceleration magnitude standard deviation, as deduced from the accelerometer measurements.
* **Value type**: double

###TimeBodyAccelerationJerkMagnitudeMeanValue
* **Original name**: *tBodyAccJerkMag-mean()*
* **Meaning**: The time dependent body acceleration Jerk signal magnitude mean value, as deduced from the accelerometer measurements.
* **Value type**: double

###TimeBodyAccelerationJerkMagnitudeStandardDeviation
* **Original name**: *tBodyAccJerkMag-std()*
* **Meaning**: The time dependent body acceleration Jerk signal magnitude standard deviation, as deduced from the accelerometer measurements.
* **Value type**: double

###TimeBodyGyroscopeMagnitudeMeanValue
* **Original name**: *tBodyGyroMag-mean()*
* **Meaning**: The time dependent body angular velocity magnitude mean value, as deduced from the gyroscope measurements.
* **Value type**: double

###TimeBodyGyroscopeMagnitudeStandardDeviation
* **Original name**: *tBodyGyroMag-std()*
* **Meaning**: The time dependent body angular velocity magnitude standard deviation, as deduced from the gyroscope measurements.
* **Value type**: double

###TimeBodyGyroscopeJerkMagnitudeMeanValue
* **Original name**: *tBodyGyroJerkMag-mean()*
* **Meaning**: The time dependent body angular velocity Jerk signal magnitude mean value, as deduced from the gyroscope measurements.
* **Value type**: double

###TimeBodyGyroscopeJerkMagnitudeStandardDeviation
* **Original name**: *tBodyGyroJerkMag-std()*
* **Meaning**: The time dependent body angular velocity Jerk signal magnitude standard deviation, as deduced from the gyroscope measurements.
* **Value type**: double

###FrequencyBodyAccelerationMeanValue_Xaxis (Yaxis, Zaxis)
* **Original name**: *fBodyAcc-mean()-X* (*Y*, *Z*)
* **Meaning**: The frequency dependent body acceleration mean value projected on the X axis, as deduced from the accelerometer measurements. The same variable exists for the Y and Z axis.
* **Value type**: double

###FrequencyBodyAccelerationStandardDeviation_Xaxis (Yaxis, Zaxis)
* **Original name**: *fBodyAcc-std()-X* (*Y*, *Z*)
* **Meaning**: The frequency dependent body acceleration standard deviation projected on the X axis, as deduced from the accelerometer measurements. The same variable exists for the Y and Z axis.
* **Value type**: double

###FrequencyBodyAccelerationJerkMeanValue_Xaxis (Yaxis, Zaxis)
* **Original name**: *fBodyAccJerk-mean()-X* (*Y*, *Z*)
* **Meaning**: The frequency dependent body acceleration Jerk signal mean value projected on the X axis, as deduced from the accelerometer measurements. The same variable exists for the Y and Z axis.
* **Value type**: double

###FrequencyBodyAccelerationJerkStandardDeviation_Xaxis (Yaxis, Zaxis)
* **Original name**: *fBodyAccJerk-std()-X* (*Y*, *Z*)
* **Meaning**: The frequency dependent body acceleration Jerk signal standard deviation projected on the X axis, as deduced from the accelerometer measurements. The same variable exists for the Y and Z axis.
* **Value type**: double

###FrequencyBodyGyroscopeMeanValue_Xaxis (Yaxis, Zaxis)
* **Original name**: *fBodyGyro-mean()-X* (*Y*, *Z*)
* **Meaning**: The frequency dependent body angular velocity mean value projected on the X axis, as deduced from the gyroscope measurements. The same variable exists for the Y and Z axis.
* **Value type**: double

###FrequencyBodyGyroscopeStandardDeviation_Xaxis (Yaxis, Zaxis)
* **Original name**: *fBodyGyro-std()-X* (*Y*, *Z*)
* **Meaning**: The frequency dependent body angular velocity standard deviation projected on the X axis, as deduced from the gyroscope measurements. The same variable exists for the Y and Z axis.
* **Value type**: double

###FrequencyBodyAccelerationMagnitudeMeanValue
* **Original name**: *fBodyAccMag-mean()*
* **Meaning**: The frequency dependent body acceleration magnitude mean value, as deduced from the accelerometer measurements.
* **Value type**: double

###FrequencyBodyAccelerationMagnitudeStandardDeviation
* **Original name**: *fBodyAccMag-std()*
* **Meaning**: The frequency dependent body acceleration magnitude standard deviation, as deduced from the accelerometer measurements.
* **Value type**: double

###FrequencyBodyBodyAccelerationJerkMagnitudeMeanValue
* **Original name**: *fBodyBodyAccJerkMag-mean()*
* **Meaning**: The frequency dependent body-body acceleration Jerk signal magnitude mean value, as deduced from the accelerometer measurements.
* **Value type**: double

###FrequencyBodyBodyAccelerationJerkMagnitudeStandardDeviation
* **Original name**: *fBodyBodyAccJerkMag-std()*
* **Meaning**: The frequency dependent body-body acceleration Jerk signal magnitude standard deviation, as deduced from the accelerometer measurements.
* **Value type**: double

###FrequencyBodyBodyGyroscopeMagnitudeMeanValue
* **Original name**: *fBodyBodyGyroMag-mean()*
* **Meaning**: The frequency dependent body-body angular velocity magnitude mean value, as deduced from the gyroscope measurements.
* **Value type**: double

###FrequencyBodyBodyGyroscopeMagnitudeStandardDeviation
* **Original name**: *fBodyBodyGyroMag-std()*
* **Meaning**: The frequency dependent body-body angular velocity magnitude standard deviation, as deduced from the gyroscope measurements.
* **Value type**: double

###FrequencyBodyBodyGyroscopeJerkMagnitudeMeanValue
* **Original name**: *fBodyBodyGyroJerkMag-mean()*
* **Meaning**: The frequency dependent body-body angular velocity Jerk signal magnitude mean value, as deduced from the gyroscope measurements.
* **Value type**: double

###FrequencyBodyBodyGyroscopeJerkMagnitudeStandardDeviation
* **Original name**: *fBodyBodyGyroJerkMag-std()*
* **Meaning**: The frequency dependent body-body angular velocity Jerk signal magnitude standard deviation, as deduced from the gyroscope measurements.
* **Value type**: double

