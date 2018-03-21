# Simple Linear Regression

# Importing the dataset

# Splitting the dataset into the Training set and Test set
# install.packages('caTools')
setwd("C:/Users/magic/Desktop/Sem2/R/Asgn/proj/new_log/Linear_Regression/Simple_Linear_Regression")
dataset = read.csv('kc_house_data.csv')
head(dataset)
library(caTools)
set.seed(123)
split = sample.split(dataset$price, SplitRatio = 0.8)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

# Feature Scaling
# training_set = scale(training_set)
# test_set = scale(test_set)

# Fitting Simple Linear Regression to the Training set
regressor = lm(formula = price ~ yr_built,
               data = training_set)
head(regressor, 10)

# Predicting the Test set results
y_pred = predict(regressor, newdata = test_set)
y_pred

#rdf <- data.frame(cbind(actuals=y_pred$price, predicted = distPred))
#Accuracy can be found from P value in the summary and we can look at the significance level by the stars indiacated!
summary(regressor)

#library(caret)
#library(klaR)
#confusionMatrix(y_pred$price, test_set)

# install.packages("klaR")
#confint(y_pred)
# install.packages("ggplot2")
# Visualising the Training set results
library(ggplot2)
ggplot() +
  geom_point(aes(x = training_set$yr_built, y = training_set$price),
             colour = 'red') +
  geom_line(aes(x = training_set$yr_built, y = predict(regressor, newdata = training_set)),
            colour = 'blue', lwd = 2) +
  ggtitle('Price vs Yr_built (Training set)') +
  xlab('Price') +
  ylab('Year_Built') 

# Visualising the Test set results
library(ggplot2)
ggplot() +
  geom_point(aes(x = test_set$yr_built, y = test_set$price),
             colour = 'red') +
  geom_line(aes(x = training_set$yr_built, y = predict(regressor, newdata = training_set)),
            colour = 'blue',lwd = 2) +
  ggtitle('Price vs Yr_built (Test set)') +
  xlab('Price') +
  ylab('Year_Built')

