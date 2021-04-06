# BONES-Consultancy
This depository is to show myself as a consultant for the rapper known as BONES. He has an extensive album collection in the 'dark rap' genre.

I used two models to see if I could ascertain anything from it. One was a multiple linear regression model, and another was a logistic regression model. The MLR model turned up nothing, but the logistic regression model saw some correlation between which song was chosen to be played and the key as well as the mode of the song. 

The ways that I would improve these models would be to find more instances of songs that were used at his shows (I pulled in all of his music from spotify's API and then went to youtube to find out which songs were used at his shows. I then went into the playlist and labeled a song if it was used or wasn't used). The splitting method is also questionable, as it is just a blank cut of 80 / 20. A better training model would be to pull in most of the songs used and some unused, then test on others. 



