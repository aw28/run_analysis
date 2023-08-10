
library(dplyr)
library(codebookr)
library(haven)

if(!file.exists("./week_4_quiz/harus.zip")){
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileURL, destfile = "./week_4_quiz/harus.zip", method = "curl")
}

unzip("./week_4_quiz/harus.zip")

harus_df <- read.csv("./week_4_quiz/harus.csv")

if (!file.exists("UCI HAR Dataset")) { 
  unzip("./week_4_quiz/harus.zip") 
}

# Load test files
body_acc_x_test <- read.table("./UCI HAR Dataset/test/Inertial Signals/body_acc_x_test.txt")
body_acc_y_test <- read.table("./UCI HAR Dataset/test/Inertial Signals/body_acc_y_test.txt")
body_acc_z_test <- read.table("./UCI HAR Dataset/test/Inertial Signals/body_acc_z_test.txt")

body_gyro_x_test <- read.table("./UCI HAR Dataset/test/Inertial Signals/body_gyro_x_test.txt")
body_gyro_y_test <- read.table("./UCI HAR Dataset/test/Inertial Signals/body_gyro_y_test.txt")
body_gyro_z_test <- read.table("./UCI HAR Dataset/test/Inertial Signals/body_gyro_z_test.txt")

tot_acc_x_test <- read.table("./UCI HAR Dataset/test/Inertial Signals/total_acc_x_test.txt")
tot_acc_y_test <- read.table("./UCI HAR Dataset/test/Inertial Signals/total_acc_y_test.txt")
tot_acc_z_test <- read.table("./UCI HAR Dataset/test/Inertial Signals/total_acc_z_test.txt")

#Load train files
body_acc_x_tr <- read.table("./UCI HAR Dataset/train/Inertial Signals/body_acc_x_train.txt")
body_acc_y_tr <- read.table("./UCI HAR Dataset/train/Inertial Signals/body_acc_y_train.txt")
body_acc_z_tr <- read.table("./UCI HAR Dataset/train/Inertial Signals/body_acc_z_train.txt")

body_gyro_x_tr <- read.table("./UCI HAR Dataset/train/Inertial Signals/body_gyro_x_train.txt")
body_gyro_y_tr <- read.table("./UCI HAR Dataset/train/Inertial Signals/body_gyro_y_train.txt")
body_gyro_z_tr <- read.table("./UCI HAR Dataset/train/Inertial Signals/body_gyro_z_train.txt")

tot_acc_x_tr <- read.table("./UCI HAR Dataset/train/Inertial Signals/total_acc_x_train.txt")
tot_acc_y_tr <- read.table("./UCI HAR Dataset/train/Inertial Signals/total_acc_y_train.txt")
tot_acc_z_tr <- read.table("./UCI HAR Dataset/train/Inertial Signals/total_acc_z_train.txt")

# Load dataframes and rename variables

features <- read.table("./UCI HAR Dataset/features.txt")
  features <- rename(features, "n" = "V1", "features" = "V2")

act_lab <- read.table("./UCI HAR Dataset/activity_labels.txt")
  act_lab <- rename(act_lab, "class_lab" = "V1", "activity" = "V2")

# Load train datasets  
train_set <- read.table("./UCI HAR Dataset/train/X_train.txt")
  colnames(train_set) <- features$features

train_lab <- read.table("./UCI HAR Dataset/train/y_train.txt")
  train_lab <- rename(train_lab, "labels" = "V1")

train_subject <- read.table("./UCI HAR Dataset/train/subject_train.txt")
  train_subject <- rename(train_subject, "id" = "V1")

# Load test datasets    
test_set <- read.table("./UCI HAR Dataset/test/X_test.txt")
  colnames(test_set) <- features$features
  
test_lab <- read.table("./UCI HAR Dataset/test/y_test.txt")
  test_lab <- rename(test_lab, "labels" = "V1")

test_subject <- read.table("./UCI HAR Dataset/test/subject_test.txt")
  test_subject <- rename(test_subject, "id" = "V1")
  
# Combine relevant test datasets into 1
  
test_merged <- cbind(test_subject, test_lab, test_set)

# Combine relevant test datasets into 1

train_merged <- cbind(train_subject, train_lab, train_set)

#combine test and train data

all_data_merged <- rbind(test_merged, train_merged)

all_data_merged$labels <- act_lab[all_data_merged$labels, 2] 

