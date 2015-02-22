### Getting & Cleaning Data Assignment - 02/19/2015
###run_analysis.R

### Merge Training and test Data set
### set working directory appropriately
#setwd("~/coursera/Getting and Cleaning Data/Assignment1/getting_and_cleaning_data_assign1")
#------------------------------------------------------------------------------------
#Step 1: Merges the training and the test sets to create one data set.
## Read Training Data
trd <- read.table("./srcdata/train/X_train.txt")  ## 561 cols
trl <- read.table("./srcdata/train/y_train.txt")
trs <- read.table("./srcdata/train/subject_train.txt")

## Read Test Data
ted <- read.table("./srcdata/test/X_test.txt")  ## 561 cols
tel <- read.table("./srcdata/test/y_test.txt")
tes <- read.table("./srcdata/test/subject_test.txt")

### verify both Dims for above 3 sets, they are same , so row bind to get full datasets
jd <- rbind(trd, ted) # test & Train fact data
jl <- rbind(trl, tel) # Activcity Number
js <- rbind(trs, tes) # subject Number

#merged data set
ds <- (js,jl,jd)
#------------------------------------------------------------------------------------
#Step2: Extracts only the measurements on the mean and standard deviation for each measurement.
ftrs <- read.table("./srcdata/features.txt") #561 rows
mean_stddiv <- grep("mean\\(\\)|std\\(\\)", ftrs[, 2]) # gets 66 matching attributes
joined_mean_std <- jd[, mean_stddiv]


#------------------------------------------------------------------------------------
#Step3: Uses descriptive activity names to name the activities in the data set
acty <-  read.table("./srcdata/activity_labels.txt")
#View(acty)
names(acty) <- c("Activity_Number", "Activity")
names(jl) <- c("Activity_Number")
names(js) <- c("Subject_Number")
names(jd) <- ftrs[,2]

#Join and create Activity in the Y axis data frame(jl)
Activity_DF <- merge(x=jl, y=acty, by = "Activity_Number", all.x=TRUE)
# verify #dim(acty) #dim(jl)#dim(Activity_DF)

# Full data with names 
fd <- cbind(js, Activity_DF, jd)
#Correct name issues to allowed names
names(fd) <- gsub("-", ".", names(fd)) # replace - with dot
names(fd) <- gsub("\\(\\)", "", names(fd)) # replace brackets
names(fd) <- gsub("\\,", "", names(fd)) # replace comma
names(fd) <- gsub("\\(", ".", names(fd)) # replace open bracket with dot
names(fd) <- gsub("\\)", ".", names(fd)) # replace close bracket with nothing

#------------------------------------------------------------------------------------
#Step4: Appropriately labels the data set with descriptive variable names. 
#Already done as part of step 3 
head(fd)

#------------------------------------------------------------------------------------
#Step5: From the data set in step 4, creates an output df with the average of each variable 
#       for each activity and each subject.
library(dplyr)

# Create empty Data frame for each subject and Activity
subjects <- unique(js)
activities <- acty[,2]
output <-  merge(x = subjects, y = activities, by = NULL)

for (j in 1:nrow(output)) { # for each row in output df
  fd.subset <- filter(fd, Subject_Number == output[j,1], Activity == output[j,2] )
  subset.grp <-  group_by(fd.subset, Subject_Number,Activity)

  for (i in 4:ncol(fd)) { # for each column measure
    k <- i-1 # to compensate for 1 less col
    #df[, k] <- NA
    names(output[k]) <- colnames(fd[i])
    output[j,k] = summarise(subset.grp, mean(subset.grp[,i], na.rm = TRUE))  # generates required average
    
  }
}

head(output,2)
#------------------------------------------------------------------------------------
