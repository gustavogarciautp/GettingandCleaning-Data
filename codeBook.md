# Code Book

The run_analysis.R script performs the preparation and cleaning of the data following the 5 steps described in the definition of the course project.

## Data download
First of all I downloaded the dataset and extracted the resulting ZIP file into the folder called UCI HAR Dataset.

## Reading data
Next, read the files included in the dataset, which were stored in different variables:

The features variable stores features.txt made up of 561 rows and 2 columns. This variable provides 561-feature vector with time and frequency domain variables.

The activities variable stores activity_labels.txt made up of 6 rows and 2 columns. This file links the class labels with their activity name.

The variable x_train stores X_train.txt made up of 7352 rows and 561 columns. Corresponds to training data.

The variable y_train stores y_train.txt made up of 7352 rows and 1 column. It contains the labels of the training data (activity code).

The subject_train variable stores subject_train.txt made up of 7352 rows and 1 column. This file contains the identifiers of 21/30 volunteers who performed the experiment.

The variable x_test stores X_test.txt made up of 2947 rows and 561 columns. It corresponds to the test data.

The variable y_test stores y_test.txt made up of 2947 rows and 1 column. Contains the labels of the test data (activity code).

The subject_test variable stores subject_test.txt made up of 2947 rows and 1 column. This file contains the identifiers of 9/30 volunteers who performed the experiment.

## Combining the data
The next step was to combine the training data sets and their labels to create a train data set (7352 rows, 564 columns) using the cbind () function. The test data set and its labels are joined to create a test data set (2947 rows, 564 columns) using the cbind () function. Finally, data (10299 rows, 564 columns) is created by combining train and test using the rbind () function.

## Extracts only the measurements on the mean and standard deviation for each measurement

In this step, the data variable (merged data) is updated by selecting only the columns: IdSubject, Label and the measures of the mean and standard deviation (std) for each measurement. This generates a new data set with
10299 rows and 88 columns.

## Uses descriptive activity names to name the activities in the data set
Here all the numerical values of the Data Label column are replaced by the names of the corresponding activities taken from the second column of the activities variable.

## Appropriately labels the data set with descriptive variable names
In this step, the following changes are made to the names of the data columns:

- The Label column in data is renamed to Activity
- All Acc are replaced by Accelerometer
- All Gyro are replaced by Gyroscope
- All names starting with the character t are replaced by Time.
- All names beginning with the character f are replaced by Frequency.
- All points are removed.
- All Mag are replaced by Magnitude
- angle is replaced by Angle
- gravity is replacement for Gravity
- All BodyBody is replaced by Body
- mean is replaced by Mean
- std is replaced by STD

## Creates a second, independent tidy data set with the average of each variable for each activity and each subject
data2 (180 rows, 88 columns) is created by grouping data by the IdSubject and Activity columns and finally taking the average of each variable for each activity and each subject. The data set obtained is exported to the Data.txt file.
