the original datasets, train and test, were stored in d_test and d_train datesets. d_test has 2947 observations of 561 variables, d_train has 7352 observations of 561 variables. The original datesets were combined for the purpose of cleaning the datasets into a tibble d_tbl. The cleaning of the dataset was purformed the following way.

1) only variables containing mean() or std() were selected
2) gather() function was used to convert variables into values
3) the values of sensor signal were split into the type of function it represent (mean() or std(), the XYZ parameter along which the signal was measured.

the resulting tidy dataset containes 679734 observation of 4 variables:

1) sensor_signal - factor variable with 17 levels, represents the type of signal
2)xyz_axes -factor variable with 4 levels -X,Y,Z, unknown, X,Y.Z - represents the axes the signal was meassured along, the magnitude measurement is not directional, hence the value "unknown" was used.
3)mean_std is a factor variable with 2 levels, it represents the statistical function mean() or standard deviation that the value represents.
4) the value of that function itself.