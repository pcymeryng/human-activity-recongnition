setwd("/Users/pablocymeryng/Downloads/UCI HAR Dataset")

# leer datos
X_train <-read.table("train/X_train.txt")
X_test <-read.table("test/X_test.txt")
X_data <- rbind(X_train,X_test)

temp = read.table("features.txt")
attributeNames = temp$V2
names(X_data) = attributeNames

features <- read.table("features.txt")[,2]
colnames(X_data) <- features


# Filtrar solo las medidas mean y desvio standard
selected_measures <- grepl('-(mean|std)\\(', attributeNames)
X_data <- subset(X_data,select=selected_measures)

# Asignar nombres descriptivos de variables
colnames(X_data) <- gsub("mean", "Mean", colnames(X_data))
colnames(X_data) <- gsub("std", "Std", colnames(X_data))
colnames(X_data) <- gsub("^t", "Time", colnames(X_data))
colnames(X_data) <- gsub("^f", "Frequency", colnames(X_data))
colnames(X_data) <- gsub("\\(\\)", "", colnames(X_data))
colnames(X_data) <- gsub("-", "", colnames(X_data))
colnames(X_data) <- gsub("BodyBody", "Body", colnames(X_data))
colnames(X_data) <- gsub("^", "MeanOf", colnames(X_data))
colnames(X_data)
X_data[1:4,1:5]

# Asignar nombres descriptivos a las actividades

Y_train <-read.table("train/Y_train.txt")
Y_test <-read.table("test/Y_test.txt")
activities <- rbind(Y_train,Y_test)[,1]

lab = read.table("activity_labels.txt")
labels = as.character(lab$V2)
activities <- labels[activities]
X_data <- cbind(Activity = activities,X_data)
X_data[1:4,1:5]

Y_subj_train<-read.table("train/subject_train.txt")
Y_subj_test <-read.table("test/subject_test.txt")
subjects <- rbind(Y_subj_train,Y_subj_test)[,1]
X_data <- cbind(Subject = subjects,X_data)
X_data[1:4,1:5]
    
# utilizo libreria dplyr (hay que instalarla, junto a librería tibble)
library('dplyr')
promedio_data <- X_data %>%
group_by(Subject,Activity) %>%
summarise_all(funs(mean))

# Generar el data set
    
write.table(promedio_data,row.name = FALSE,file = "tidy_data_set.txt")
