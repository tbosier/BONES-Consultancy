# BONES-Consultancy
This depository is to show myself as a consultant for the rapper known as BONES. He has an extensive album collection in the 'dark rap' genre.

I used two models to see if I could ascertain anything from it. One was a multiple linear regression model, and another was a logistic regression model. The MLR model turned up nothing, but the logistic regression model saw some correlation between which song was chosen to be played and the key as well as the mode of the song. 

Specifically, in the MLR, we receive no * in our coefficient summary, with a low R^2 value of 0.02574, so the MLR is not a good model to predict in the current state.

In our LR model, we receive singular * on key and mode. However, in the current state, our predict model doesn't respond well to the prediction matrix.

The ways that I would improve these models would be to find more instances of songs that were used at his shows (I pulled in all of his music from spotify's API and then went to youtube to find out which songs were used at his shows. I then went into the playlist and labeled a song if it was used or wasn't used). The splitting method is also questionable, as it is just a blank cut of 80 / 20. A better training model would be to pull in most of the songs used and some unused, then test on others. 

I work on this when I find the time. 


