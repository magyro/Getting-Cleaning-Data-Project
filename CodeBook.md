---
output: html_document
---
               
#                 DESCRIPTORS AND MEASUREMENTS OF HUMAN ACTIVITY RECOGNITION USING SMARTPHONE DATASET 

##                      _DATA COLLECTION DESCRIPTION_
______
  
    
      
      
###Summary  

The data handled by this project relies on the data supplied by the group who carried on the original tests. It can be accessed in    
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
The data contains information from 30 tested subjects who were asked to perform 6 activities which were sampled and recorded. The subjects are devided into two groups:"test" and "train" and so is most of the data collected.
Each activity is sampled by 561 features as listed below.
This project builds a full and tidy data set of all the information, than it supplies readable activity names and attribute names.
Finally it extracts a dataframe with a reduced set of features and it builds a second data frame which introduces average quantities for certain groups of attrubutes from the first data frame.   
    
###Available Data (Input)   

The input data files are:  

1. 'features.txt': List of all features.
Contains a table of two columns and 561 rows, denoting the code and the name of the feature tested

2. 'activity_labels.txt': Links the class labels with their activity name.
Contains 6 numeric values (1:6) and string variables as follows:  
WALKING  
WALKING_UPSTAIRS  
WALKING_DOWNSTAIRS  
SITTING  
STANDING  
LAYING  

3. 'train/X_train.txt': Training group test results.
Represented in tabular form with 7352 rows (containing the tests performed and 561 columns denoting the features tested).

4. 'train/y_train.txt': Training group tests labels.
Represented as a list of 7352 activity codes by integer numbers, each line corresponds to a test performed in the X_train file.

5. 'test/X_test.txt': Test group test results.
Represented in tabular form with 2947 rows (containing the tests performed and 561 columns denoting the features tested).

6. 'test/y_test.txt': Test group  tests labels.
Represented as a list of 2947 activity codes by integer numbers, each line corresponds to a test performed in the X_test file.  

7. 'subject_train.txt': Detailing the subjects who took part in the train group, as a vector of the subjects numbers fitting the tests performed.
The file contains 7352 integers.

8. 'subject_test.txt': Detailing the subjects who took part in the group, as a vector of the subjects numbers fitting the tests performed.
The file contains 2947 integers.

_______________

### Intermediate  Datasets  

1. __'feturesLabels'__:  An auxiliary dataframe consisting of all feature codes and feature labels tested. It consists of 561 observations with two columns.    
+ Method of creation:  
    * Read the data from the 'features.txt' file.
2. __'allMeasurements'__: A dataframe consisting of the test results of both groups and the data related to them. 
It consists of 10299 observations each of 563 variables. 
+ Method of creation:
    * Create a new dataframe for train data, by merging the column of the subject from the  subject_train file, the activity code column from train Y file
    to the data of the measurements. 
    Total 563 colunms and 2947 rows.
    * Create in a similar manner a new dataframe for test data.
    Total 563 colunms and 7352 rows. 
    * Merge the two dataframe by rows and get a dataframe of 10299 rows and 563 columns 
    * Create column names from the features labels in the dataframe as translated in the file 'features.txt'. This requires two labels which are inserted manually: "Subject" and "Activity" for the two columns which are not features and are presented in the dataframe.
    
3. __'meanAndStdMeasurements'__:A dataframe of the measurements on the mean and standard deviation for each measurement.
It consists of 10299 observations each of 68 variables.
+ Method of creation:
    * Extracting the Subject, The Activity and the mean() and std() columns out of all the features.
    * Replacing the activity codes from the lookup table 'activity_labels.txt'.  
    
_______________

### Output DataSet

 __'averageActivities'__: A tidy dataframe with a header row. Its data contains the average of each variable for each activity and each subject.
