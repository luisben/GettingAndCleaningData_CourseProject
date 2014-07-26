# README 

This project is meant to help analyze some existing data on intended for Human Activity Recognition (HAR).
The aim is to present the complez raw dataset in a summarized state that allows for some further analysis.

## Instructions

The run\_analysis.R file (the script) will look for the 'getdata\_projectfiles\_UCI HAR Dataset.zip' (the zip file) in the working directory. If it is not found, then it will try to download it. 

The script is self contained so the only thing you need is to either execute it with the zip file present in the working directory, or make sure that your internet connection is working and execute the script without the zip file present. 
To execute the scrip, simply open R studio or an R command line, and source the file like so:
source("run_analysis.R"). The code will execute immediately. There are no functions  defined in the script, so you need to source it every time you want to execute it.

You need to have permission to write into the folder you have as working directory when you run the script.
Even if the zip file is already there, the script will extract its contents, so it will write files.
The output is also written out to a file, so for this it is also needed to have write permission.

If you prefer manual download of the zip file, the following is the url from which it was taken:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Description of Raw data

The raw dataset contains measures from the accelerometer and the gyroscope of a Samsung phone. This data was collected during a study trying to build a classifier that could identify the activity being performed from readings of a similar device.
Due to the purpose of the original study, the data is split into two types : training data, and testing data.

Each of these types  of data is itself split into two files. One contains the id numbers for each of the subjects in the study, the other contains the measure for more than 500 features that were measured and produced during the study, but only a small subset is used in this analysis.


The URL for the original study is the following:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

### Summary of script process

1. Load the four test and train data files into dataframes:
    + one file (X) for train and one for test dataset, containing the values obtained for the features in the original study
    + one file (y) for train and one for test dataset, containing the values of "subject\_id", which represent the subject from whom the measures in (X) where taken
2. Load the data set containing feature names and the activity names into vectors
3. Join the column containing subject\_id to the matching dataset (i.e. test subject\_id dataset with test features dataset)
4. Filter the vector containing feature names to only include those representing a standard deviation or a mean (mean frequency included)
5. Set the column names for the test and train features data frames from the **COMPLETE** vector of feature names
6. Use the **FILTERED** feature names vector to subset both training and test features data frames
7. Convert the activity column on both train and test features datasets into a string factor using the activity names vector
8. rowbind both training and test features data frames into a single data frame
9. Melt the merged data frame and cast into the a new dataframe
10. Write this new data frame into the HAR\_tidy.txt file.

## List of Files
+ README.md  : this file should be read first [hope this was so]
+ CodeBook.md : Contains a description of the output dataset and the variables in it
+ run\_analysis.R : contains the script for processing the raw data and producing the output file.
+ HAR\_tidy.txt : this contains the final output of the script every time you run it it will be overwritten