# getting_and_cleaning_data_assign1
Coursera course - Assignment

### This file describes how run_analysis.R script works:
1. Step 1: downlaod into working folder and unzip the data from [here]( https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) and rename the folder as "srcdata".
..* Make sure the folder "srcdata" and the run_analysis.R script are both in the current working directory.

2. Step 2: Run code "run_analysis.R" in RStudio command prompt. 

3. Step 3: on Executing 2 output files are generated:
..* merged_data.txt (7.9 Mb): it contains a data frame called cleanedData with 10299 X 68 dimension.
..* data_with_means.txt (220 Kb): it contains a data frame called result with 180 X 68 dimension.

4. Run: output <- read.table("data_with_means.txt") command in RStudio to read the file. Since we are required to get the average of each variable for each activity and each subject, and there are 6 activities in total and 30 subjects in total, we have 180 rows with all combinations for each of the 66 features. 
