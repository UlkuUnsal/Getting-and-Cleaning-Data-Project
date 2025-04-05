# download and unzip the data

url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url, destfile = "dataset.zip", mode = "wb")
unzip("dataset.zip")

# read train data
x_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")

# read test data
x_test <- read.table("UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")

# merge data
x <- rbind(x_train, x_test)
y <- rbind(y_train, y_test)
subject <- rbind(subject_train, subject_test)

#choose features for mean and standart deviation
features <- read.table("UCI HAR Dataset/features.txt")
mean_std_idx <- grep("mean\\(\\)|std\\(\\)", features$V2)  # sadece ortalama ve std içerenleri al
x <- x[, mean_std_idx]
names(x) <- features[mean_std_idx, 2]

# activity labels
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
y[, 1] <- activity_labels[y[, 1], 2]
names(y) <- "Activity"

# names 
names(subject) <- "Subject"
cleaned <- cbind(subject, y, x) 

# calculate average for each group
library(dplyr)

tidy_data <- cleaned %>%
  group_by(Subject, Activity) %>%
  summarise_all(mean)

write.table(tidy_data, "tidy_data.txt", row.name = FALSE)
