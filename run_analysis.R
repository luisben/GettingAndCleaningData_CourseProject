data_file = "getdata_projectfiles_UCI HAR Dataset.zip"
if (!file.exists(data_file)){
    file_url = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    download.file(file_url,data_file,method="auto")
}
unzip(data_file)

##delcare vars for file location
train_activities_file = "./UCI HAR Dataset/train/y_train.txt"
train_subjects_file = "./UCI HAR Dataset/train/subject_train.txt"
train_measures_file = "./UCI HAR Dataset/train/X_train.txt"

test_activities_file = "./UCI HAR Dataset/test/y_test.txt"
test_subjects_file = "./UCI HAR Dataset/test/subject_test.txt"
test_measures_file = "./UCI HAR Dataset/test/X_test.txt"

act_labels_file = "./UCI HAR Dataset/activity_labels.txt"
feats_labels_file = "./UCI HAR Dataset/features.txt"
##read train and test X,Y,and subject files 
train_act_labels = read.table(train_activities_file,row.names=NULL)
test_act_labels = read.table(test_activities_file,row.names=NULL)

train_subjects = read.table(train_subjects_file,row.names=NULL)
test_subjects = read.table(test_subjects_file,row.names=NULL)

train_measures = read.table(train_measures_file,row.names=NULL)
test_measures = read.table(test_measures_file,row.names=NULL)
##read the activity labels file
activity_labels <- read.table(act_labels_file)
##read the feature names file
feature_labels <- read.table(feats_labels_file)
##subset feature names label vector to those with mean or std in its label
##the used regexp will get both mean() and meanFreq() features...using "mean\\(" would exclude meanFreq() features
feature_list <-sapply(as.character(feature_labels$V2), function (str) {  if(grepl("mean",str) || grepl("std",str)) str else NA } ,USE.NAMES=FALSE)
feature_list <- feature_list[!is.na(feature_list)]
feature_labels <- as.character(feature_labels$V2)
##assign the features labels vector as the colnames for the measures dataframes
colnames(train_measures) <- feature_labels
colnames(test_measures) <- feature_labels
##now subset the data frames to only the filtered features
train_measures <- train_measures[,feature_list]
test_measures <- test_measures[,feature_list]

##make factor out of Y files tables
test_act_factor <- factor(test_act_labels$V1,levels=activity_labels$V1,labels=as.vector(activity_labels$V2))
train_act_factor <- factor(train_act_labels$V1,levels=activity_labels$V1,labels=as.vector(activity_labels$V2))
##add factor column to existing tables
test_measures <- cbind(test_act_factor,test_measures)
train_measures <- cbind(train_act_factor,train_measures)
##add subject id to existing tables
test_measures <- cbind(test_subjects,test_measures)
train_measures <- cbind(train_subjects,train_measures)
#give names to new columns
colnames(test_measures)[1] <- "subjectid"
colnames(train_measures)[1] <- "subjectid"
colnames(test_measures)[2] <- "activity"
colnames(train_measures)[2] <- "activity"
##rowbind both data frames into one
har_dataset <- rbind(test_measures,train_measures)

##phase two
##create dataset from mean of each var by activity and subject
harMelt <- melt(har_dataset,id=c("subjectid","activity"))
HAR_means <- dcast(harMelt,subjectid + activity ~ variable,mean)
write.table(HAR_means,file="tidy_HAR.txt",row.names=FALSE)