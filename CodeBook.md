
## Codebook for tidy.csv

The dataset tidy is a rearrangement of the data found in the Human Activity Recognition Using Smartphones Data Set.  
See the [website](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) for background information.

The dataset tidy has 68 columns or variables and 181 rows (including a header row).

The first two columns are:

1. subject, a number identifying the subject who was doing the activity   
   (possible values are 1,2,3, ... 30)
2. activity, a word indicating in which activity a subject was involved   
   (values:"LAYING", "SITTING", "STANDING", "WALKING", "WALKING_DOWNSTAIRS","WALKING_UPSTAIRS".)  

These two variables were use to group the measurements (group first by subject and within subject by activity).  
This results in 180 groups. For each group there is a row in the dataset with 66 averages. 

For each group the average (AVG) of 66 types of body movement measurements were calculated.  
These 66 averages are shown in the columns below.  
See the [original code book](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) for the meaning of names like tBodyAcc-mean()-X     
   
3 AVG( tBodyAcc-mean()-X )
4 AVG( tBodyAcc-mean()-Y )
5 AVG( tBodyAcc-mean()-Z )
6 AVG( tBodyAcc-std()-X )
7 AVG( tBodyAcc-std()-Y )
8 AVG( tBodyAcc-std()-Z )
9 AVG( tGravityAcc-mean()-X )
10 AVG( tGravityAcc-mean()-Y )
11 AVG( tGravityAcc-mean()-Z )
12 AVG( tGravityAcc-std()-X )
13 AVG( tGravityAcc-std()-Y )
14 AVG( tGravityAcc-std()-Z )
15 AVG( tBodyAccJerk-mean()-X )
16 AVG( tBodyAccJerk-mean()-Y )
17 AVG( tBodyAccJerk-mean()-Z )
18 AVG( tBodyAccJerk-std()-X )
19 AVG( tBodyAccJerk-std()-Y )
20 AVG( tBodyAccJerk-std()-Z )
21 AVG( tBodyGyro-mean()-X )
22 AVG( tBodyGyro-mean()-Y )
23 AVG( tBodyGyro-mean()-Z )
24 AVG( tBodyGyro-std()-X )
25 AVG( tBodyGyro-std()-Y )
26 AVG( tBodyGyro-std()-Z )
27 AVG( tBodyGyroJerk-mean()-X )
28 AVG( tBodyGyroJerk-mean()-Y )
29 AVG( tBodyGyroJerk-mean()-Z )
30 AVG( tBodyGyroJerk-std()-X )
31 AVG( tBodyGyroJerk-std()-Y )
32 AVG( tBodyGyroJerk-std()-Z )
33 AVG( tBodyAccMag-mean() )
34 AVG( tBodyAccMag-std() )
35 AVG( tGravityAccMag-mean() )
36 AVG( tGravityAccMag-std() )
37 AVG( tBodyAccJerkMag-mean() )
38 AVG( tBodyAccJerkMag-std() )
39 AVG( tBodyGyroMag-mean() )
40 AVG( tBodyGyroMag-std() )
41 AVG( tBodyGyroJerkMag-mean() )
42 AVG( tBodyGyroJerkMag-std() )
43 AVG( fBodyAcc-mean()-X )
44 AVG( fBodyAcc-mean()-Y )
45 AVG( fBodyAcc-mean()-Z )
46 AVG( fBodyAcc-std()-X )
47 AVG( fBodyAcc-std()-Y )
48 AVG( fBodyAcc-std()-Z )
49 AVG( fBodyAccJerk-mean()-X )
50 AVG( fBodyAccJerk-mean()-Y )
51 AVG( fBodyAccJerk-mean()-Z )
52 AVG( fBodyAccJerk-std()-X )
53 AVG( fBodyAccJerk-std()-Y )
54 AVG( fBodyAccJerk-std()-Z )
55 AVG( fBodyGyro-mean()-X )
56 AVG( fBodyGyro-mean()-Y )
57 AVG( fBodyGyro-mean()-Z )
58 AVG( fBodyGyro-std()-X )
59 AVG( fBodyGyro-std()-Y )
60 AVG( fBodyGyro-std()-Z )
61 AVG( fBodyAccMag-mean() )
62 AVG( fBodyAccMag-std() )
63 AVG( fBodyBodyAccJerkMag-mean() )
64 AVG( fBodyBodyAccJerkMag-std() )
65 AVG( fBodyBodyGyroMag-mean() )
66 AVG( fBodyBodyGyroMag-std() )
67 AVG( fBodyBodyGyroJerkMag-mean() )
68 AVG( fBodyBodyGyroJerkMag-std() )



