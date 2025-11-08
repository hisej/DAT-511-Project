# DAT-511 Project: Data Cleaning and Tidy Data Preparation  
### by Julia Hise

## 📌 Project Overview
This project demonstrates my ability to collect, clean, and organize data from wearable computing devices. The goal was to produce a tidy dataset suitable for further analysis, following the principles of tidy data and reproducible workflows.

The dataset used is the **Human Activity Recognition Using Smartphones** dataset, which contains accelerometer and gyroscope measurements collected from Samsung Galaxy S smartphones worn by participants performing various activities.

## 📁 Repository Contents
- `GroupWork.R`: Main R script that performs all required data wrangling steps.
- `tidy_dataset.csv`: Final tidy dataset containing the average of each variable for each activity and each subject.
- `CodeBook.md`: Documentation of the dataset, including variable definitions, cleaning steps, and analysis overview.
- `README.md`: This file — a guide to the project structure and workflow.

## 🔄 Script Workflow (`GroupWork.R`)
The R script follows five key steps:
1. **Merge Training and Test Data**: Combines both datasets into one unified structure.
2. **Extract Mean and Standard Deviation Measurements**: Filters relevant features using pattern matching.
3. **Apply Descriptive Activity Names**: Replaces activity codes with readable labels.
4. **Label Dataset with Descriptive Variable Names**: Cleans and standardizes column names.
5. **Create Final Tidy Dataset**: Groups by subject and activity, then calculates the mean of each variable.

## 🔗 File Connections
- `GroupWork.R` reads raw data from the `UCI HAR Dataset` folder and outputs `tidy_dataset.csv`.
- `CodeBook.md` explains the structure, variables, and transformations in the tidy dataset.
- `README.md` provides an overview of the project and guides users through the workflow.

## ▶️ How to Run
1. Open `GroupWork.R` in RStudio or another R environment.
2. Ensure the `UCI HAR Dataset` folder is downloaded from the source and its contents unzipped, in the working directory.
3. Run the script from top to bottom to generate `tidy_dataset.csv`.

## 📝 Notes
- All code is commented for clarity and reproducibility.
- The final dataset meets tidy data standards: one observation per row, one variable per column.
- No missing data was present in the original dataset, so no imputation or removal was necessary.

