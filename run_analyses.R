library(tidyverse)
library(dplyr)
library(purrr)
library(tidyr)

path_test<-"C:/Users/serge/Documents/UCI HAR Dataset/test/X_test.txt"
path_train<-"C:/Users/serge/Documents/UCI HAR Dataset/train/X_train.txt"
path_features<-"C:/Users/serge/Documents/UCI HAR Dataset/features.txt"
res<-data.frame()
d_train<-read.table(path_train)
d_test<-read.table(path_test)
d_tt<-rbind(d_train,d_test)
d_features<-read.table(path_features)
col_names<-d_features$V2
d_tbl<-tbl_df(d_tt)
colnames(d_tbl)<-col_names
res<-d_tbl %>% select(contains("mean()"),contains("std()"))%>%
  gather() %>%
  mutate(sensor_signal = map_chr(key, ~unlist(strsplit(., "-"))[1])) %>%
  mutate(mean_std = map_chr(key, ~unlist(strsplit(., "-"))[2])) %>%
  mutate(xyz_axes = map_chr(key, ~unlist(strsplit(., "-"))[3])) %>%
  mutate(xyz_axes = case_when(xyz_axes == "X" ~ "X",
                              xyz_axes == "Y" ~ "Y",
                              xyz_axes == "Z" ~ "Z",
                              is.na(xyz_axes == NA) ~ "unknown")) %>%
  select(sensor_signal, xyz_axes, mean_std, value) %>%
  mutate_at(vars(sensor_signal, xyz_axes, mean_std), list(factor)) 
  
write.table(res, file="c:/Users/serge/Documents/res_tidy.txt",row.names = FALSE)
  