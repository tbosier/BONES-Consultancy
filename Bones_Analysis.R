## Read in the data

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


## Check

y_pred = predict(regressor, newdata = test_set)
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


# Create confusion matrix to assess


cm = table(test_set[,15], y_pred)
cm
