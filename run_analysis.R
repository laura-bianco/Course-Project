# Step 1 - merging the datasets
#reading the data into R
features <- read.table("features.txt", stringsAsFactors = FALSE)
test_data <- read.table("X_test.txt", header = FALSE, sep = "", fill = TRUE)
activity_test <- read.table("y_test.txt")
activity_train <- read.table("y_train.txt")
subject_train <- read.table("subject_train.txt")
subject_test <- read.table("subject_test.txt")
train_data <- read.table("X_train.txt", header = FALSE, sep = "", fill = TRUE)

#Renaming them to their features (Step 4 is completed early here)
colnames(test_data) <- features$V2
colnames(train_data) <- features$V2

#making two separate data frames
df_train <- data.frame(train_data, activity_train, subject_train)
df_test <- data.frame(test_data, activity_test, subject_test)

#merging the two data frames
merged_df <- rbind(df_train,df_test)

# Step 2 - extracting the mean and std only
library(dplyr)
selected_cols <- merged_df %>%
     select(-(matches("Freq|mad|max|min|sma|energy|iqr|entropy|arCoeff|correlation|max|Inds|skewness|kurtosis|Energy|angle")))

# Step 3 
#changing the numbers to activity name
activity_labels <- read.table("activity_labels.txt", header = FALSE)
colnames(selected_cols)[67] <- "Activity"
selected_cols$Activity <- factor(selected_cols$Activity, levels = activity_labels$V1, labels = activity_labels$V2)
colnames(selected_cols)[68] <- "Subject"

# Step 5
tidy_data <- selected_cols %>%
     group_by(Subject, Activity) %>%
     summarise_all(mean)

# writing the tidy data set into a new file
write.table(tidy_data, file = "tidy_data.txt", row.names = FALSE)
