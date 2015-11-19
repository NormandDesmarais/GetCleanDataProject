# GetCleanDataProject
Getting and Cleaning Data Course's Project

##File list
This repository contains the R script and the code book for the **Getting and Cleaning Data** course's project.

+ [CodeBook.md](https://github.com/NormandDesmarais/GetCleanDataProject/blob/master/CodeBook.md): This code book describes the variables contained in the summary (tidy) data set produced by the script *run_analysis.R*. It also describe high level transformations performed in order to obtain the final summary.
+ [README.md](https://github.com/NormandDesmarais/GetCleanDataProject/blob/master/README.md): This file.
+ [run_analysis.R](https://github.com/NormandDesmarais/GetCleanDataProject/blob/master/run_analysis.R): The R script that performs the analysis on the `Human Activity Recognition Using Smartphones`' original (raw from our view point) data set to produce a summary of the average measure per activity for each subject and for a set of selected measurement variables from the original (raw) data set.

##Assumptions
The R script [run_analysis.R](https://github.com/NormandDesmarais/GetCleanDataProject/blob/master/run_analysis.R) makes the following assumptions:
+ the original data set has been downloaded from [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
+ the downloaded zip file has been decompressed and nothing has been modified within the decompressed files and directories
+ the original data set main directory after decompression ("UCI HAR Dataset") resides in the current R working directory
+ the library `dplyr` has been installed from CRAN and is up to date

##Processing 
The following operations are performed by *run_analysis()* to obtain a summary of some selected measurements per activity for each subject:

1. The original (raw) test and training files containing the measurement variable are read with `read.table` and row-binded (`rbind`) into one *measurements* data set. The default variables names assigned by `read.table` (V1, V2...) are kept to avoid problem with duplicate variable names ("*bandsEnergy*" measurement variables have duplicate names), plus no need to name them now. The original test and training subject files are read with `read.table` and row-binded into one *subjects* table separate from the *measurements* table (no need to `cbind` them yet, will be done later in step 4). The same is done with the test and training activities file, the result being stored in the *activities* table. (Note that the test and training tables are row-binded in the same order, test + train, in each cases to keep them synchronized in their observable order.) The activity labels (activity names) and features (measurement variable names) are also read and kept in their own table (*activity_labels* and *feature_labels*, respectively).
2. We use `grep` to select from *feature_labels* the set of names containing the string "mean(" or "std(". The resulting list of positions returned by `grep` is then inserted into a (`dplyr`) `select` command to extract from the *measurements* table measurement variables related to the "mean value"" or the "standard deviation". This subset of variables is stored into the *measurements* table replacing its original content and thus discarding other kind of measurement variables from the analysis. At this point, it is safe to name the measurement variables, we use the same `grep` command, but this time with the flag `value = TRUE`, and affect the result to `names(measurements)`. We also use this opportunity to name the *subjects* table unique variable *Subject_ID*. We don't name the *activities* table yet, since there is more processing to do with it.
3. We replace the content of the *activities* table (activity ID) with their human readable names from *activity_labels*. This is simply done by applying the `factor` command onto the *activities* table and using *activity_labels* as `label`. The resulting *activities* table is a `factor` class and cannot be named. But we will take care of this in the next step.
4. At this point we have 3 seperate tables: *measurements*, containting the subset of measurement variables of interest; *subjects*, containing the subject ID; and *activities*, containting the name of the activity performed by the subject. The names of the measurement variables from the original data set (as obtained from *feature_labels*), don't respect our criteria to form a "tidy"" data set. To remedy to this, we expand all abbreviations contained into the original names to their explicit form. We also replace the double ocurence of the word "Body" in some variable names by a single occurence. The table below describes the complete list of changes performed on the measurement variable's original names. Once this step has been completed, we can column-bind the three tables into one table and reaffect the result to the *measurements* table. This is simply done by invoking the `cbind` command and binding the table in the following order: *subjects*, *activities* and *mesurements*. We use this opportunity to name the activity column **Activity**. Our cleaned *measurements* table is now ready to be processed to create the final "tidy" data set.
5. The final step could easily be done, thanks to `dplyr` package, by invoking the command `group_by` to group the observations of the *measurements* table by **Subject_ID** first and then by **Activity** (using the parameter `add = TRUE`). The result is pipelined (`%>%`) to the `summaryze_each` using the `mean` function to act on the data set. The result is affected to a new table called *measurements_summary*. This "tidy" table contains the average value of each measurement variables by activity and for each subject. The tidy table is written in the file *measurements_summary.txt* and returned by the *run_analysis* function.

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



