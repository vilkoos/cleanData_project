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

## notes

I'm very familiar with SQL, so I used the R package sqldf to do all of the grouping. The same thing can be done with dplyr.

Strictly speaking I should have produced a tidy.txt file (not tidy.csv). That should not be a real problem, a .csv file is a .txt file that is formatted in a specific way.