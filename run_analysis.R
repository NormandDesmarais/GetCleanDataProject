#------------------------------------------------------------------------------
# fexists(fname, fdesc)
#       A helper function to check if a file exists.
#       It stops the execution of the code and prints a message
#       if the file is missing. The goal of this function is
#       to make run_analysis() code easier to read.
#
# Parameters:
#       fname: character string with the filepathname
#       fdes: a character string describing the file (e.g. "Test measurements")
#------------------------------------------------------------------------------
fexists <- function(fname, fdesc) {
        if (!file.exists(fname))
                stop(fdesc," file is missing: ",fname)
}

#------------------------------------------------------------------------------
# run_analysis()
#
#       This function performs the analysis. It assumes that the directory
#       "UCI HAR Dataset" is in the current directory and contains
#       Samsumg's original data set without modification.
#
#       It is also assumes that the library dplyr has been installed.
#       run_analysis() uses dplyr functions to select and group_by
#       the data set.
#
#       run_analasys() performs the following task:
#
#       1) Reads the test and training data sets and row-bind them into one.
#          (Although, for my convenience, 3 sepearate tables are maintained
#          until step 4: subjects, activities and measurements. These tables
#          will be column-binded into one table at the end of step 4.)
#
#       2) Extracts from the measurements table Standard Deviation
#          and Mean Value measurement variables only (other variables are
#          discarded from the analysis). The selected set of variables
#          replace the content of the measurements table.
#
#       3) Change the activity ID from the activities table into their
#          corresponding human readable activity names (as provided by 
#          the file activity_labels.txt). 
#
#       4) Uses features' names (as provided by features.txt) as the
#          measurements variable names, but rename them by expending
#          abbreviations according to the vague law of tidyness. Namely:
#
#                                 leading t  --> Time
#                                 leading f  --> Frequency
#                                 Acc        --> Acceleration
#                                 Gyro       --> Gyroscope
#                                 Mag        --> Magnitude
#                                 -std()     --> StandardDeviation
#                                 -mean()    --> MeanValue
#                                 -X         --> _Xaxis
#                                 -Y         --> _Yaxis
#                                 -Z         --> _Zaxis
#                                 BodyBody   --> Body (mistake in original)
#
#          After that, the subjects (ID), activities (by names) and
#          measurements are column-binded into the measurements table
#          in this order.
#
#       5) Finally, using this new measurements table, creates a summary table
#          containing the average of each measurement per subject and for each
#          activity. Henceforth, each subject has 6 rows, one for each
#          activity.
#
#          The measurement summary table (aka the "tidy table") is written
#          in a text file with the variable names as header, and without
#          row number. The file is created in the current directory and 
#          is called: "measurements_summary.txt".
#
#          The function run_analysis also returns the measurement summary table
#          after completion.
#------------------------------------------------------------------------------
run_analysis <- function() {
        # run_analysis() uses dplyr to select and group measurements
        if (!library(dplyr, logical.return = T)) {
                stop("Couldn't load dplyr library, package is not installed!")
        }
        
        #----------------------------------------------------------------------
        # 1) Merges the training and the test sets to create one data set.
        #
        #    Note: for the sake of simplicity, we'll keep measurements,
        #          activities and subjects in 3 seperate tables until step 4
        #----------------------------------------------------------------------
        
        # read the feature's labels
        fname <- file.path("UCI HAR Dataset","features.txt")
        fexists(fname, "Feature's labels")
        feature_labels <- read.table(fname)
        feature_labels <- as.character(feature_labels[,2])
        
        # read the activity's labels
        fname <- file.path("UCI HAR Dataset","activity_labels.txt")
        fexists(fname, "Activity's labels")
        activity_labels <- read.table(fname)
        activity_labels <- as.character(activity_labels[,2])
        
        print("reading measurements, please wait, this could take some time...")
        # read the measurements test file; don't bother about naming column for now
        fname <- file.path("UCI HAR Dataset","test","X_test.txt")
        fexists(fname, "Test measurements")
        measurements <- read.table(fname)
        # read and merge the measurements training file
        fname <- file.path("UCI HAR Dataset","train","X_train.txt")
        fexists(fname, "Train measurements")
        measurements <- rbind(measurements, read.table(fname))
        
        # read the subjects test file
        fname <- file.path("UCI HAR Dataset","test","subject_test.txt")
        fexists(fname, "Test subjects")
        subjects <- read.table(fname)
        # read and merge the subjects training file
        fname <- file.path("UCI HAR Dataset","train","subject_train.txt")
        fexists(fname, "Train subjects")
        subjects <- rbind(subjects, read.table(fname))
        
        # read the activities test file
        fname <- file.path("UCI HAR Dataset","test","y_test.txt")
        fexists(fname, "Test activities")
        activities <- read.table(fname)
        # read and merge the activities training file
        fname <- file.path("UCI HAR Dataset","train","y_train.txt")
        fexists(fname, "Train activities")
        activities <- rbind(activities, read.table(fname))
        
        
        #----------------------------------------------------------------------
        # 2) Extracts only the measurements on the mean and standard deviation
        #    for each measurement.
        #
        #    Note: the column names are set after extracting the mean() and std()
        #          to avoid the problem with select and duplicate column name
        #          (there are dulicates in the set of bandsEnergy variables)
        #    Neat trick: grep on the feature_labels returns the corresponding
        #                column positions of the measurements table!
        #                We can thus use grep to select the variables of
        #                interest from measurements and then name the columns
        #                with the same grep command but with value set to TRUE.
        #----------------------------------------------------------------------
        measurements <-
                select(measurements, grep("(mean[(])|(std[(])",feature_labels))
        # name the measurements using the feature label
        names(measurements) <- 
                grep("(mean[(])|(std[(])",feature_labels,value = T)
        # name the subject and activity set too
        names(subjects) <- "Subject_ID"

        
        #----------------------------------------------------------------------
        # 3) Uses descriptive activity names to name the activities in the
        #    data set
        #
        #    Note: Translate them activity ID into activity names
        #          as specified by the activity's labels 
        #----------------------------------------------------------------------
        activities <- factor(activities[,1], label = activity_labels)
        
        
        #----------------------------------------------------------------------
        # 4) Appropriately labels the data set with descriptive variable names.
        #----------------------------------------------------------------------
        mlabels <- names(measurements)
        mlabels <- sub("^t","Time", mlabels)
        mlabels <- sub("^f","Frequency", mlabels)
        mlabels <- sub("Acc","Acceleration", mlabels)
        mlabels <- sub("Gyro","Gyroscope", mlabels)
        mlabels <- sub("Mag","Magnitude", mlabels)
        mlabels <- sub("-std[(][)]","StandardDeviation", mlabels)
        mlabels <- sub("-mean[(][)]","MeanValue", mlabels)
        mlabels <- sub("-X","_Xaxis", mlabels)
        mlabels <- sub("-Y","_Yaxis", mlabels)
        mlabels <- sub("-Z","_Zaxis", mlabels)
        mlabels <- sub("BodyBody","Body", mlabels)
        names(measurements) <- mlabels
        
        # We can now bind subjects, activities and measurements into one table
        measurements <- cbind(subjects, Activity = activities, measurements)
        
        #----------------------------------------------------------------------
        # 5) From the data set in step 4, creates a second, independent
        #    tidy data set with the average of each variable for each activity
        #    and each subject.
        #
        # To achieve this, let's group measurement by Subject_ID and then by
        # Activity. Pass then the resulting table to summarize_each with the
        # mean() function and making sure to exclude the two first columns.
        #----------------------------------------------------------------------
        measurement_summary <-
                group_by(measurements, Subject_ID, Activity, add = T) %>%
                summarize_each(funs(mean),-c(1,2))
        # write the measurment summary table into a text file
        write.table(measurement_summary, file = "measurements_summary.txt",
                    row.names = F)
        
        # return the measurement summary table
        measurement_summary
}
