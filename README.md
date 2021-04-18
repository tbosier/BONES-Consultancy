# BONES-Consultancy
This repository is to show myself as a consultant for the rapper known as BONES. I am tasking myself with creating statistical models to select songs for BONES' next show, with the goal of higher turnout at further shows.

What is the overall theme of BONES' shows? High energy interspersed with mellow songs to provide breaks for show-goers (and performers). According to Wikipedia, his genre is a mix of hip-hop, Trap Metal, Cloud Rap, and Emo Rap. In essence, this is a mix of heavy beats, metal instrumentals, atmospheric and hazy sounds, and somber lyrics. We will want to keep with this trend of high energy / low-medium energy type tunes while selecting songs for further shows. 

We will employ two models to compare and contrast their results. We will use a regression model known as Multi-Linear Regression, and then we will use a classification method known as Logistic Regression. Why? After pulling in data, we go to youtube to see which songs were used at shows and denote that in our dataset. This is a binary result, which logistic regression is great at. We will need to check our assumptions for our MLR model first.

![image](https://user-images.githubusercontent.com/67398409/115159262-eafd4d80-a057-11eb-83c3-e620fb159a52.png)

So there isn't much statistical significance in the variables besides danceability, which is highly significant.

We employed Shapiro-Wilks normality test to see if any of the variables show signs of a normal distribution for their errors, and only energy seems to. Re-training on just energy for a 1 variable linear regression doesn't show much significance.  

We also checked for multi-collinearity and that showed no signs of such. 




I used two models to see if I could ascertain anything from it. One was a multiple linear regression model, and another was a logistic regression model. The MLR model turned up nothing, but the logistic regression model saw some correlation between which song was chosen to be played and the key as well as the mode of the song. 

First to do is to check assumptions of MLR to see if it's even a worthwhile endeavor. After running the regressor on 'Played' (at concert), no value shows any statistical significance whatsoever. We check for multi-collinearity using the caret library, via the vif() function. Everything is pretty low, so no multi-collinearity detected. It's also probably a good idea to check normality, so we will do so using a Shapiro-Wilk test.

From the Shapiro-Wilk test, the following are not normally distributed values:

mode
danceability
key
loudness
speechiness
acousticness
instrumentalness
liveness
valence
tempo
duration_ms


The following are:

Energy

So this model isn't exactly great. It was a nice, quick check though. A better model would be some binary classifier, like Logistic Regression. The reason for this is that we are simply trying to see if there are other songs that should be played at his shows.

Specifically, in the MLR, we receive no * in our coefficient summary, with a low R^2 value of 0.02574, so the MLR is not a good model to predict in the current state.

In our LR model, we receive singular * on key and mode. However, in the current state, our predict model doesn't respond well as per the confusion matrix analysis.

The ways that I would improve these models would be to find more instances of songs that were used at his shows (I pulled in all of his music from spotify's API and then went to youtube to find out which songs were used at his shows. I then went into the playlist and labeled a song if it was used or wasn't used). The splitting method is also questionable, as it is just a blank cut of 80 / 20. A better training model would be to pull in most of the songs used and some unused, then test on others. 

Another way of full improvement is to wrap all of this into python. 



