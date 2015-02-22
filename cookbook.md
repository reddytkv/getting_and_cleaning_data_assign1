#Coursera: Getting and Cleaning Data 
##Course Project1
##CodeBook:

### This file is the cookbook for the data processing:
1. Src Files:
    /data/
        activity_labels.txt
        features.txt          >> contains the text description of the activity
        features_info.txt     >>
        README.txt            >> contains help file
        /test                 >> contains test samples
            subject_test.txt  >> sontains subject info
            X_test.txt        >> contains measure data
            Y_test.txt        >> contains label
        /train                >> contains training samples
            subject_test.txt  >> sontains subject info
            X_test.txt        >> contains measure data
            Y_test.txt        >> contains label

2. The above data(both train and test for X & Y & Subject_test) is read and merged into single data frame
3. fix the column names
4. get mean and std_div measures
5. for each activity and subject create an empty DF and populate avg value for that respective activity & subject.

