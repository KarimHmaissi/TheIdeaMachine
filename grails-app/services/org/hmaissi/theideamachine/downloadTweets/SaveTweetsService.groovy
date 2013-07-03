package org.hmaissi.theideamachine.downloadTweets

import grails.converters.JSON
import org.hmaissi.theideamachine.twitter.Message
import org.json.simple.JSONObject
import twitter4j.Status

import java.text.SimpleDateFormat

/**
 * Save tweets to the database
 * Tweets are filtered and saved to the db.
 * On a successful save a aqmp message is sent to queue up request for tweet markup
 */
class SaveTweetsService {

    static rabbitQueue = 'defaultList'
    def downloadTweetMarkupService

    //Stores a array of ids to prevent duplicate tweets saved
    //Possible error if server is stopped and restarted duplicates are possible
    //Use reddis to store a permanent fast access db of ids
    def ArrayList<Long> savedTweetsIds = new ArrayList<Long>()

    /**
     * Init array of tweets ids to prevent duplicates
     */
    def initSavedTweetIds() {
        savedTweetsIds = Message.list().tweetId
    }

    def saveTweet(Status status) {
        if (filterTweet(status) && !savedTweetsIds.contains(status.id)) {
            println "Tweet passes filter"
            Message message = new Message()
            message.retweetCount = status.getRetweetCount()
            message.text = status.getText()
            message.tweetId = status.getId()

            message.screenName = status.user.getScreenName()

            message.name = status.user.getName()
            message.dateTweetCreated = status.getCreatedAt()

            message.html = "empty"

            message.upvotes = 0
            message.downvotes = 0

            //BUG TODO current version of twitter4j does not include a getFavouriteCount method
            //Stubbed until added. Currently under development
            //message.favourites = status.getFavoriteCount()

            message.favouriteCount = 0

//            sendAQMPMessage(status.getId())

            println message.text

            saveMessage(message)

        }
    }

    def saveTweet(String status) {
        JSONObject statusJson = JSON.parse(status)
        saveTweet(statusJson)
    }

    def saveTweet(JSONObject status) {

        if (filterTweet(status) && !savedTweetsIds.contains(status.id)) {
            Message message = new Message()
            message.retweetCount = status.retweet_count
            message.text = status.text
            message.tweetId = status.id
            message.screenName = status.user.screen_name
            message.name = status.user.name
            message.html = "empty"
            message.dateTweetCreated = getTwitterDate(status.created_at)

            message.upvotes = 0
            message.downvotes = 0

            message.favouriteCount = status.favorite_count

            //Send rabbitmq message to download html
//            sendAQMPMessage(status.id)

//            println "Message----------"
//            println message.text
//            println message.screenName
//            println message.name
//            println message.tweetId
//            println message.retweetCount
//            println message.dateTweetCreated

            saveMessage(message)
        }
    }

    private saveMessage(Message message) {

        if (message != null) {
            try {
                println "Saving message"
                message.save(failOnError: true)
                savedTweetsIds.add(message.tweetId)
            } catch (Exception e) {
                println e.toString()
                print "error saving status"
            }
        } else {
            println("Message is null. ERROR SAVING")
        }

    }

    /**
     * Parses a string date returned from twitter and returns a date object
     * http://stackoverflow.com/questions/4521715/twitter-date-unparseable
     * @return
     */
    private static Date getTwitterDate(String date) {
        final String TWITTER = "EEE MMM dd HH:mm:ss ZZZZZ yyyy";
        SimpleDateFormat sf = new SimpleDateFormat(TWITTER);
        sf.setLenient(true);
        return sf.parse(date);
    }

/**
 * Returns true if status passes the filter
 * Filters based on url entities and mentions
 * Reasoning is tweets containing a url or mention are unlikely to possess a single coherent idea
 * @param status
 * @return
 */
    private boolean filterTweet(Status status) {
        boolean passedFilter = true

        def mentionsArray = status.getUserMentionEntities()
        if (mentionsArray.length > 0) {
            passedFilter = false
        }

        def urlArray = status.getURLEntities()
        if (urlArray.length > 0) {
            passedFilter = false
        }

        return passedFilter

    }

/**
 * Returns true if status passes the filter
 * Filters based on url entities and mentions
 * Reasoning is tweets containing a url or mention are unlikely to possess a single coherent idea
 * @param json
 * @return
 */
    private boolean filterTweet(JSONObject status) {
        boolean passedFilter = true

        if (status.entities.user_mentions.size() != 0) {
            passedFilter = false
        }

        if (status.entities.urls.size() != 0) {
            passedFilter = false
        }

        return passedFilter
    }

/**
 * Original impl pulled tweet markup from twitter api oembed
 * In order to queue requests rabbitmq was used
 * This was considered wasteful so markup is generated via a gsp template
 * The following methods are not used but are kept in the source in case
 * the markup is changed by twitter and needs to be revised
 */

    /**
     * Send a aqmp to rabbitmq
     * @param id
     */
    private void sendAQMPMessage(long id) {

        def message = [
                tweetId: id
        ] as JSON

        rabbitSend 'defaultList', message.toString()
    }

    /**
     * Listens for rabbitmq messages and processes them
     * @param textMessage
     */
    void handleMessage(String textMessage) {
        println("AQMP JSON message: " + textMessage)
        JSONObject json = JSON.parse(textMessage)
        long id = json.tweetId

        if (id != null & id != 0) {
            String html = downloadTweetMarkupService.getTweetHtml(id)

            if (html != "" && html != "error") {
                saveHtml(html, id)
            }
        }
    }

    private void saveHtml(String html, long id) {
        Message message = Message.findByTweetId(id)

        if (message != null) {
            message.html = html

            saveMessage(message)

        } else {
            print "error saving markup"
            println "Cannot find message to update"
        }
    }

}