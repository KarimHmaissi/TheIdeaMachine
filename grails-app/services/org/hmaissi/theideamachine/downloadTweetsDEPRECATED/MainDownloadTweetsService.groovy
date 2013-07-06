package org.hmaissi.theideamachine.downloadTweetsDEPRECATED

import grails.converters.JSON
import org.hmaissi.theideamachine.twitter.Message
import twitter4j.internal.org.json.JSONObject


class MainDownloadTweetsService {

    def getTweetsService
    def getAuthService

    //Number of tweets to return per request
    public static int COUNT = 10

    //Number of pages of tweets to download per search query
    public static int NUMBER_OF_PAGES = 5


    def start() {
        //Holds search queries
        beginDownload("I wish there was an app")
        beginDownload("should make an app")
        beginDownload("should create an app")
        beginDownload("Why isn't there a app")
        beginDownload("I wish there was an app")
        beginDownload("should make an app")
        beginDownload("should create an app")
        beginDownload("Why isn't there a app")
    }


    def beginDownload(String searchQuery) {

        String authToken = getAuthService.loadToken()

        //Page 1 load
        String json = getTweetsService.downloadTweets(authToken, searchQuery, true, 0, COUNT)
        saveTweets(json)

        //Load and save additional pages
        for (int x = 0; x < NUMBER_OF_PAGES; x++) {

            long maxId = getLastId(json)
            println maxId

            json = getTweetsService.downloadTweets(authToken, searchQuery, false, maxId, COUNT)

            saveTweets(json)
        }
    }

    /**
     * Parse each tweet from json and save to db
     * Ensures duplicate messages by tweetId are not saved
     * Also ensures messages with a url or mention are not saved
     * @param json
     */
    def saveTweets(String json) {

        String authToken = getAuthService.loadToken()

        JSONObject jsonObject = JSON.parse(json)

        for (JSONObject status : jsonObject.statuses) {

            if (containsMention(status) == false && containsUrl(status) == false) {
                Message message = new Message()
                message.retweetCount = status.retweet_count
                message.text = status.text
                message.tweetId = status.id
                message.html = getTweetsService.getTweetHtml(authToken, status.id)

                println message.text

                try {
                    message.save(failOnError: true)
                } catch (Exception e) {
                    println e.toString()
                    print "error saving status"
                    break
                }
            }

        }

    }

    //Returns the id of the last tweet in a list
    //Last id used as max_id for subsequent calls to the twitter api
    private long getLastId(String json) {
        long id = 0
        JSONObject jsonObject = JSON.parse(json)
        id = jsonObject.statuses.get(jsonObject.statuses.size() - 1).id

        return id
    }

    // Tweets containing a mention are likely part of a convo and
    // unlikely to possess a coherent single idea.
    private boolean containsMention(JSONObject status) {
        if (status.entities.user_mentions.size() == 0) {

            return false
        } else {

            return true
        }
    }

    // Tweets containing a url are likely part of a promotion and
    // unlikely to possess a coherent single idea.
    private boolean containsUrl(JSONObject status) {
        if (status.entities.urls.size() == 0) {
            return false
        } else {
            return true
        }
    }
}
