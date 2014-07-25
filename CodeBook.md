##Variables

There is a total of 80 variables. 78 of this are labeled as originally named by the authors.

subjectid
  *Long Name:Subject Identifier
  *Type:Integer
  *Range:1..30
  *Meaning:Represents the unique identifier for each of the volunteer subjects in the original study.
  
activity
  *Long Name:Activity Name
  *Type:String
  *Range: {WALKING,WALKING_UPSTAIRS,WALKING_DOWNSTAIRS,SITTING,STANDING,LAYING}
  *Meaning:Represents which one out of the six types of activities reviewed was being performed at the time the measure was taken

the other 78 variables follow the naming pattern:

<domain_of_signal><signal><signal_component>-<variable_extracted>

where:

1) domain_of_signal can be any single value in {t,f}
  *t means it was a time domain signal, taken every 50 Mhz
  *f means it was a frequency signal, obtained from a Fourier transform on time signals
  
2) signal can be any single value in {BodyAcc,GravityAcc,BodyGyro}
  *BodyAcc indicate the signal was from the accelerometer, and then was filtered to obtain the body acceleration
  *GravityAcc indicate the signal was taken from the accelerometer, and then was filtered to obtain the gravity acceleration
  *BodyGyro indicate the signal was taken from the gyroscope 

3) signal_component can be any single value in {X,Y,Z,Mag,Jerk}
  *X,Y or Z indicate it is the corresponding vector component in the measured signal
  *Mag indicate it is the magnitude of the measured signal
  *Jerk indicate it is the calculated Jerk from the measured signal
  
4) variable extracted can be any single value in {mean(),std(),meanFreq()}
  *mean() means this value is the mean of the corresponding measured values
  *std() means this value is the standard deviatio for the corresponding measured values
  *meanFreq() means this value is the mean of the frequencies for the corresponding measured values
  
Following is the full list of variables that follow this naming schema:

*tBodyAcc-mean()-X
*tBodyAcc-mean()-Y
*tBodyAcc-mean()-Z
*tBodyAcc-std()-X
*tBodyAcc-std()-Y
*tBodyAcc-std()-Z
*tGravityAcc-mean()-X
*tGravityAcc-mean()-Y
*tGravityAcc-mean()-Z
*tGravityAcc-std()-X
*tGravityAcc-std()-Y
*tGravityAcc-std()-Z
*tBodyAccJerk-mean()-X
*tBodyAccJerk-mean()-Y
*tBodyAccJerk-mean()-Z
*tBodyAccJerk-std()-X
*tBodyAccJerk-std()-Y
*tBodyAccJerk-std()-Z
*tBodyGyro-mean()-X
*tBodyGyro-mean()-Y
*tBodyGyro-mean()-Z
*tBodyGyro-std()-X
*tBodyGyro-std()-Y
*tBodyGyro-std()-Z
*tBodyGyroJerk-mean()-X
*tBodyGyroJerk-mean()-Y
*tBodyGyroJerk-mean()-Z
*tBodyGyroJerk-std()-X
*tBodyGyroJerk-std()-Y
*tBodyGyroJerk-std()-Z
*tBodyAccMag-mean()
*tBodyAccMag-std()
*tGravityAccMag-mean()
*tGravityAccMag-std()
*tBodyAccJerkMag-mean()
*tBodyAccJerkMag-std()
*tBodyGyroMag-mean()
*tBodyGyroMag-std()
*tBodyGyroJerkMag-mean()
*tBodyGyroJerkMag-std()
*fBodyAcc-mean()-X
*fBodyAcc-mean()-Y
*fBodyAcc-mean()-Z
*fBodyAcc-std()-X
*fBodyAcc-std()-Y
*fBodyAcc-std()-Z
*fBodyAcc-meanFreq()-X
*fBodyAcc-meanFreq()-Y
*fBodyAcc-meanFreq()-Z
*fBodyAccJerk-mean()-X
*fBodyAccJerk-mean()-Y
*fBodyAccJerk-mean()-Z
*fBodyAccJerk-std()-X
*fBodyAccJerk-std()-Y
*fBodyAccJerk-std()-Z
*fBodyAccJerk-meanFreq()-X
*fBodyAccJerk-meanFreq()-Y
*fBodyAccJerk-meanFreq()-Z
*fBodyGyro-mean()-X
*fBodyGyro-mean()-Y
*fBodyGyro-mean()-Z
*fBodyGyro-std()-X
*fBodyGyro-std()-Y
*fBodyGyro-std()-Z
*fBodyGyro-meanFreq()-X
*fBodyGyro-meanFreq()-Y
*fBodyGyro-meanFreq()-Z
*fBodyAccMag-mean()
*fBodyAccMag-std()
*fBodyAccMag-meanFreq()
*fBodyBodyAccJerkMag-mean()
*fBodyBodyAccJerkMag-std()
*fBodyBodyAccJerkMag-meanFreq()
*fBodyBodyGyroMag-mean()
*fBodyBodyGyroMag-std()
*fBodyBodyGyroMag-meanFreq()
*fBodyBodyGyroJerkMag-mean()
*fBodyBodyGyroJerkMag-std()
*fBodyBodyGyroJerkMag-meanFreq()