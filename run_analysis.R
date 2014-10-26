library(dplyr)

## 1. Read and merge the training and the test sets to create one data set. 
## Assign column names based on the values in the features file
df <- rbind(read.table("train/X_train.txt"), read.table("test/X_test.txt"))
colnames(df) <- read.table("features.txt")[,2]

## 2. Extract only the mean and standard deviation from all features
df<- df[grep("mean()|std()",colnames(df))]

## Load data from the activity table and the subject table. 
## Add to the main dataset as new columns
df$ActivityId <- rbind(read.table("train/y_train.txt",col.names=c("ActivityId")),
                       read.table("test/y_test.txt",col.names=c("ActivityId")))$ActivityId
df$Subject <- rbind(read.table("train/subject_train.txt", col.names=c("Subject")),
                    read.table("test/subject_test.txt", col.names=c("Subject")))$Subject

## 3. Load the activity label files.
## Label activities based on the descriptive activity names in the activity label file. 
## Keep the new activity label column and remove the activity id column.
activitylabel <- read.table("activity_labels.txt",stringsAsFactors=FALSE, 
                            col.names=c("ActivityId","Activity"))
df <- merge(df,activitylabel,by="ActivityId")
df <- df[,names(df)!="ActivityId"]

## 4. Label the data set column names with descriptive variable names 
## by expanding feature names and removing '-' signs
colnames(df) <- gsub("Mag","Magnitude ",gsub("^f","Frequency ",
                                             gsub("^t","Time ", gsub("-"," ",gsub("Gyro", "Gyroscope ", 
                                                gsub("Acc","Accelerometer ", colnames(df)))))))

## 5. Create a tidy data set with the average of each variable for each activity and each subject.
## Using chained functions from the dplyr package
summaryactivity<-
    tbl_df(df) %>%
    group_by(Activity,Subject) %>% 
    summarise_each(funs(mean))

## Write the resulting tidy data to a txt file
write.table(summaryactivity,file="SummaryActivity.txt",row.name=FALSE,sep="\t")



