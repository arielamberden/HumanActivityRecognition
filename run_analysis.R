
# Get column names
data_columns <- read.table("UCI HAR Dataset/features.txt",header=FALSE,col.names=c("num","ColTitle"),stringsAsFactors=FALSE)
colnames <- data_columns$ColTitle
std <- grep("std",colnames) # get columns of standard deviation data
mn <- grep("mean",colnames) # get columns of mean data
desired_columns <- c(std,mn)

# Get activity labels
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt",header=FALSE,col.names=c("num","Activities"))
activities <- activity_labels$Activities

# Read in test files
test_subject<-read.table("UCI HAR Dataset/test/subject_test.txt",header=FALSE,col.names=c("Subject ID"),stringsAsFactors=FALSE)
test_x<-read.table("UCI HAR Dataset/test/X_test.txt",header=FALSE,col.names=colnames,stringsAsFactors=FALSE)
test_y<-read.table("UCI HAR Dataset/test/Y_test.txt",header=FALSE,col.names=c("Activity"),stringsAsFactors=FALSE)
# Apply activity label to activity code
# test_y$Activity <- factor(test_y$Activity,levels=1:6,labels=activities) 
# Concatenate x and y data
test_x <- test_x[,desired_columns]
test_data<-data.frame(test_subject,test_y,test_x)
rm(test_subject,test_x,test_y)

# Read in train files
train_subject<-read.table("UCI HAR Dataset/train/subject_train.txt",header=FALSE,col.names=c("Subject ID"))
train_x<-read.table("UCI HAR Dataset/train/X_train.txt",header=FALSE,col.names=colnames)
train_y<-read.table("UCI HAR Dataset/train/Y_train.txt",header=FALSE,col.names=c("Activity"))
# Apply activity label to activity code
# train_y$Activity <- factor(train_y$Activity,levels=1:6,labels=activities) 
# Concatenate x and y data
train_x <- train_x[,desired_columns]
train_data<-data.frame(train_subject,train_y,train_x)
rm(train_subject,train_x,train_y)

# Combine test and train data frames
full_data <- rbind(test_data,train_data)
rm(test_data,train_data)

# Create aggregate dataset with the average of each variable in full_data for
# each activity and each subject
averages <- aggregate(full_data,by=list(full_data$Activity,full_data$Subject.ID),FUN=mean,na.rm=TRUE)
averages <- averages[,3:83]

# Apply activity label to activity code
full_data$Activity <- factor(full_data$Activity,levels=1:6,labels=activities) 
averages$Activity <- factor(averages$Activity,levels=1:6,labels=activities) 

# Write averages data to file
write.table(averages,file="AveragesTable.txt",append=FALSE,row.names=FALSE)
