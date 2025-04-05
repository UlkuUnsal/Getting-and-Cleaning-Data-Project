# Getting and Cleaning Data - Course Project

This repository contains the course project for the Getting and Cleaning Data course on Coursera. The purpose of this project is to demonstrate the ability to collect, clean, and create a tidy dataset that can be used for further analysis.

## Data Source

The data used in this project comes from the [UCI HAR Dataset](httparchive.ics.uci.edumldatasetsHuman+Activity+Recognition+Using+Smartphones), which contains data collected from the accelerometers of the Samsung Galaxy S smartphone.

## Files in this Repository

- `run_analysis.R` R script that downloads, processes, and tidies the data.
- `CodeBook.md` Describes the variables, the data, and the transformations performed.
- `README.md` This file. Describes the project and how the script works.
- `tidy_data.txt` Final tidy dataset created from the raw data.

## How the Script Works (`run_analysis.R`)

1. Downloads the dataset and unzips it.
2. Merges the training and test sets to create one dataset.
3. Extracts only the measurements on the mean and standard deviation.
4. Uses descriptive activity names to name the activities.
5. Labels the data set with descriptive variable names.
6. Creates a second tidy dataset with the average of each variable for each activity and each subject.
7. Saves the final tidy dataset into `tidy_data.txt`.

## Dependencies

This script uses the following R packages

- `dplyr`

Make sure to install it before running the script with `install.packages(dplyr)`.

---
