**Get_and_Clean_data_PRJ**
---
1.	The provided test and training files are imported
-----------
* UCI HAR Dataset/test/X_test.txt
* UCI HAR Dataset/test/y_test.txt
* UCI HAR Dataset/test/subject_test.txt
* UCI HAR Dataset/train/X_train.txt
* UCI HAR Dataset/train/y_train.txt
* UCI HAR Dataset/train/subject_train.txt
* UCI HAR Dataset/activity_labels.txt
* UCI HAR Dataset/features.txt

2. The activities and labels are added to the test and train data set
-----------

3. The features file is used to define the field names to the dataset
-----------

4. The colnames are adjusted:
-----------
* The y_test and y_train now have the colname "activity"
* subject_test and subject_train now have "subject" as colname.

5. Now all the sets are joined together by column (cbind) and then the rows are merged (rbind)
-----------

6. The mean and standard deviation of each measurements is then taken
-----------

7. The final step is that a tidy data set (called tidy.txt) is created based on the average for all values by activity and subject.
-----------
