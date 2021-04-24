# BONES Consultancy: Project Overview
* Act as a consultant for a musician with an extensive album collection to choose additional songs for upcoming shows
* Pull data from Spotify's API and get a sense of the data
* Employ two models: Multi-Linear Regression and Logistic Regression to get a sense of the data and work through errors that might occur for further prediction
* Place favorites of the selected into a playlist

## Spotify API scrape and Youtube data collection

Found a way to pull data about songs out of Spotify. The variables that we work on are:

* danceability
* energy
* key
* loudness
* mode
* speechiness
* acousticness
* instrumentalness
* liveness
* valence
* tempo
* duration
* time_signature

From there, I went to youtube and found shows that BONES performed at and included another column with binary values that state whether or not a song was played at his shows. I pulled in about 2 sets worth, so future iterations would benefit from finding more songs.

## Multi-Linear Regression


![image](https://user-images.githubusercontent.com/67398409/115159262-eafd4d80-a057-11eb-83c3-e620fb159a52.png)

There isn't much statistical significance in the variables besides danceability, which is highly significant.

We employed Shapiro-Wilks normality test to see if any of the variables show signs of a normal distribution for their errors, and only energy seems to. Re-training on just energy for a 1 variable linear regression doesn't show much significance.  

We also checked for multi-collinearity and that showed no signs of such.

We also checked to see if there was a linear relationship shown between the dependent and independent variables. (Still checking)

As for our logistic regression, we arrive at the following for our summary:

![image](https://user-images.githubusercontent.com/67398409/115179968-27ea3400-a09a-11eb-9efa-d7828ad2ec1f.png)

Not much to write home about with the statistical significance here. Our confusion matrix also just points out to us that there are 199 true positives, 9 false positives, and 1 false negatives. The MLR performed much stronger than this set. 

After throwing y_pred values into a spreadsheet to assess what songs were being recommended, it seems that the algorithm is choosing the longest songs, so this needs to be removed from our model and re-trained.

![image](https://user-images.githubusercontent.com/67398409/115180647-bd39f800-a09b-11eb-9e39-203d7b20aa88.png)

So, after removing duration_ms and time_signature we get:


![image](https://user-images.githubusercontent.com/67398409/115182537-c200ab00-a09f-11eb-9867-90fc8ec94bde.png)



With these being the particular songs our better performing algorithm is recommending:


![image](https://user-images.githubusercontent.com/67398409/115182190-2c651b80-a09f-11eb-94d7-bceb53b9b0b6.png)


This analysis isn't complete without listening to the songs ourselves. 73rdAnnualGimbleTelathon is a misnomer it seems, but the top 10 are solid songs to include in the next show. They achieve either the hype, or the low atmospheric beat that we were searching for. 


The ways that I would improve these models would be to find more instances of songs that were used at his shows. Another way of full improvement is to wrap all of this into python, or all into R with Jupyter notebooks being written in R. 

I put my favorite of the list in a spotify playlist if you're interested in checking them out. Pretty good if you need to zone in!

https://open.spotify.com/playlist/2r2LhItZvq0wfd1wIxkLOd?si=17e2e3205bcc4651



