getwd()

setwd("C:/Users/Srivathsav/Desktop")

#Downloading data fom zip file

fileUrl="https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

download.file(fileUrl,"C:/Users/Srivathsav/Desktop/samsung.zip")

unzip("C:/Users/Srivathsav/Desktop/samsung.zip")

#Feature and Activity names 
Features<-read.table("C:/Users/Srivathsav/Desktop/UCI HAR Dataset/features.txt")

Features<-read.table("C:/Users/Srivathsav/Desktop/UCI HAR Dataset/features.txt")$V2

Activity_Labels<-read.table("C:/Users/Srivathsav/Desktop/UCI HAR Dataset/activity_labels.txt")

Activity_Labels<-read.table("C:/Users/Srivathsav/Desktop/UCI HAR Dataset/activity_labels.txt")$V2


#Test Data
subject_test<-read.table("C:/Users/Srivathsav/Desktop/UCI HAR Dataset/test/subject_test.txt",col.names = "subject_id")

X_test<-read.table("C:/Users/Srivathsav/Desktop/UCI HAR Dataset/test/X_test.txt",col.names = "Features")

Y_test<-read.table("C:/Users/Srivathsav/Desktop/UCI HAR Dataset/test/y_test.txt",col.names = "Activity_Labels")

Test_Data<- cbind(subject_test,X_test,Y_test)

#Train Data
subject_train<-read.table("C:/Users/Srivathsav/Desktop/UCI HAR Dataset/train/subject_train.txt", col.names = "subject_id")

X_train<-read.table("C:/Users/Srivathsav/Desktop/UCI HAR Dataset/train/X_train.txt", col.names = "Features")

Y_train<-read.table("C:/Users/Srivathsav/Desktop/UCI HAR Dataset/train/y_train.txt", col.names = "Activity_Labels")

Train_Data<- cbind(subject_train,X_train,Y_train)

#Combined Data

m<- rbind(Train_Data,Test_Data)


# extract feature cols & names named 'mean, std'
selectedCols <- grep("-(mean|std).*", as.character(Features[,2]))
selectedColNames <- Features[selectedCols, 2]
selectedColNames <- gsub("-mean", "Mean", selectedColNames)
selectedColNames <- gsub("-std", "Std", selectedColNames)
selectedColNames <- gsub("[-()]", "", selectedColNames)

#Extract data by column names
colnames(m) <- c("Subject", "Activity", selectedColNames)

m$Activity <- factor(m$Activity, levels = m_label[,1], labels = m_label[,2])
m$Subject <- as.factor(m$Subject)

#Tidy dataset

meltedData <- melt(m, id = c("Subject", "Activity"))
tidyData <- dcast(meltedData, Subject + Activity ~ variable, mean)

write.table(tidyData, "./tidy_dataset.txt", row.names = FALSE, quote = FALSE)
