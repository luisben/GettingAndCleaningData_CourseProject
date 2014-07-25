# Dataset description

As mentioned in the README, the raw data set inlcudes measures for hundreds of features. Out of these, only 78 were selected for this analysis. The selection was limited to those features that represented either a mean or a standard deviation value. For this analysis, the mean frequency measures are included in the selected features. In total, 78 features were selected for processing and inclusion in the final output of the script.

The final output of the script is the data included in the HAR\_tidy file, from now on referred to as _tidy dataset_ is a collection of the mean value for each of the 78 feature selected from the raw dataset.  There are two identifying values into this dataset, which are also very useful identifiers in the raw dataset : the id for the subject doing activities (thus generating data), and the id for the activity being performed. 

The mean was calculated based on these two identifying variables. The grouping was done first by subject and second by activity. 
I summary, this means that for any row in the tidy dataset, you will find the mean value, for that subject and that activity, for each of the 78 features selected out of the original dataset.



# Transformations

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

# Variables

There is a total of 80 variables. Two of these variables serve to identify the subject participating in the test and the activity being measured. These are referred to as _identifying variables_ and are presented first.

I will refer to the other 78 variables as the _feature variables_.These variables represent the mean value for 78 of the features contained in the original dataset. For the mean calculation, the values where grouped by subject first, and then by activity.

So in quick summary, 

## Identifying variables

### subjectid
  * Long Name:Subject Identifier
  * Type:Integer
  * Range:1..30
  * Meaning:Represents the unique identifier for each of the volunteer subjects in the original study.
  
### activity
  * Long Name:Activity Name
  * Type:String
  * Range: {WALKING,WALKING\_UPSTAIRS,WALKING\_DOWNSTAIRS,SITTING,STANDING,LAYING}
  * Meaning:Represents which one out of the six types of activities reviewed was being performed at the time the measure was taken

## Naming pattern for feature variables 

The 78 feature variables included follow either one of the following two naming patterns:

+ Pattern 1:
\<domain-of-signal>\<signal>-\<variable-extracted>-\<signal-component>

+ Pattern 2:
\<domain-of-signal>\<signal>\<signal-component>-\<variable-extracted>


### Explanation of the elements in the naming patterns

The only difference between patterns is the order of the elements, but the meaning of each elements is the same.
(i.e. these description are valid for both naming patterns)

1. domain-of-signal can be any single value in {t,f}
  * t means it was a time domain signal, taken every 50 Mhz
  * f means it was a frequency signal, obtained from a Fourier transform on time signals
  
2. signal can be any single value in {BodyAcc,GravityAcc,BodyGyro}
  * BodyAcc indicate the signal was from the accelerometer, and then was filtered to obtain the body acceleration
  * GravityAcc indicate the signal was taken from the accelerometer, and then was filtered to obtain the gravity acceleration
  * BodyGyro indicate the signal was taken from the gyroscope 

3. signal-component can be any single value in {X,Y,Z,Mag,Jerk}
  * X,Y or Z indicate it is the corresponding vector component in the measured signal
  * Mag indicate it is the magnitude of the measured signal
  * Jerk indicate it is the calculated Jerk from the measured signal
  
4. variable-extracted can be any single value in {mean(),std(),meanFreq()}
  * mean() means this value is the mean of the corresponding measured values
  * std() means this value is the standard deviatio for the corresponding measured values
  * meanFreq() means this value is the mean of the frequencies for the corresponding measured values
  
### Example breakdown of naming pattern :

For naming pattern 1: 
tBodyAcc-mean()-X
t -> means it is a time domain signal
BodyAcc -> means it is taken from the accelerometer signal, and filtered to only obtain body acceleration
mean() -> means the Mean of the values was calculated
x -> means it was taken from the X component of the signal vector

For naming pattern 2:
tBodyAccMag-std()
t -> means it is a time domain signal
BodyAcc -> means it is taken from the accelerometer signal, and filtered to only obtain body acceleration
Mag -> means the calues collected where the magnitude of the signal vector
std() -> means the standard deviation for the collected values was calculated

### List of feature variables

Following is the full list of variables that follow this naming schema:
Type: Float
Meaning: Please see naming pattern reference to extract full meaning for each variable 

* tBodyAcc-mean()-X
* tBodyAcc-mean()-Y
* tBodyAcc-mean()-Z
* tBodyAcc-std()-X
* tBodyAcc-std()-Y
* tBodyAcc-std()-Z
* tGravityAcc-mean()-X
* tGravityAcc-mean()-Y
* tGravityAcc-mean()-Z
* tGravityAcc-std()-X
* tGravityAcc-std()-Y
* tGravityAcc-std()-Z
* tBodyAccJerk-mean()-X
* tBodyAccJerk-mean()-Y
* tBodyAccJerk-mean()-Z
* tBodyAccJerk-std()-X
* tBodyAccJerk-std()-Y
* tBodyAccJerk-std()-Z
* tBodyGyro-mean()-X
* tBodyGyro-mean()-Y
* tBodyGyro-mean()-Z
* tBodyGyro-std()-X
* tBodyGyro-std()-Y
* tBodyGyro-std()-Z
* tBodyGyroJerk-mean()-X
* tBodyGyroJerk-mean()-Y
* tBodyGyroJerk-mean()-Z
* tBodyGyroJerk-std()-X
* tBodyGyroJerk-std()-Y
* tBodyGyroJerk-std()-Z
* tBodyAccMag-mean()
* tBodyAccMag-std()
* tGravityAccMag-mean()
* tGravityAccMag-std()
* tBodyAccJerkMag-mean()
* tBodyAccJerkMag-std()
* tBodyGyroMag-mean()
* tBodyGyroMag-std()
* tBodyGyroJerkMag-mean()
* tBodyGyroJerkMag-std()
* fBodyAcc-mean()-X
* fBodyAcc-mean()-Y
* fBodyAcc-mean()-Z
* fBodyAcc-std()-X
* fBodyAcc-std()-Y
* fBodyAcc-std()-Z
* fBodyAcc-meanFreq()-X
* fBodyAcc-meanFreq()-Y
* fBodyAcc-meanFreq()-Z
* fBodyAccJerk-mean()-X
* fBodyAccJerk-mean()-Y
* fBodyAccJerk-mean()-Z
* fBodyAccJerk-std()-X
* fBodyAccJerk-std()-Y
* fBodyAccJerk-std()-Z
* fBodyAccJerk-meanFreq()-X
* fBodyAccJerk-meanFreq()-Y
* fBodyAccJerk-meanFreq()-Z
* fBodyGyro-mean()-X
* fBodyGyro-mean()-Y
* fBodyGyro-mean()-Z
* fBodyGyro-std()-X
* fBodyGyro-std()-Y
* fBodyGyro-std()-Z
* fBodyGyro-meanFreq()-X
* fBodyGyro-meanFreq()-Y
* fBodyGyro-meanFreq()-Z
* fBodyAccMag-mean()
* fBodyAccMag-std()
* fBodyAccMag-meanFreq()
* fBodyBodyAccJerkMag-mean()
* fBodyBodyAccJerkMag-std()
* fBodyBodyAccJerkMag-meanFreq()
* fBodyBodyGyroMag-mean()
* fBodyBodyGyroMag-std()
* fBodyBodyGyroMag-meanFreq()
* fBodyBodyGyroJerkMag-mean()
* fBodyBodyGyroJerkMag-std()
* fBodyBodyGyroJerkMag-meanFreq()