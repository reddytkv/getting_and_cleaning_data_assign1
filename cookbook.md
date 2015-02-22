#Coursera: Getting and Cleaning Data 
##Course Project1
##CodeBook:

### This file is the cookbook for the data processing:
---
#####1. Src Files:
     /data/
       * activity_labels.txt
       * features.txt          >> contains the text description of the activity
       * features_info.txt     >>
       * README.txt            >> contains help file
       * /test                 >> contains test samples
       *    subject_test.txt  >> sontains subject info
       *    X_test.txt        >> contains measure data
       *     Y_test.txt        >> contains label
       * /train                >> contains training samples
       *    subject_test.txt  >> sontains subject info
       *    X_test.txt        >> contains measure data
       *    Y_test.txt        >> contains label
----
#####2. The above data(both train and test for X & Y & Subject_test) is read and merged into single data frame
    * /train/X_train.txt read into trd df 561 cols * 7352 rows(obs).
    * /train/y_train.txt read into trl df 7352 * 1 df
    * /train/subject_train.txt into trs df 7352 *1 df
    ** /test/X_train.txt read into ted df 561 cols * 2947 rows(obs).
    * /test/y_train.txt read into tel df 2947 * 1 df
    * /test/subject_train.txt into tes df 2947 *1 df
    ** jd  is df of size 10299 * 561
    * jl is df of size 10299 * 1 
    * js is df of 10299* 1
    
#####3. fix the column names 
    * replaced ()
    * replaced - with dot.
    * replaces open & Close Braces
#####4. get mean and std_div measures
    * filtered the measure which have mean and std div and laoded into df - joined_mean_std - 10299 * 66 df
#####5. for each activity and subject create an empty DF and populate avg value for that respective activity & subject.
    * using dlpyr grouped and loaded into empty df - output - 180 * 563

