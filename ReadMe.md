---
title: "Getting and Cleaning Data Project "
output: html_document
---

### ReadMe
## Introduction  
  
The data handled by this project relies on the data supplied by the group who carried on the original tests.   
It can be accessed in      
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
  
The data contains information from 30 tested subjects who were asked to perform 6 activities which were sampled and recorded.  
The subjects are divided into two groups: "test" and "train" and so is most of the data collected.  
Each activity is sampled by 561 variables.  
  
This project supplies a tidy dataframe with decoded activity names, containing average quantities of the mean() and std() variables from the input data, for each subject and activity. 
  
For detailed process of building that dataset, please refer to the codebook supplied with that project.  

## The repo includes:  
  
* Readme.md – This document
* Run_Analysis.R - The script file producing the output  
* CodeBook.md - Describing the data collection, the process of producing the output and the resulting dataset  
* averageActivities.txt - the resulting dataset  

## How to run the run_analysis.R script  
  
The script  is run from the working directory  
the working directory includes the original data set in a folder "UCI HAR Dataset"  
The script creates in the working directory the resulting dataset "averageActivities.txt"  

   
