#The Idea Machine

The idea machine downloads tweets from twitter that contain an idea for a new app or website. Some are insane, some are just awful and some are absolute gold.

It works by filtering out tweets that contain phrases such as "Should make an app" and saving them to The Idea Machine's stream.

The app allows user to vote for their favourite ideas. Ideas are sorted by hot(the highest voted ideas) and new(brand new tweets from the official twitter stream).

The Idea Machine was built with Grails, bootstrap and jQuery

The project is currently in *beta*

---

##Limitations

1.Some tweets are mistakenly added to the stream as the filter at present is too open.
2. Some tweets are not rendered correctly by twitter, and are rendered as a default style without tweet functionality such as retweet, favourite and reply. 
3. There is a noticeable delay as tweets are rendered causing the app to freeze. A callback from the twitter.js is needed to prevent this but is not currently available. 



##Future Features

1. Automatic retweeting of top ideas to a "Idea Machine" twitter account.
2. When an idea is retweeted, the app automatically updates the vote count.
3.Front end design improvements.
 

