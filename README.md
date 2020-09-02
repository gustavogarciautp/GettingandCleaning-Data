# GettingandCleaningData

Peer Graded Task: Getting and Cleaning Data Course Project
This repository is a presentation by Gustavo García for the Getting and Cleaning Data course project. Contains instructions on how to run the analysis on the human activity recognition dataset.

## Recognition of human activity using the smartphone dataset
## Data source
Jorge L. Reyes-Ortiz (1,2), Davide Anguita (1), Alessandro Ghio (1), Luca Oneto (1) and Xavier Parra (2)
1 - Smartlab - Laboratory of complex non-linear systems
DITEN - Università degli Studi di Genova, Genoa (I-16145), Italy.
2 - CETpD - Technical research center for the care of dependent people and autonomous living
Polytechnic University of Catalonia (BarcelonaTech). Vilanova i la Geltrú (08800), Spain
activity recognition '@' smartlab.ws

## Records

Here are the data for the project:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

CodeBook.md a code book that describes the variables, the data, and any transformations or work that I performed to clean up the data

run_analysis.R performs the collect and clean data set. Prepare tidy data that can be used for later analysis. This script does the following:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Data.txt is the final data set obtained after applying the previous steps.
