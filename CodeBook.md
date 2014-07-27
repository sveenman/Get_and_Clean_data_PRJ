**Get_and_Clean_data_PRJ**
---
**1.	THE PROVIDED TEST AND TRAINING FILES ARE IMPORTED**

* UCI HAR Dataset/test/X_test.txt
* UCI HAR Dataset/test/y_test.txt
* UCI HAR Dataset/test/subject_test.txt
* UCI HAR Dataset/train/X_train.txt
* UCI HAR Dataset/train/y_train.txt
* UCI HAR Dataset/train/subject_train.txt
* UCI HAR Dataset/activity_labels.txt
* UCI HAR Dataset/features.txt

**2. THE ACTIVITIES AND LABELS ARE ADDED TO THE TEST AND TRAIN DATA SET**

**3. THE FEATURES FILE IS USED TO DEFINE THE FIELD NAMES TO THE DATASET**

**4. THE COLNAMES ARE ADJUSTED:**

* The y_test and y_train now have the colname "activity"
* subject_test and subject_train now have "subject" as colname.

**5. NOW ALL THE SETS ARE JOINED TOGETHER BY COLUMN (CBIND) AND THEN THE ROWS ARE MERGED (RBIND)**

**6. THE MEAN AND STANDARD DEVIATION OF EACH MEASUREMENTS IS THEN TAKEN**

**7. THE FINAL STEP IS THAT A TIDY DATA SET (CALLED TIDY.TXT) IS CREATED BASED ON THE AVERAGE FOR ALL VALUES BY ACTIVITY AND SUBJECT.**