# Need to rename the variables to be meaningful as next step using regex
# prefix 't' = time
# acc = Accelerometer
# gyro = Gyroscope
# mag = Magnitude
# f = frequency domain signals (after FFT applied)
# mean() = Mean
# std() = std
# mad() = Median absolute deviation
# max() = Max
# min() = Min
# sma() = Signal magnitude area
# energy() = Energy measure
# iqr() = IQR
# entropy() = Entropy
# arCoeff() = Autoregression coefficients
# correlation() = Correlation
# maxInds() = Index for max frequency
# meanFreq() = Mean frequency
# skewness() = Skewness
# kurtosis() = Kurtosis
# bandsEnergy() = FFT window energy
# angle() = Vector angle

names(all_data_merged) <- gsub("-", ".", names(all_data_merged))
names(all_data_merged) <- gsub("\\()", "", names(all_data_merged))
names(all_data_merged) <- gsub("^t", "Time", names(all_data_merged))
names(all_data_merged) <- gsub("^f", "Frequency", names(all_data_merged))
names(all_data_merged) <- gsub("Acc", "Accelerometer", names(all_data_merged))
names(all_data_merged) <- gsub("Gyro", "Gyroscope", names(all_data_merged))
names(all_data_merged) <- gsub("mag", "Magnitude", names(all_data_merged))
names(all_data_merged) <- gsub("mean", "Mean", names(all_data_merged))
names(all_data_merged) <- gsub("std", "STD", names(all_data_merged))
names(all_data_merged) <- gsub("mad", "MedianAbsoluteDeviation", names(all_data_merged))
names(all_data_merged) <- gsub("max", "Max", names(all_data_merged))
names(all_data_merged) <- gsub("min", "Min", names(all_data_merged))
names(all_data_merged) <- gsub("sma", "SignalMagnitudeArea", names(all_data_merged))
names(all_data_merged) <- gsub("energy", "EnergyMeasure", names(all_data_merged))
names(all_data_merged) <- gsub("iqr", "IQR", names(all_data_merged))
names(all_data_merged) <- gsub("entropy", "Entropy", names(all_data_merged))
names(all_data_merged) <- gsub("arCoeff", "AutoegressionCoefficients", names(all_data_merged))
names(all_data_merged) <- gsub("correlation", "Correlation", names(all_data_merged))
names(all_data_merged) <- gsub("maxInds", "IndexForMaxFrequency", names(all_data_merged))
names(all_data_merged) <- gsub("meanFreq", "MeanFrequency", names(all_data_merged))
names(all_data_merged) <- gsub("skewness", "Skewness", names(all_data_merged))
names(all_data_merged) <- gsub("kurtosis", "Kurtosis", names(all_data_merged))
names(all_data_merged) <- gsub("bandsEnergy", "FourierWindowEnergy", names(all_data_merged))
names(all_data_merged) <- gsub("angle", "VectorAngle", names(all_data_merged))

# Subset the dataframe using grepl to identify which columns have Mean and STD
# Also ignores the first two columns so ID and activity are part of the new df
mean_std_df <- all_data_merged[, c(TRUE, TRUE, grepl("Mean|STD", names(all_data_merged))[-(1:2)])]

# group by id and labels and summarize all columns using the mean function
mean_std_df_grouped <- mean_std_df %>% 
  group_by(id, labels) %>%
  summarize_all(mean)

# create study codebook using the codebookr package
# https://brad-cannell.github.io/codebookr/#:~:text=codebook%3A%20The%20codebook()%20function,%2C%20source%2C%20column%20type).

mean_std_df_grouped <- mean_std_df_grouped %>%
  cb_add_col_attributes(
    id,
    description = "Unique participant identification",
    source = "subject_test and subject_train datafiles"
  ) %>%
  cb_add_col_attributes(
    labels,
    description = "Activity label",
    source = "activity_labels"
  ) 

CodeBook <- codebook(mean_std_df_grouped,
                     title = "codebook",
                     description = "This codebook describes data transformations
                     that were applied to data from Human Activity Recognition 
                     Using Smartphones Dataset. First, the files containing the training 
                     and test data, the respondent id, activity labels were loaded and the
                     variables renamed. Then the three training files were combined and 
                     the three test files were combined using cbind. Next, these two data sets
                     were combined using rbind. Next, the value labels for activities
                     were renamed with the corresponding activity labels. Then the variables
                     were renamed to be more easily human readable. Next, a separate dataframe
                     was created with only the variables measuring mean and standard deviation.
                     Then these variables were grouped by id and activity in a separate 
                     dataframe and summarized by mean.")

print(x = CodeBook, target = "Codebook_1.docx")