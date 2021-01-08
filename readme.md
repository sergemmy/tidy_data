this file explaines the scripts in the project "getting and cleaning data"

the project contains 2 scripts and CodeBook.md file explaining variables in the final tidy set.

run_analyzes.R creates tidy data frame named res with the following steps:
1) original test and train data location stored locally in path_test,
path_train. The original feature file location is stored in
path_features
2) corresponding data frames are combined and the feature data frame is used to create variable names.
3) the data frame is manipulated and tidy data frame (res) is the result, the data frame of 679734 observations of 4 variables.

the average_subject.R script creates avg_data data frame with mean values calculated for each unique subject of res data frame.


