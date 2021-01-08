avg_data<-data.frame()
avg_data<-aggregate(. ~activity+subject, data=res, mean)
avg_names<-names(avg_data)
avg_names<-sub("^(.*?)", "average of \\1", avg_names)
avg_names[1]<-"activity"
avg_names[2]<-"subject"
names(avg_data)<-avg_names