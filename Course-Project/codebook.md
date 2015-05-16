Codebook
========
Codebook was created on 2015-02-22 19:19:22 during the same process that generated the dataset. See `run_analysis.md` or `run_analysis.html` for details on data set creation.

Variable list and descriptions
------------------------------

Variable name    | Description
-----------------|------------
subject          | Subject who performed the activity
activity         | Activity name
domain           | Time signal or frequency domain signal (Time or Freq)
instrument       | Measuring instrument (Accelerometer or Gyroscope)
acceleration     | Acceleration signal (Body or Gravity)
variable         | Variable (Mean or SD)
jerk             | Jerk signal
magnitude        | Magnitude of the signals
axis             | 3-axial signals in the X, Y and Z directions (X, Y, or Z)
count            | Count of data points used to compute `average`
average          | Average of each variable for each activity and each subject

Data set structure
------------------

```r
str(dtTidy)
```

```
## Classes 'data.table' and 'data.frame':	11880 obs. of  11 variables:
##  $ subject     : int  1 1 1 1 1 1 1 1 1 1 ...
##  $ activity    : Factor w/ 6 levels "LAYING","SITTING",..: 1 1 1 1 1 1 1 1 1 1 ...
##  $ domain      : Factor w/ 2 levels "Time","Freq": 1 1 1 1 1 1 1 1 1 1 ...
##  $ acceleration: Factor w/ 3 levels NA,"Body","Gravity": 1 1 1 1 1 1 1 1 1 1 ...
##  $ instrument  : Factor w/ 2 levels "Accelerometer",..: 2 2 2 2 2 2 2 2 2 2 ...
##  $ jerk        : Factor w/ 2 levels NA,"Jerk": 1 1 1 1 1 1 1 1 2 2 ...
##  $ magnitude   : Factor w/ 2 levels NA,"Magnitude": 1 1 1 1 1 1 2 2 1 1 ...
##  $ variable    : Factor w/ 2 levels "Mean","SD": 1 1 1 2 2 2 1 2 1 1 ...
##  $ axis        : Factor w/ 4 levels NA,"X","Y","Z": 2 3 4 2 3 4 1 1 2 3 ...
##  $ count       : int  50 50 50 50 50 50 50 50 50 50 ...
##  $ average     : num  -0.0166 -0.0645 0.1487 -0.8735 -0.9511 ...
##  - attr(*, "sorted")= chr  "subject" "activity" "domain" "acceleration" ...
##  - attr(*, ".internal.selfref")=<externalptr>
```

Key variables in the data set
-----------------------------
        

```r
key(dtTidy)
```

```
## [1] "subject"      "activity"     "domain"       "acceleration"
## [5] "instrument"   "jerk"         "magnitude"    "variable"    
## [9] "axis"
```

Sample of data set rows
-----------------------
        

```r
dtTidy
```

```
##        subject         activity domain acceleration    instrument jerk
##     1:       1           LAYING   Time           NA     Gyroscope   NA
##     2:       1           LAYING   Time           NA     Gyroscope   NA
##     3:       1           LAYING   Time           NA     Gyroscope   NA
##     4:       1           LAYING   Time           NA     Gyroscope   NA
##     5:       1           LAYING   Time           NA     Gyroscope   NA
##    ---                                                                
## 11876:      30 WALKING_UPSTAIRS   Freq         Body Accelerometer Jerk
## 11877:      30 WALKING_UPSTAIRS   Freq         Body Accelerometer Jerk
## 11878:      30 WALKING_UPSTAIRS   Freq         Body Accelerometer Jerk
## 11879:      30 WALKING_UPSTAIRS   Freq         Body Accelerometer Jerk
## 11880:      30 WALKING_UPSTAIRS   Freq         Body Accelerometer Jerk
##        magnitude variable axis count     average
##     1:        NA     Mean    X    50 -0.01655309
##     2:        NA     Mean    Y    50 -0.06448612
##     3:        NA     Mean    Z    50  0.14868944
##     4:        NA       SD    X    50 -0.87354387
##     5:        NA       SD    Y    50 -0.95109044
##    ---                                          
## 11876:        NA       SD    X    65 -0.56156521
## 11877:        NA       SD    Y    65 -0.61082660
## 11878:        NA       SD    Z    65 -0.78475388
## 11879: Magnitude     Mean   NA    65 -0.54978489
## 11880: Magnitude       SD   NA    65 -0.58087813
```

Summary of variables
--------------------
        

```r
summary(dtTidy)
```

```
##     subject                   activity     domain      acceleration 
##  Min.   : 1.0   LAYING            :1980   Time:7200   NA     :4680  
##  1st Qu.: 8.0   SITTING           :1980   Freq:4680   Body   :5760  
##  Median :15.5   STANDING          :1980               Gravity:1440  
##  Mean   :15.5   WALKING           :1980                             
##  3rd Qu.:23.0   WALKING_DOWNSTAIRS:1980                             
##  Max.   :30.0   WALKING_UPSTAIRS  :1980                             
##          instrument     jerk          magnitude    variable    axis     
##  Accelerometer:7200   NA  :7200   NA       :8640   Mean:5940   NA:3240  
##  Gyroscope    :4680   Jerk:4680   Magnitude:3240   SD  :5940   X :2880  
##                                                                Y :2880  
##                                                                Z :2880  
##                                                                         
##                                                                         
##      count          average        
##  Min.   :36.00   Min.   :-0.99767  
##  1st Qu.:49.00   1st Qu.:-0.96205  
##  Median :54.50   Median :-0.46989  
##  Mean   :57.22   Mean   :-0.48436  
##  3rd Qu.:63.25   3rd Qu.:-0.07836  
##  Max.   :95.00   Max.   : 0.97451
```

Save to file
------------
        
Save data set objects to a tab-delimited text file called `tidydata.txt`.


```r
f <- file.path(dataDirectory, "tidydata.txt")
write.table(dtTidy, f, quote=FALSE, sep="\t", row.names=FALSE)
```
