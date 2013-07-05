package org.hmaissi.theideamachine.twitter

class Message {

    static scaffold = true

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

//    Integer getTotalVotes() {
//        if (upvotes > downvotes) {
//            return (upvotes - downvotes) + retweetCount
//        } else {
//            return retweetCount
//        }
//    }
//
//    static transients = ['totalVotes']

    static constraints = {
        tweetId unique: true
        html maxSize: 5000
    }

    static mapping = {
        totalVotes formula: '(upvotes - downvotes) + retweet_count'
    }


}
