#Name file downloaded
name <- "Cleaning_Data_Course_Project.zip"

#Load dplyr
library(dplyr)

# Check if file already exists
if (!file.exists(name)){
  URL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(URL, name, method="curl")
}  

# Check if folder exists
if (!file.exists("UCI HAR Dataset")) { 
  unzip(name) 
}

# Reading dataset files 
features <- read.table("UCI HAR Dataset/features.txt", col.names = c("IdFeature","FeatureName"))
activities <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("IdActivity", "ActivityName"))

x_train<-read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$FeatureName)
y_train<-read.table("UCI HAR Dataset/train/y_train.txt", col.names = "Label")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "IdSubject")

x_test<-read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$FeatureName)
y_test<-read.table("UCI HAR Dataset/test/y_test.txt", col.names = "Label")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "IdSubject")

# Merges the training and the test sets to create one data set

train<- cbind(subject_train,x_train,y_train, type="train")
test <- cbind(subject_test, x_test, y_test, type="test")
data<- rbind(train,test)

# Extracts only the measurements on the mean and standard deviation for each measurement
data<- select(data, IdSubject, Label, contains("mean"),contains("std"))

#Uses descriptive activity names to name the activities in the data set
data$Label<- activities[data$Label,"ActivityName"]

# Appropriately labels the data set with descriptive variable names
names(data)[2]="Activity"
names(data)<- gsub("Acc","Accelerometer", names(data))
names(data)<- gsub("Gyro","Gyroscope", names(data))
names(data)<- gsub("^t","Time",names(data))
names(data)<- gsub("Mag","Magnitude", names(data))
names(data)<- gsub("^f|Freq","Frequency", names(data))
names(data)<- gsub("\\.","",names(data))
names(data)<-gsub("angle", "Angle", names(data))
names(data)<-gsub("gravity", "Gravity", names(data))
names(data)<- gsub("BodyBody","Body",names(data))
names(data)<- gsub("mean","Mean",names(data))
names(data)<- gsub("std","STD",names(data))

#Creates a second, independent tidy data set with the average of each variable for each activity and each subject
data2<- data %>% group_by(IdSubject,Activity) %>% summarise_all(mean)

write.table(data2, "Data.txt", row.name=FALSE)