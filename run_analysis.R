# read column names from features.txt and store them in a vector
cnames <- read.csv('features.txt', sep=' ', header=F)
cnames <- cnames$V2

# read X data from both test and train set and merge them
xtrain <- read.table('X_train.txt', header=F)
xtest <- read.table('X_test.txt', header=F)
xdata <- rbind(xtrain, xtest)

# name the columns
names(xdata) <- cnames

# read Y data from both test and train set and merge them
ytrain <- read.table('y_train.txt', header=F)
ytest <- read.table('y_test.txt', header=F)
ydata <- rbind(ytrain, ytest)

# read subject data from both test and train set and merge them
strain <- read.table('subject_train.txt', header=F)
stest <- read.table('subject_test.txt', header=F)
sdata <- rbind(strain, stest)

# combine X and Y and subject
xdata$activity <- as.factor(ydata$V1)
xdata$subject <- sdata$V1

# use descriptive activities
levels (xdata$activity) <- c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING")

write.table(xdata, file = 'clean.txt', row.name=FALSE)
