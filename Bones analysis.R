## Read in the data and libraries
#install.packages("tidyverse")
library(tidyverse)
library(caret)
library("dplyr")
library("ggplot2")
library("ggpubr")
library(caTools)



df <- read.csv('bones2.csv')
df <- df[order(-df$Played),]


set.seed(123334)

## Break up the data into a training set and test set

# The following below doesn't work as we need to highly focus on our played tunes.

#split = sample.split(df$Played, SplitRatio = .80)
#training_set = subset(df, split == TRUE)
#test_set = subset(df, split == FALSE)

# Just pull in the played with some non-played and build from there.
training_set = df[1:40,]
test_set = df[41:520,]


#Feature Scaling
training_set[,2:11] = scale(training_set[,1:12])
test_set[,2:11] = scale(test_set[,1:12])


## Multiple Linear Regression Model, remove name


regressor = lm(formula = Played ~ . -Name -duration_ms -time_signature,
               data = training_set)


## Look at results

summary(regressor)


## Check for some normality 




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

## Check for multi-collinearity

car::vif(regressor)


## Multiple Linear Regression Model, remove name


regressor_e = lm(formula = Played ~ energy,
               data = training_set)


## Look at results

summary(regressor_e)




## Check

y_pred = predict(regressor, newdata = test_set)
y_pred


##### Logistic Regression Model 

set.seed(22354442)
split = sample.split(df$Played, SplitRatio = .80)
training_set = subset(df, split == TRUE)
test_set = subset(df, split == FALSE)

training_set[,2:3] = scale(training_set[,1:12])
test_set[,2:3] = scale(test_set[,1:12])

## Create logistic regression model

classifier = glm(formula = Played ~.-Name -duration_ms,
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

write.csv(y_pred,"y_pred.csv", row.names = TRUE
          )
