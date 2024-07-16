# Install necessary packages
install.packages("readxl")
install.packages("dplyr")
install.packages("tidyverse")
install.packages("openxlsx")
install.packages("glmnet")


# Load the necessary libraries
library(readxl)
library(dplyr)
library(tidyverse)
library(openxlsx)
library(ggplot2)
library(reshape2)
library(pROC)
# Clean column names (replace spaces with underscores, convert to lower case, etc.)
clean_names <- function(df) {
  colnames(df) <- gsub(" ", "_", colnames(df))
  colnames(df) <- tolower(colnames(df))
  return(df)
}

#Power dataset import
power<-Power
head(power)

power<-clean_names(power)
colnames(power)
power <- power[, !(names(power) %in% c("computer_name"))]
power$status <- ifelse(power$status %in% c("Red", "Yellow"), 1, 0)
power <- na.omit(power)


head(power)
# Split the data into training and test datasets

set.seed(123)
train_indices <- sample(1:nrow(power), nrow(power) * 0.7)
train_data <- power[train_indices, ]
test_data <- power[-train_indices, ]

# Perform logistic regression on the training data
model3 <- glm(status ~ ., data = train_data, family = binomial)
summary(model1)
# Predict the probabilities on the test data
predicted_probabilities <- predict(model, newdata = test_data, type = "response")

# Create the ROC curve
roc_curve <- roc(test_data$status, predicted_probabilities)

# Plot the ROC curve
plot(roc_curve, main = "ROC Curve", xlab = "False Positive Rate", ylab = "True Positive Rate")

# Calculate the AUC
auc_value <- auc(roc_curve)
print(paste("AUC:", auc_value))


# Predict probabilities using the logistic regression model
train_data$predicted_prob <- predict(model1, newdata = train_data, type = "response")

# Create ROC curve
roc_obj <- roc(train_data$status, train_data$predicted_prob)
roc_chart <- ggplot(roc_obj, aes(x = 1 - specificity, y = sensitivity)) +
  geom_path() +
  geom_abline(slope = 1, intercept = 0, linetype = "dashed") +
  labs(x = "False Positive Rate", y = "True Positive Rate") +
  ggtitle("ROC Curve")
roc_curve <- roc(test_data$status, predicted_probabilities)
# Confusion matrix
predicted_labels <- ifelse(predicted_probabilities > 0.5, 1, 0)
confusion_matrix <- table(Actual = test_data$status, Predicted = predicted_labels)
print(confusion_matrix)

# P-value test
p_value <- pROC::roc.test(test_data$status, predicted_probabilities)$p.value
print(paste("P-value:", p_value))

# Plot for confusion matrix
ggplot(data.frame(confusion_matrix), aes(x = Actual, y = Predicted, fill = Freq)) +
  geom_tile() +
  geom_text(aes(label = Freq), color = "white") +
  labs(x = "Actual", y = "Predicted", fill = "Frequency") +
  ggtitle("Confusion Matrix")

length(test_data$status)
length(predicted_probabilities)
roc_curve <- roc(test_data$status, predicted_probabilities)


