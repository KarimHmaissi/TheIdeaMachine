package org.hmaissi.theideamachine.twitter

class Message {

    String text
    Integer retweetCount
    Integer favouriteCount
    Long tweetId
    Date dateCreated

    Date dateTweetCreated
    String screenName
    String name
    String html

    Integer upvotes
    Integer downvotes

    Integer totalVotes

    static constraints = {
        tweetId unique: true
        html maxSize: 5000
    }

    static mapping = {
        totalVotes formula: '(upvotes - downvotes) + retweet_count'
    }


}
