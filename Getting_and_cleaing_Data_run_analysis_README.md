==================================================================
Getting and Cleaing Data Peer-Reviewed Project: Run Analysis
Version 1.0
==================================================================
Aaron Woods
==================================================================

The analysis was carried out using Human Activity Recognition Using Smartphones data
files, which can be found here:
http://archive.ics.uci.edu/dataset/240/human+activity+recognition+using+smartphones

==================================================================
The analysis files include a codebook and an R script.

codebook_1.docx describes the steps in the analysis performed in the R script
and general information about the dataset.

The R script (run_analysis.R) contains steps for loading the various data files from the Human 
Activity Recognition Using Smartphones study and combining them into a tidy
data set. It also includes analyses to subset the columns measuring mean and
standard deviation. Steps are as follow

- rename columns to human readable names
- merge training data files containing subject id, activity labels and measurement data
- merge test data files containing subject id, activity labels and measurement data
- merge training and test data files 
- update column names for the activity labels
- rename measurement columns to be human readable
- subset to only measurements for mean and standard deviation
- group by id and activity and calculate the mean for these measurements
- create codebook
==================================================================
