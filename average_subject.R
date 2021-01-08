avg_data<-data.frame()
avg_data<-res %>%
  group_by(sensor_signal,xyz_axes,mean_std) %>%
  summarise(mean_value=mean(value))