---
output:
  pdf_document: default
  html_document: default
---

# CodeBook.md

## Project Title
**Human Activity Recognition Using Smartphones — Tidy Dataset Summary**  
Prepared by Julia Hise for DAT 511 Project

---

## Source Data

The original dataset was obtained from the [UCI Machine Learning Repository](https://archive.ics.uci.edu/ml/datasets/human+activity+recognition+using+smartphones). It contains sensor signals collected from smartphones worn by 30 subjects performing six activities.

First, I downloaded this dataset and unzipped the  downloaded folder into a folder I named "UCI HAR Dataset".

---

## Data Cleaning and Transformation Steps

1. **Merged training and test datasets**  
   Combined `subject_train`, `X_train`, and `y_train` with their test counterparts to form one merged dataset.

2. **Extracted measurements on the mean and standard deviation**  
   Selected only variables containing raw `mean()` and `std()` values. Excluded derived metrics like `meanFreq()` and `angle()`.

3. **Replaced activity codes with descriptive names**  
   Mapped numeric codes to activity labels: `WALKING`, `SITTING`, `LAYING`, `STANDING`, etc.

4. **Cleaned variable names**  
   - Removed punctuation and expanded abbreviations:
     - `Acc` to `Accelerometer`
     - `Gyro` to `Gyroscope`
     - `Mag` to `Magnitude`
     - `t` to `Time`, `f` to `Frequency`
   - Ensured consistent and readable naming across all variables in the dataset.

5. **Created final tidy dataset**  
   - Grouped by `subject` and `activity`
   - Calculated the average of each variable for each group
   - Saved as `tidy_dataset.txt` and `tidy_dataset.csv`

---

## Variables in Tidy Dataset

| Variable Name                                | Description                                                                 |
|---------------------------------------------|-----------------------------------------------------------------------------|
| `subject`                                    | Identifier for each participant (1–30)                                      |
| `activity`                                   | Descriptive label of the activity performed                                 |
| `TimeBodyAccelerometer.meanX`                | Mean of body accelerometer signal in X direction (time domain)             |
| `TimeBodyAccelerometer.meanY`                | Mean of body accelerometer signal in Y direction (time domain)             |
| `TimeBodyAccelerometer.meanZ`                | Mean of body accelerometer signal in Z direction (time domain)             |
| `TimeBodyAccelerometer.stdX`                 | Standard deviation of body accelerometer signal in X direction             |
| `TimeBodyAccelerometer.stdY`                 | Standard deviation of body accelerometer signal in Y direction             |
| `TimeBodyAccelerometer.stdZ`                 | Standard deviation of body accelerometer signal in Z direction             |
| `TimeGravityAccelerometer.meanX`             | Mean of gravity accelerometer signal in X direction                        |
| `TimeGravityAccelerometer.meanY`             | Mean of gravity accelerometer signal in Y direction                        |
| `TimeGravityAccelerometer.meanZ`             | Mean of gravity accelerometer signal in Z direction                        |
| `TimeGravityAccelerometer.stdX`              | Standard deviation of gravity accelerometer signal in X direction         |
| `TimeGravityAccelerometer.stdY`              | Standard deviation of gravity accelerometer signal in Y direction         |
| `TimeGravityAccelerometer.stdZ`              | Standard deviation of gravity accelerometer signal in Z direction         |
| `TimeBodyAccelerometerJerk.meanX`            | Mean of body accelerometer jerk signal in X direction                      |
| `TimeBodyAccelerometerJerk.stdZ`             | Standard deviation of body accelerometer jerk signal in Z direction       |
| `TimeBodyGyroscope.meanX`                    | Mean of body gyroscope signal in X direction                               |
| `TimeBodyGyroscope.stdZ`                     | Standard deviation of body gyroscope signal in Z direction                |
| `FrequencyBodyAccelerometer.meanX`           | Mean of body accelerometer signal in X direction (frequency domain)       |
| `FrequencyBodyAccelerometer.stdZ`            | Standard deviation of body accelerometer signal in Z direction (frequency)|
| `FrequencyBodyGyroscope.meanX`               | Mean of body gyroscope signal in X direction (frequency domain)           |
| `FrequencyBodyGyroscope.stdZ`                | Standard deviation of body gyroscope signal in Z direction (frequency)    |
| *(…and so on for all 50 cleaned variables)*  |                                                                             |


---

## Missing Data Handling

No missing values were present in the original dataset. All sensor measurements were complete across subjects and activities. Therefore, no imputation, interpolation, or removal of rows was necessary.

This completeness is likely due to the controlled data collection methods used in the original study.

---

## Code Instructions

To reproduce the tidy dataset:

1. Open `GroupWork.R` in RStudio.
2. Ensure the unzipped `"UCI HAR Dataset"` folder is in the same directory as your script.
3. Run the script from top to bottom.
4. The final tidy dataset will be saved as `tidy_dataset.txt` and `tidy_dataset.csv` (depending on the preferred format).

Required R packages:
```r
library(dplyr)
```

---

## File Output

- `tidy_dataset.txt`/`tidy_dataset.csv`: Final tidy dataset with 180 rows (30 subjects × 6 activities) and 50+ variables  
- Saved in the `directory` folder, without row names

