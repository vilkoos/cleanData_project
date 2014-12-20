
## step 0 ##########################################################

# -0a------ load libraries --------------------------------
library(sqldf)


# -0b--- Download the data from the internet --------------
if (!file.exists("Dataset.zip")) {
    url  = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    dest = "Dataset.zip"
    meth = "internal"
    quit = TRUE
    mode = "wb"
    download.file(url, dest, meth, quit, mode)
    unzip("Dataset.zip")
    # NOTE this works under windows 7, modify if nessesairy
} 

# -0c--read list of all 561 variablenames (NB same names for train and test)
allnames <- read.table(".//UCI HAR Dataset//features.txt")

# -0d-- find the var names that contain "mean()" or "std()" 
# ----- i.e. the vars we are looking for -----------------
vars <- sqldf("
           select * 
           from allnames 
           where V2 LIKE '%mean()%' OR V2 LIKE '%std()%'
          ")

names(vars)[1] <- "nr"
names(vars)[2] <- "name"

#---------------------------
# the table vars has two colomns 
# nr  : the colomn number of the selected variable
# name: the name of the variable in the colomn
#
# NOTE that SQL selected 66 rows that have
# a name that contains the substring "mean()" or "std()"
#---------------------------


#- 0e--- find the activity names for the numbers ---------
act_name <- read.table(".//UCI HAR Dataset//activity_labels.txt")

names(act_name)[1] <- "nr"
names(act_name)[2] <- "name"

#---------------------------
# the table act_name has two columns 
# nr  : the colomn number of the activity
# name: the name/description of the activity
#---------------------------


########################################################################
# Strategy:
#  step 1: construct a dataframe containing all the selected train data
#  step 2: the same for the test data
#  step 3: merge train and test sets and add variable names
########################################################################


## step 1 ##########################################################
#
# make a dataframe trn with the cololmns
# 1    - the identification number of the subject
# 2:67 - the means and the standard deviations of the measurements 
# 68   - the activity the subject was invoveld in 
#        (NOTE replace actitivity numbers by names )
#
#-------------------------------------------------------------------

#--------------- part 1, the first colomn with the subject nr -----------
part1 <- read.table(".//UCI HAR Dataset//train//subject_train.txt")

#--------------- part 2, colomn 2:67 with the means ands stds -----------
print("reading X_train.txt, this might take a minute or two")
aux <- read.table(".//UCI HAR Dataset//train//X_train.txt")

part2 <- data.frame(aux[,1])
for (idx in 2:66) {
    colnr <- vars[idx,1]
    part2[,idx] <- aux[,colnr]
}

#--------------- part 3, the last colomn with activity ------------------
aux <- read.table(".//UCI HAR Dataset//train//y_train.txt")
names(aux)[1] <- "nr"
#-- replace the number with the activity name from act_name ----------
part3 <- sqldf("
           select act_name.name 
           from aux, act_name
           where aux.nr = act_name.nr
          ")

#-------- merge the parts into one dataframe ----------------
trn <- cbind(part1,part2,part3)


## step 2 ##########################################################
#
# make a dataframe tst with the cololmns
# 1    - the identification number of the measured subject
# 2:67 - the means and the standard deviations of the measerements 
# 68   - the activity the subject was invoveld in 
#        (NOTE replace actitivity numbers by names )
#
#-------------------------------------------------------------------

#--------------- part 1, the first colomn with the subject nr ------------------
part1 <- read.table(".//UCI HAR Dataset//test//subject_test.txt")

#--------------- part 2, colomn 2:67 with the means ands stds ------------------
print("reading X_test.txt, this might take a minute or two")
aux <- read.table(".//UCI HAR Dataset//test//X_test.txt")

part2 <- data.frame(aux[,1])
for (idx in 2:66) {
    colnr <- vars[idx,1]
    part2[,idx] <- aux[,colnr]
}

#--------------- part 3, the last colomn with activity ------------------
aux <- read.table(".//UCI HAR Dataset//test//y_test.txt")
names(aux)[1] <- "nr"
#-- replace the number with the activity name from act_name ----------
part3 <- sqldf("
           select act_name.name 
           from aux, act_name
           where aux.nr = act_name.nr
          ")


#-------- merge the parts into one dataframe ----------------
tst <- cbind(part1,part2,part3)


## step 3 ##########################################################

# merge train and test data into total data tot
tot <- rbind(trn, tst)

# give meaningful column names
names(tot)[1] <- "subject"
for (idx in 1:66) names(tot)[idx+1] <- as.character(vars[idx, 2])
names(tot)[68] <- "activity"


## step 4 create tidy dataset with averages per subject per activity per variable

# create the tidy table with the first two columns only ---
tidy <- sqldf("
         select subject, activity
         from tot
         group by subject, activity
         order by subject, activity             
         ")

# add one by one each of the 66 cols with the right average--------
for (idx in 2:67) {
    #-- build aux df aux[,1]=subjectnr, 
    #----------------aux[,2]=acitivity name, 
    #----------------aux[,3]= variable to average
    aux <- as.data.frame(tot[,1])
    names(aux)[1] <- "V1"
    aux[,2] <- tot[,68]
    aux[,3] <- tot[,idx]
    #---- calculate the group average col
    newcol <- sqldf("
         select AVG(V3)
         from aux
         group by V1, V2
         order by V1, V2             
         ")    
    names(newcol)[1] <- paste("AVG(",names(tot)[idx],")")
    #---- add the new average column to the tidy table
    tidy <- cbind(tidy,newcol)
}    

#-- save the result in a cvs file -------------
write.csv(tidy, file='tidy.csv', row.names=FALSE)

#http://www.cookbook-r.com/Manipulating_data/Summarizing_data/
