library(tidyverse)
library(dplyr)
library(purrr)
library(tidyr) 

  path_test<-"C:/Users/serge/Documents/UCI HAR Dataset/test/"
  path_train<-"C:/Users/serge/Documents/UCI HAR Dataset/train/"
  path_features<-"C:/Users/serge/Documents/UCI HAR Dataset/features.txt"
  res<-data.frame()
  d_train<-read.table(paste0(path_train,"X_train.txt"))
  d_test<-read.table(paste0(path_test,"X_test.txt"))
  activity_train<-read.table(paste0(path_train,"Y_train.doc.txt"))
  activity_test<-read.table(paste0(path_test,"Y_test.txt"))
  subject_train<-read.table(paste0(path_train,"subject_train.txt"))
  subject_test<-read.table(paste0(path_test,"subject_test.txt"))
  names(subject_test)[1]<-"subject"
  names(subject_train)[1]<-"subject"
  names(activity_train)[1]<-"activity"
  names(activity_test)[1]<-"activity"
  c_train<-cbind(d_train,activity_train,subject_train) 
  c_test<-cbind(d_test,activity_test,subject_test)
  d_tt<-rbind(c_train,c_test)
  d_features<-read.table(path_features)
  col_names<-c(d_features$V2, "activity","subject")
  d_tbl<-tbl_df(d_tt)
  colnames(d_tbl)<-col_names
      res<-d_tbl %>% select("activity","subject",contains("mean()"),contains("std()"))%>%
          mutate(activity=case_when(activity==1 ~ "WALKING",
                                  activity==2 ~ "WALKING_UPSTAIRES",
                                  activity==3 ~ "WALKING_DOWNSTAIRES",
                                  activity==4 ~ "SITTING",
                                  activity==5 ~ "STANDING",
                                  activity==6 ~ "LAYING"))%>%
          mutate_at(vars(activity, subject), list(factor))
      
  #cleaning column names
  col_names<-names(res)
  col_names<-gsub("-"," ",col_names)
  col_names<-gsub("\\()","",col_names)
  col_names <- gsub("^f", "frequencyDomain", col_names)
  col_names <- gsub("^t", "timeDomain", col_names)
  col_names<- gsub("Acc", "Accelerometer", col_names)
  col_names<- gsub("Gyro", "Gyroscope", col_names)
  col_names<- gsub("Mag", "Magnitude", col_names)
  col_names <- gsub("Freq", "Frequency", col_names)
  col_names <- gsub("mean", "Mean", col_names)
  col_names <- gsub("std", "StandardDeviation", col_names)
  col_names<-gsub("BodyBody", "Body", col_names)
  names(res)<-col_names
  source("average_subject.R")

  write.table(avg_data, file="c:/Users/serge/Documents/res_tidy.txt",row.names = FALSE)
  