## Read in the data

library(tidyverse)
library(caret)



df <- read.csv('bones.csv')


library(caTools)
set.seed(12334)

## Break up the data into a training set and test set

split = sample.split(df$Played, SplitRatio = .80)
training_set = subset(df, split == TRUE)
test_set = subset(df, split == FALSE)


#Feature Scaling
training_set[,2:3] = scale(training_set[,1:12])
test_set[,2:3] = scale(test_set[,1:12])


## Multiple Linear Regression Model, remove name


regressor = lm(formula = Played ~ . -Name,
               data = training_set)


## Look at results

summary(regressor)


## Check for some normality 

library("dplyr")
library("ggplot2")
library("ggpubr")
install.packages("ggpubr")

shapiro.test(df$mode)
shapiro.test(df$danceability)
shapiro.test(df$energy)
shapiro.test(df$key)
shapiro.test(df$loudness)
shapiro.test(df$speechiness)
shapiro.test(df$acousticness)
shapiro.test(df$instrumentalness)
shapiro.test(df$liveness)
shapiro.test(df$valence)
shapiro.test(df$tempo)
shapiro.test(df$duration_ms)


## Multiple Linear Regression Model, remove name


regressor_e = lm(formula = Played ~ energy,
               data = training_set)


## Look at results

summary(regressor_e)

## Check for multi-collinearity
car::vif(regressor)


## Check

y_pred = predict(regressor_e, newdata = test_set)
y_pred


##### Logistic Regression Model 

set.seed(2342)
split = sample.split(df$Played, SplitRatio = .80)
training_set = subset(df, split == TRUE)
test_set = subset(df, split == FALSE)

training_set[,2:3] = scale(training_set[,1:12])
test_set[,2:3] = scale(test_set[,1:12])

## Create logistic regression model

classifier = glm(formula = Played ~.-Name,
                 family = binomial,
                 data = training_set)

## View results 

summary(classifier)

prob_pred = predict(classifier, type ='response', newdata = test_set[-15])
prob_pred

y_pred = ifelse(prob_pred > 0.5, 1, 0)
y_pred



cm = table(test_set[,15], y_pred)
cm
