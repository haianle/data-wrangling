#see working directory
getwd()

#change your working directory
setwd()

#set path to the location for raw data files in the dslabs package and list files
path <- system.file("extdata", package = "dslabs")
list.files(path)

#generate a full path to a file
filename <- "murders.csv"
fullpath <- file.path(path, filename)

#copy file from dslabs package to your working directory
file.copy(fullpath,getwd())

#check if file exists
file.exists(filename)


library(readr)
url <- "https://archive.ics.uci.edu/ml/machine-learning-databases/breast-cancer-wisconsin/wdbc.data"
dat <- read_csv(url,col_names = FALSE)

nrow(dat)
dim(dat)

#connect to SQL server tables
library(odbc)
library(RODBC)
library(sqldf)
library(htmltools)
conn <- odbcDriverConnect('driver={SQL Server};server=DUCK;database=DW_Staging;trusted_connection=true')

DataSQL <- sqlQuery(conn,"SELECT top 5 *  FROM DW_Staging.acu.CDPS_tmp_inelig;"); 

DataSQL
