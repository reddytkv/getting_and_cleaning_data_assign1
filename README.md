# getting_and_cleaning_data_assign1
Coursera course - Assignment

### This file describes how run_analysis.R script works:
1. Step 1: downlaod into working folder and unzip the data from [here]( https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) and rename the folder as "srcdata".
..* Make sure the folder "srcdata" and the run_analysis.R script are both in the current working directory.

2. Step 2: Run code "run_analysis.R" in RStudio command prompt. 

3. Step 3: In the working dorectory, you will see the required data output 
..* TidayData - complete_data.txt: it contains a data frame with domensions 10299 X 68.

4. Step 4: An output is generated with Avg for each variable and each subject.
..*There are 6 activities and 30 subjects in total, we have 180 rows with all combinations and for each features. 