It consistes of 180 (6 activities for 30 subjects) observations and 68 variables.
(2 identifing variables, 33 for the mean()variables and 33 for thr std() variables)  
+ Method of creation:
    * By calculating the means along columns of the intersected data of subject and activity from meanAndStdMeasurements dataframe (see above).  
    
_______________      


### Codebook For  __'featureLabels'__  

Variable Name       | Type      | Description           | Values   
-------------        ----        -----------             ------     
V1                  | Integer   | Serial number         |  1 to 561   
V2                  | Character | Test Textual labels   | See the list below.  


The variable labels are build by combining signal names with functional activities.    
These are the signals that were used to estimate variables of the feature vector for each pattern: ('-XYZ' is used to denote 3-axial signals in the X, Y and Z directions).

tBodyAcc-XYZ  
tGravityAcc-XYZ  
tBodyAccJerk-XYZ  
tBodyGyro-XYZ  
tBodyGyroJerk-XYZ  
tBodyAccMag  
tGravityAccMag  
tBodyAccJerkMag  
tBodyGyroMag  
tBodyGyroJerkMag  
fBodyAcc-XYZ  
fBodyAccJerk-XYZ  
fBodyGyro-XYZ  
fBodyAccMag  
fBodyAccJerkMag  
fBodyGyroMag  
fBodyGyroJerkMag  

The set of variables that were estimated from these signals are:   

mean(): Mean value  
std(): Standard deviation  
mad(): Median absolute deviation   
max(): Largest value in array  
min(): Smallest value in array  
sma(): Signal magnitude area  
energy(): Energy measure. Sum of the squares divided by the number of values.   
iqr(): Interquartile range   
entropy(): Signal entropy  
arCoeff(): Autorregresion coefficients with Burg order equal to 4  
correlation(): correlation coefficient between two signals  
maxInds(): index of the frequency component with largest magnitud  e
meanFreq(): Weighted average of the frequency components to obtain a mean frequency  
skewness(): skewness of the frequency domain signal   
kurtosis(): kurtosis of the frequency domain signal   
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.  
angle(): Angle between to vectors.  

Additional vectors obtained by averaging the signals in a signal window sample.   These are used on the angle() variable:  

gravityMean  
tBodyAccMean  
tBodyAccJerkMean  
tBodyGyroMean  
tBodyGyroJerkMean  

Examples of feature labels are given here:  
tBodyAcc-mean()-X  
tBodyAcc-mean()-Y  
tBodyAcc-mean()-Z   
tBodyGyroJerk-energy()-Y  
tBodyGyroJerk-energy()-Z  
angle(X,gravityMean)  
angle(Y,gravityMean)  


### Codebook For  __'allMeasurements'__

Variable Name   | Type      | Description           | Values  
-------------    ----        -----------             ------     
Subject         | Integer   | Subject code          |  1 to 30   
Activity        | Integer   | Activity code         |  1 to 6  
561 labels from | Numeric   | Test value            | As given in the measurements
'featureLabels' |           |                       |   
dataframe       |           |                       |    

### Codebook For  __'meanAndStdMeasurements'__

Variable Name   | Type      | Description       | Values  
-------------    ----        -----------         ------     
Subject         | Integer   | Subject Code      |  1 to 30   
Activity        | Character | Activity Name     |  Complies with activity_label.txt
66 mean () and  | Numeric   | Test Value        |  As given in the measurements
std() labels    |           |                   |  
from            |           |                   |    
'featureLabels' |           |                   |   
dataframe       |           |                   |     
          
### Codebook For  __'averageActivities'__

Variable Name           | Type          | Description           | Values  
-------------           ----            -----------             ------               
Subject                 | Integer       | Subject Code          |  1 to 30   
Activity                | Character     | Activity Name         | WALKING      
                        |               |                       | WALKING_UPSTAIRS   
                        |               |                       |WALKING_DOWNSTAIRS    
                        |               |                       | SITTING    
                        |               |                       | STANDING    
                        |               |                       | LAYING                            
