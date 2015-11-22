---
title: "CodeBook"
author: "Fiorella Henriquez"
date: "22 de noviembre de 2015"
output: html_document
---

Code Book

This code book details all the data fields and transformations in file "tidyData.txt".

Raw Data: data provided was splitted into different files containing datasets, labels and subjects. Also we have activity labels and features in separate files. There are 2 main datasets: train and test in different folders, so both of them are needed to clean to then merge data.

Processed data: activity labels and features need to be read first to identify which features we need to read after (mean, standard deviation). Activity labels and features are cast to character. Then we identify which features contain names including mean and std (for standard deviation). We proceed to read 3 different files for each dataset (train and test). In "X" file we read dataset, in "Y" we read activities and we also have one file called "Subjects" containing subjects. We read 3 files for each dataset and then bind columns for 3 files into 1 file. Then we merge 2 datasets into only one. After this we convert activities and subjects into factors. Then we calculate mean for each measurement, and write output file.

Identifiers

subject - The ID of the test subject
activity - The type of activity performed when the corresponding measurements were taken

Measurements

  tBodyAccMeanX
  tBodyAccMeanY
  tBodyAccMeanZ
  tBodyAccStdX
  tBodyAccStdY
  tBodyAccStdZ
  tGravityAccMeanX
  tGravityAccMeanY
  tGravityAccMeanZ
  tGravityAccStdX
  tGravityAccStdY
  tGravityAccStdZ
  tBodyAccJerkMeanX
  tBodyAccJerkMeanY
  tBodyAccJerkMeanZ
  tBodyAccJerkStdX
  tBodyAccJerkStdY
  tBodyAccJerkStdZ
  tBodyGyroMeanX
  tBodyGyroMeanY
  tBodyGyroMeanZ
  tBodyGyroStdX
  tBodyGyroStdY
  tBodyGyroStdZ
  tBodyGyroJerkMeanX
  tBodyGyroJerkMeanY
  tBodyGyroJerkMeanZ
  tBodyGyroJerkStdX
  tBodyGyroJerkStdY
  tBodyGyroJerkStdZ
  tBodyAccMagMean
  tBodyAccMagStd
  tGravityAccMagMean
  tGravityAccMagStd
  tBodyAccJerkMagMean
  tBodyAccJerkMagStd
  tBodyGyroMagMean
  tBodyGyroMagStd
  tBodyGyroJerkMagMean
  tBodyGyroJerkMagStd
  fBodyAccMeanX
  fBodyAccMeanY
  fBodyAccMeanZ
  fBodyAccStdX
  fBodyAccStdY
  fBodyAccStdZ
  fBodyAccMeanFreqX
  fBodyAccMeanFreqY
  fBodyAccMeanFreqZ
  fBodyAccJerkMeanX
  fBodyAccJerkMeanY
  fBodyAccJerkMeanZ
  fBodyAccJerkStdX
  fBodyAccJerkStdY
  fBodyAccJerkStdZ
  fBodyAccJerkMeanFreqX
  fBodyAccJerkMeanFreqY
  fBodyAccJerkMeanFreqZ
  fBodyGyroMeanX
  fBodyGyroMeanY
  fBodyGyroMeanZ
  fBodyGyroStdX
  fBodyGyroStdY
  fBodyGyroStdZ
  fBodyGyroMeanFreqX
  fBodyGyroMeanFreqY
  fBodyGyroMeanFreqZ
  fBodyAccMagMean
  fBodyAccMagStd
  fBodyAccMagMeanFreq
  fBodyBodyAccJerkMagMean
  fBodyBodyAccJerkMagStd
  fBodyBodyAccJerkMagMeanFreq
  fBodyBodyGyroMagMean
  fBodyBodyGyroMagStd
  fBodyBodyGyroMagMeanFreq
  fBodyBodyGyroJerkMagMean
  fBodyBodyGyroJerkMagStd
  fBodyBodyGyroJerkMagMeanFreq

Activity Labels

  1. WALKING: subject was walking during the test
  2. WALKING_UPSTAIRS: subject was walking up a staircase during the test
  3. WALKING_DOWNSTAIRS: subject was walking down a staircase during the test
  4.SITTING: subject was sitting during the test
  5. STANDING: subject was standing during the test
  6. LAYING: subject was laying down during the test