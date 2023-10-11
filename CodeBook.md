#Code Book

# What data sets are produced by this script?
The run_analysis script produces three sets of data. 
The first set of data is uncleaned and includes all the data from both the test file and the train file merged together. This data frame is known as "merged_df".
The next data set the script produces is the extracted mean and standard deviation values for each variable that is measured. This data drame is known as "selected_cols"
The last data frame this script produces is a tidy data frame that calculates the mean of each variable grouped by activity, known as "tidy_data". 


# How did these data sets get created?
The merged_df was created using the the rbind() function to bind the test data frame to the train data frame.
The selecteed_cols data frame was created by using the dplyr package to select out all the variables that were not the mean or the standard deviation measures of the variables.
The selected_cols df also went through a factor transformation using the activity_labels.txt file to extract the levels and the labels for each activity.
To produce the tidy_data frame, the dpylr library was used to group the data by activity and then calculate the mean using sumarise. 

# Variables in the data frame
These data were collected from a fitness tracker while different subjects performed different activities - such as walking and sitting.
The activity variable is a factor variable that describes the type of activity that was completed during each measurement.
All the measurement variables are measured in three axial planes (x,y,z) direction and thus have variables separated for each direction.
The acceleration signal was also seperated into two variables - body and gravitational acceleration.
All the mean and std values are the calcuted mean and std values for that measurement.
There were also many more calculations done such as the interquartile range, minimum and maximum values, energy, median value, etc. 
