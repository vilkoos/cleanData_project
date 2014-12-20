cleanData_project
=================

This repo contains the files for the project that went with the November 2014 version of the Coursera course:  Getting and Cleaning Data.

Files in this repo are:

- README.md  (this file)
- tidy.txt (the produced tidy dataset as txt file)
- tidy.csv (the produced tidy dataset as csv file)
- run_analysis.R (the used R script)
- CodeBook.md (a code book for tidy.csv)

The CodeBook.md also indicates the data transformations that were used.

## notes by run_analysis.R works

The script performs the following steps:

- the original data are downloaded from the internet and unzipped.
- the names of the 500+ variables are read from the file "./UCI HAR Dataset/features.txt."
- using SQL the 66 variables names containing the string "mean()" or "std()" are selected and stored in the table vars (i.e. used vars.)
- the names of the activities are read from the file ".//UCI HAR Dataset//activity_labels.txt" and stored in the table act_name   
- make a data frame containing all train data (see script for the dirty details)
- make a data frame containing all test data (see script for the dirty details)
- PS in the previous two steps activity numbers were replaced by activity names
- merge (i.e. row bind) the train and test data frames.
- Use SQL to group by subject and activity, 
- let SQL calculate each of the 66 group averages in a loop
- construct and store appropriate column names for these 66.
- save the result as tidy.csv   

## general notes

I'm very familiar with SQL, so I used the R package sqldf to do all of the grouping. The same thing can be done with dplyr.

Strictly speaking I should have produced a tidy.txt file (not tidy.csv). That should not be a real problem, a .csv file is a .txt file that is formatted in a specific way.

