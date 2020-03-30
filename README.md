# Coursera_Project
The summary of the proect is about combining the data collected (train set and test set) from samsung smartphone and generate a clean and tidy data output into a table. The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The cleaning includes following steps
First change the column names to the understandable names
Extract the data from train set(subject_id, feature and activity) by reading the data to a variable and assign column name to it.
Similarly Extract the data from test set(subject_id, feature and activity) by reading the data to a variable and assign column name to it.
Now combine both the data sets using rbind and generate output.

This repository consists of following files

readme.md

Codebook.md

Coursera_Project.R 
