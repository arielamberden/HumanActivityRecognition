##CodeBook

##Variables
##### data_columns: data table of measurement titles loaded from features.txt of the UCI Human Activity Recognition dataset
##### colnames: extracts measurement titles from the data_columns data table
##### std: numeric vector of column numbers corresponding to columns that contain standard deviation measurements
##### mn: numeric vector of column numbers corresponding to columns that contain mean measurements
##### desired_columns: numeric vector combining column numbers in std and mn
##### activity_labels: data table of activity labels loaded from activity_labels.txt of the UCI Human Activity Recognition ##### dataset
##### activities: extracts labels from activity_labels
##### test_subject/train_subject: data table of subject id numbers for test and training sets in the UCI Human Activity 
##### Recognition dataset
##### test_x/train_x: measurement tables from the UCI Human Activity Recognition dataset
##### test_y/train_y: data table of activity ids the UCI Human Activity Recognition dataset
##### test_data/train_data: combination column-wise of subject, activity, and measurements
##### full_data: combination row-wise of test_data and train_data
##### averages: aggregate averages of full_data by subject and activity

##Data
##### UCI Human Activity Recognition Using Smartphones Data Set
##### http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
##### Files used:
#####	    activity_labels.txt - provides labels for activity codes given in Y_test.txt and Y_train.txt files
#####	    features.txt - provides column labels for measurement tables given in X_test.txt and X_train.txt files
#####	    subject_test.txt - provides subject ID for measurements
#####	    X_test.txt - motion measurements take by smartphone, each row is one test instance
#####	    Y_test.txt - activity code for human activity being performed 
#####	    subject_train.txt - provides subject ID for measurements
#####	    X_train.txt - motion measurements take by smartphone, each row is one test instance
#####	    Y_train.txt - activity code for human activity being performed

##Data Transformations to Clean Data
#####	    1. Reduce data columns of X data frame to columns containing “std” and “mean” for both test and training sets
#####	    2. Combine test Subject, Y, and X data frames column-wise for both test and training sets
#####	    3. Combine test and training data frames row-wise using rbind 
#####	    4. Compute averages over subject ids and activities using aggregate and store in new data frame

## Output is written to AveragesTable.txt
