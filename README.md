# BONES-Consultancy
This repository is to show myself as a consultant for the rapper known as BONES. I am tasking myself with creating statistical models to select songs for BONES' next show, with the goal of higher turnout at further shows.

What is the overall theme of BONES' shows? High energy interspersed with mellow songs to provide breaks for show-goers (and performers). According to Wikipedia, his genre is a mix of hip-hop, Trap Metal, Cloud Rap, and Emo Rap. In essence, this is a mix of heavy beats, metal instrumentals, atmospheric and hazy sounds, and somber lyrics. We will want to keep with this trend of high energy / low-medium energy type tunes while selecting songs for further shows. 

We will employ two models to compare and contrast their results. We will use a regression model known as Multi-Linear Regression, and then we will use a classification method known as Logistic Regression. Why? After pulling in data, we go to youtube to see which songs were used at shows and denote that in our dataset. This is a binary result, which logistic regression is great at. We will need to check our assumptions for our MLR model first.

![image](https://user-images.githubusercontent.com/67398409/115159262-eafd4d80-a057-11eb-83c3-e620fb159a52.png)

So there isn't much statistical significance in the variables besides danceability, which is highly significant.

We employed Shapiro-Wilks normality test to see if any of the variables show signs of a normal distribution for their errors, and only energy seems to. Re-training on just energy for a 1 variable linear regression doesn't show much significance.  

We also checked for multi-collinearity and that showed no signs of such.

We also checked to see if there was a linear relationship shown in any of the variables.










The ways that I would improve these models would be to find more instances of songs that were used at his shows. Another way of full improvement is to wrap all of this into python. 