tBodyAcc-mean()-X       |               |                       | For all variables   
tBodyAcc-mean()-Y       |               |                       | in the row:  
tBodyAcc-mean()-Z       |               |                       | The average of   
tBodyAcc-std()-X        |               |                       | each variable   
tBodyAcc-std()-Y        |               |                       | from    
tBodyAcc-std()-Z        |               |                       | 'meanAndStd- 
tGravityAcc-mean()-X    |               |                       |  -'Measurements'  
tGravityAcc-mean()-Y    |               |                       | for each activity      
tGravityAcc-std()-X     |               |                       | and each subject      
tGravityAcc-std()-Y     |               |                       |    
tGravityAcc-std()-Z     |               |                       |    
tBodyAccJerk-mean()-X   |               |                       |     
tBodyAccJerk-mean()-Y   |               |                       |      
tBodyAccJerk-mean()-Z   |               |                       |      
tBodyAccJerk-std()-X    |               |                       |    
tBodyAccJerk-std()-Y    |               |                       |     
tBodyAccJerk-std()-Z    |               |                       |     
tBodyGyro-mean()-X      |               |                       |   
tBodyGyro-mean()-Y      |               |                       |   
tBodyGyro-mean()-Z      |               |                       |   
tBodyGyro-std()-X       |               |                       |  
tBodyGyro-std()-Y       |               |                       |  
tBodyGyro-std()-Z       |               |                       |  
tBodyGyroJerk-mean()-X  |               |                       |     
tBodyGyroJerk-mean()-Y  |               |                       |      
tBodyGyroJerk-mean()-Z  |               |                       |      
tBodyGyroJerk-std()-X   |               |                       |     
tBodyGyroJerk-std()-Y   |               |                       |      
tBodyGyroJerk-std()-Z   |               |                       |      
tBodyAccMag-mean()      |               |                       |  
tBodyAccMag-std()       |               |                       |  
tGravityAccMag-mean()   |               |                       |     
tGravityAccMag-std()    |               |                       |    
tBodyAccJerkMag-mean()  |               |                       |    
tBodyAccJerkMag-std()   |               |                       |     
tBodyGyroMag-mean()     |               |                       |   
tBodyGyroMag-std()      |               |                       |   
tBodyGyroJerkMag-mean() |               |                       |          
tBodyGyroJerkMag-std()  |               |                       |          
fBodyAcc-mean()-X       |               |                       |  
fBodyAcc-mean()-Y       |               |                       |   
fBodyAcc-mean()-Z       |               |                       |  
fBodyAcc-std()-X        |               |                       |  
fBodyAcc-std()-Y        |               |                       |  
fBodyAcc-std()-Z        |               |                       |  
fBodyAccJerk-mean()-X   |               |                       |        
fBodyAccJerk-mean()-Y   |               |                       |          
fBodyAccJerk-mean()-Z   |               |                       |          
fBodyAccJerk-std()-X    |               |                       |     
fBodyAccJerk-std()-Y    |               |                       |     
fBodyAccJerk-std()-Z    |               |                       |     
fBodyGyro-mean()-X      |               |                       |   
fBodyGyro-mean()-Y      |               |                       |  
fBodyGyro-mean()-Z      |               |                       |   
fBodyGyro-std()-X       |               |                       |  
fBodyGyro-std()-Y       |               |                       |  
fBodyGyro-std()-Z       |               |                       |  
fBodyAccMag-mean()      |               |                       |   
fBodyAccMag-std()       |               |                       |  
fBodyBodyAccJerkMag-mean()  |           |                       |     
fBodyBodyAccJerkMag-std()   |           |                       |     
fBodyBodyGyroMag-mean()     |           |                       |   
fBodyBodyGyroMag-std()      |           |                       |   
fBodyBodyGyroJerkMag-mean() |           |                       |      
fBodyBodyGyroJerkMag-std()  |           |                       |             
          
       
