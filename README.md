
## Human Activity Recognition Using Smartphones
### Summary of means and standard deviations of sample data collected

### Sachin Sangtani

## Script Overview
run_analysis.R sources relevant signal data collected from the dataset available at: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The dataset produced is a file called finalSummary.txt

run_analysis.R goes through the following steps: 

1. Load relevant libraries used.
2. Read required data from the full dataset
   a) Metadata
   b) Subject IDs for tests and training conducted
   c) Activity IDs for tests and training conducted
3. Subsets only the relevant measures of the 561 measures recorded (means and standard deviations)
4. Combines test and training data and appends column names to data set
5. Combines Subject IDs for test and training data
6. Combines Activity IDs for test and training data
7. Merges all the data together, column-wise
8. Subsets all the relevant columns identified in #3 above.
9. Computes the averages for each of these measures by Subject ID and Activity
10. Writes the resulting averages out to a file called finalSummary.txt in the working directory

Notes: 
- The data must exist in the working directory in which run_analysis.R is saved.

The data contents, variable names and other information for the file, finalSummary.txt is available in the codebook.
