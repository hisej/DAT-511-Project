### DAT 511 - Group Project ###
### by Julia Hise ###

rm(list=ls()) #Clear workspace

### Set working directory ###
setwd("C:/Users/Julia/OneDrive/Desktop/DAT 511/Project/directory")


### Load required library ###
library(dplyr)


### STEP 1 - Merge Training and Test Data ###

### Define data path ###
data_path <- "UCI HAR Dataset"

### Load metadata ###
features <- read.table(file.path(data_path, "features.txt"), col.names = c("index", "feature"))
activities <- read.table(file.path(data_path, "activity_labels.txt"), col.names = c("code", "activity"))

### Load training data ###
subject_train <- read.table(file.path(data_path, "train", "subject_train.txt"), col.names = "subject")
x_train <- read.table(file.path(data_path, "train", "X_train.txt"), col.names = features$feature)
y_train <- read.table(file.path(data_path, "train", "y_train.txt"), col.names = "activity_code")

### Load test data ###
subject_test <- read.table(file.path(data_path, "test", "subject_test.txt"), col.names = "subject")
x_test <- read.table(file.path(data_path, "test", "X_test.txt"), col.names = features$feature)
y_test <- read.table(file.path(data_path, "test", "y_test.txt"), col.names = "activity_code")

### Merge training and test sets ###
subject <- rbind(subject_train, subject_test)
x_data <- rbind(x_train, x_test)
y_data <- rbind(y_train, y_test)

### Combine all into one dataset ###
merged_data <- cbind(subject, y_data, x_data)




### STEP 2 - Extract Relevant Measurements ###

# Use grepl to find column names with mean() or std()
selected_features <- grep("mean\\.\\.\\.|std\\.\\.\\.", colnames(merged_data), value = TRUE)

# Subset merged_data to include subject, activity_code, and selected features
extracted_data <- merged_data[, c("subject", "activity_code", selected_features)]


### STEP 3 - Descriptive Activity Names ###

# Merge with activity labels to get descriptive names
extracted_data <- merge(extracted_data, activities, by.x = "activity_code", by.y = "code", all.x = TRUE)

# Reorder columns: subject, activity, then measurements
extracted_data <- extracted_data[, c("subject", "activity", selected_features)]

# Preview data
#View(extracted_data)


### STEP 4 - Label data with descriptive, cleaned names

# Get current column names
clean_names <- names(extracted_data)

# Apply transformations
clean_names <- gsub("\\.\\.\\.", "", clean_names)         # Remove triple dots
clean_names <- gsub("\\.\\.", "", clean_names)            # Remove double dots
clean_names <- gsub("^t", "Time", clean_names)            # Prefix 't' to Time
clean_names <- gsub("^f", "Frequency", clean_names)       # Prefix 'f' to Frequency
clean_names <- gsub("Acc", "Accelerometer", clean_names)
clean_names <- gsub("Gyro", "Gyroscope", clean_names)
clean_names <- gsub("Mag", "Magnitude", clean_names)
clean_names <- gsub("BodyBody", "Body", clean_names)      # Fix the duplicate 'Body'

# Assign cleaned names back to dataset
names(extracted_data) <- clean_names

# Preview cleaned dataset
#View(extracted_data)
#View(clean_names)


### STEP 5 - Create tidy data

# Group by subject and activity, then calculate the mean of each variable
tidy_dataset <- extracted_data %>%
  group_by(subject, activity) %>%
  summarise(across(everything(), mean), .groups = "drop")

#View(tidy_dataset)

# Save the tidy dataset to a text file
write.table(tidy_dataset, file = "tidy_dataset.txt", row.names = FALSE)

# Save the tidy dataset to a csv file
write.csv(tidy_dataset, file = "tidy_dataset.csv", row.names = FALSE)
